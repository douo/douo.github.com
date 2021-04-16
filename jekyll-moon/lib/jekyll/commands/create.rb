# coding: utf-8
require 'pp'
module Jekyll
  module Commands
    class Create < Command
      class << self
        def init_with_program(prog)
          prog.command(:create) do |c|
            c.syntax "create [options]"
            c.description 'Create a new Jekyll site.'
            c.option "categories", "-c CATEGORY", "--category CATEGORY", "Specify the post's category."
            c.option "tags", "--tags tag1,tag2...", "Specify the post's tags split by ','"
            PostCreator.init_with_create(c)
            NoteCreator.init_with_create(c)
            c.action do
              Jekyll.logger.abort_with "Subcommand can not be empty."
            end
          end
        end

        # scaffold 文件存放的位置位于  jekyll-moon/_scaffolds/
        # collection, 支持 post 和 note
        # liquid 模板
        def scaffold(collection)
          File.read(File.absolute_path("../../../../_scaffolds/#{collection}.html",__FILE__))
        end

        def write_document(name, content,source)
          name = File.join(source,name) if source
          FileUtils.mkdir_p(File.dirname(name))
          Jekyll.logger.abort_with "#{name} already existed" if File.exist? name
          f = File.new(name, "w")
          f.write(content)
          f.close
          name
        end

        def hyphenate(string)
          string = string.to_s.downcase.strip.gsub(/[^\p{Word}+]/u, '-')
          string.gsub(/^\-+/, '').gsub(/\-+$/, '').gsub(/\-+/, '-')
        end
      end
    end


    class NoteCreator
      class << self
        def init_with_create(cmd)
          cmd.command(:note) do |c|
            c.syntax "note [name] [options]"
            c.description 'Create a new note.'
            c.action do |args, options|
              process(args, options)
            end
          end
        end

        def process(args, options)
          collection = "note"
          if args[0]
            data = { 'title' => args[0],
                     'date' => Time.now.strftime("%Y-%m-%d"),
                     'name' => "#{Create.hyphenate(args[0])}"}
          else
            data = quick_note_data
          end

          options['tags'] = options['tags'].split(',') if options['tags'] if options.has_key? 'tags'
          data = options.merge(data)
          if data['categories']
            # 将路径 "_notes/wtf/wtf" 替换为 " wtf/wtf"
            cate = data['categories']
                     .split('/')
                     .reject{ |s| s.start_with? '_' }
                     .join('/')
            name = "_notes/#{cate}/#{data['name']}.md"
          else
            name = "_notes/#{data['name']}.md"
          end
          content = Liquid::Template.parse(Create.scaffold(collection)).render(
            data
          )
          Jekyll.logger.info "#{collection.capitalize} \"#{data['title']}\" created in \n#{Create.write_document(name, content, options['source'])}"
        end

        def quick_note_data
          quick_title = "%Y年%m月%d日杂记" # 快捷笔记的标题，为空的时候没标题
          quick_name = "note-%Y-%m-%d"  # 快捷笔记的文件名
          quick_dir = "Quick/%Y/%m" # 快捷笔记按月分类的路径，归属到 default_dir
          date = Time.now
          { 'title' => date.strftime(quick_title),
            'name' =>  date.strftime(quick_name),
            'categories' => date.strftime(quick_dir),
            'date' => date.strftime("%Y-%m-%d")
          }
        end
      end
    end

    class PostCreator
      class << self
        def init_with_create(cmd)
          cmd.command(:post) do |c|
            c.syntax "post name [options]"
            c.description 'Create a new post.'
            c.action do |args, options|
            Jekyll.logger.abort_with "title can not be empty." unless args[0]
            process(args, options)
            end
          end
        end

        def process(args, options)
          collection = "post"
          data = { 'title' => args[0] }
          options['tags'] = options['tags'].split(',') if options['tags'] if options.has_key? 'tags'
          name = "_posts/#{Time.now.strftime("%Y-%m-%d")}-#{Create.hyphenate(data['title'])}.md"
          content = Liquid::Template.parse(Create.scaffold('post')).render(
            data.merge(options)
          )
          Jekyll.logger.info "#{collection.capitalize} \"#{data['title']}\" created in \n#{Create.write_document(name, content, options['source'])}"
        end
      end
    end
  end
end
