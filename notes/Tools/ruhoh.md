### ruhoh ###

看 ruhoh 的代码第一句就看不懂了。。。

	$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])

`$:` 是 ruby 的 load path ，是一个数组对象，unshift 则是将对象插入到数组头部。File.join 将参数列表返回成路径 ，如
	
	File.join("usr", "mail", "gumby")   #=> "usr/mail/gumby"

`*%w[.. lib]`，`%w[foo bar]` 等同于 `["foo","bar"]` ，`%w` 允许你不用引号和分号来创建数组，是ruby [%表示法][]的一种。而`*`在数组作为参数的时候用来拆开数组。如 `f(*[a,b,c]) => f(a,b,c)` ，相同的 `f(*a)` 就是表示可变参数。

所以上面代码的意思就是将 `./../lib` 加入到 load path



[%表示法]: http://www.kuqin.com/rubycndocument/man/syntax_literal.html#a.25.b5.ad.cb.a1


### 插件 ###

####  Templaters Helper ####

用來增強模板語言功能的插件，也就是Mustache，Mustache 要做到Logic Less
所以涉及到邏輯的代碼就可以通過 Templaters Helper 實現。

一個基本的Templaters Helper 是這樣的。

    class Ruhoh
      module Templaters
        module Helpers
          def greeting
            "Hello there! How are you?"
          end
          def raw_code(sub_context)
            code = sub_context.gsub('{', '&#123;').gsub('}', '&#125;').gsub('<', '&lt;').gsub('>', '&gt;')
            "<pre><code>#{code}</code></pre>"
          end
        end
      end
    end


`{{greeting}}`將會被替換成`Hello there! How are you?`

帶有參數的則可以這樣用

    {{#rawcode}}
        <h1>{{ page.title }}</h1>
        <p>{{ page.date }}</p>
        <p>
        Link: <a href="{{page.url}}">{{page.title}}</a>
        </p>
	{{/rawcode}}
	
`rawcode` 稱爲Block Helper

##### Contextual Helpers #####

暫時想不到什麼應用

#### Custom Converters ####

ruhoh 默認的轉換器，只有 markdown 一個。這是默認的實現

    class Ruhoh
      module Converter
        module Markdown
          def self.extensions
            ['.md', '.markdown']
          end
          def self.convert(content)
            require 'redcarpet'
            markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(:with_toc_data => true),
              :autolink => true, 
              :fenced_code_blocks => true, 
            )
            markdown.render(content)
          end
        end
      end
    end


可以在轉換前做一些預處理，當成給 markdown 做語法擴展的工具。也可以更換
markdown引擎

    class Ruhoh
      module Converter
        module Markdown
		  # 過濾文件
          def self.extensions
            ['.md', '.markdown']
          end
          def self.convert(content)
            require 'kramdown'
            Kramdown::Document.new(content).to_html
          end
        end
      end
    end
	
也可以增加不同類型的轉換

    class Ruhoh
      module Converter
        module Upcase
          def self.extensions
            ['.up', '.upcase']
          end
          def self.convert(content)
            content.upcase
          end
        end
      end
    end

#### Compiler Methods ####
---
title:  Ruhoh
date: '2012-09-01'
description:
---
增加編譯任務，基本結構如下，Task 是自定義的任務名，必須有一個 run 的類
方法。
    
    class Ruhoh
      module Compiler
        module Task
          def self.run(target, page)
              #target
    		  #page
    	  end
        end #Task
      end #Compiler
    end #Ruhoh

具體看看 rss 和 sitemap 的實現

### 扩展命令的流程

1 在 client 中声明命令,和命令的处理方法
2 在Ruhoh::Names 中增加命令名称
3 Ruhoh::Paths 中声明需要用到的路径
4 Ruhoh::Urls 中声明url
5 实现新的parser,新文件要在gemspec中声明
6 在Ruhoh::DB 中的 whitelist 声明新的parser,顺序很重要
7.在Ruhoh::Config 聲明默認模板

### TOC

之前用自定义的Markdown converter 实现了toc，但只能将toc 加到文档的前面，
或者markdown渲染出来的文件的其他地方。太不灵活了，希望可以通过Mustache
helper的模式来加入toc

只能支持markdown
必须解析两次


分為兩個部分toc 生成,正文生成

將tocplus 改為默認隱藏


### Ruhoh 2

DB 现在都是懒性加载

#### Resources

resources 有八个模块

- collection
- collection_view
- model
- model_view
- client
- compiler
- watcher
- previewer


##### client

生成命令参数，非必须。

##### watcher

用于在preview的时候实时监听文件改动

```
watchers.each {|watcher|
            next unless watcher.match(path)
            watcher.update(path)
            Ruhoh::Friend.say {
              yellow "Watch [#{Time.now.strftime("%H:%M:%S")}] [Update #{path}] : #{args.size} files changed"
            }
```

##### previewer

 Rack application used to render singular pages via their URL.
 
##### compiler


##### converter

Converter 无法访问到全局的ruhoh对象 (@ruhoh)

### 数据的组织方式



###

在 cygwin 上升级 ruhoh 2.6 的时候，遇到这个错误：

	/cygdrive/x/cloud/ruhoh.rb/lib/ruhoh.rb:3:in `require': cannot load such file -- json (LoadError)
        from /cygdrive/x/cloud/ruhoh.rb/lib/ruhoh.rb:3:in `<top (required)>'
        from /usr/lib/ruby/gems/1.9.1/gems/bundler-1.2.0/lib/bundler/runtime.rb:68:in `require'
        from /usr/lib/ruby/gems/1.9.1/gems/bundler-1.2.0/lib/bundler/runtime.rb:68:in `block (2 levels) in require'
        from /usr/lib/ruby/gems/1.9.1/gems/bundler-1.2.0/lib/bundler/runtime.rb:66:in `each'
        from /usr/lib/ruby/gems/1.9.1/gems/bundler-1.2.0/lib/bundler/runtime.rb:66:in `block in require'
        from /usr/lib/ruby/gems/1.9.1/gems/bundler-1.2.0/lib/bundler/runtime.rb:55:in `each'
        from /usr/lib/ruby/gems/1.9.1/gems/bundler-1.2.0/lib/bundler/runtime.rb:55:in `require'
        from /usr/lib/ruby/gems/1.9.1/gems/bundler-1.2.0/lib/bundler.rb:128:in `require'
        from /cygdrive/x/cloud/ruhoh.rb/bin/ruhoh:9:in `<main>'


必须在 Gemfile 中手动添加

	gem 'json'

才行。


