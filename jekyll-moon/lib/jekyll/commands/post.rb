require 'pp'
module Jekyll
  module Commands
    class Post < Command
      class << self
        def init_with_program(prog)
          prog.command(:create) do |c|
            c.syntax "create [collection] [name]"
            c.action do |args, options|
              pp args
              pp options
            end
          end
        end
        def options

        end
      end
    end
  end
end
