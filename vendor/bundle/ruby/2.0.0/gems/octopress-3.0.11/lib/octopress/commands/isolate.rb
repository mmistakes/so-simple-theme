module Octopress
  module Commands
    class Isolate < Command
      def self.init_with_program(p)
        p.command(:isolate) do |c|
          c.syntax 'isolate <POST> [options]'
          c.description "Move all posts not matching selected post to _posts/_exile. Command accepts path to post or search string."
          CommandHelpers.add_common_options c

          c.action do |args, options|
            options['path'] = args.first

            if options['path'] && !File.exist?(options['path'])
              options['path'] = CommandHelpers.select_posts(options['path'], 'isolate')
            end

            isolate_post(options)
          end
        end

        p.command(:integrate) do |c|
          c.syntax 'integrate'
          c.description "Reintegrate posts from _posts/_exile."
          CommandHelpers.add_common_options c

          c.action do |args, options|
            integrate_posts(options)
          end
        end
      end

      def self.isolate_post(options)
        Octopress::Isolate.new(options).isolate
      end

      def self.integrate_posts(options)
        Octopress::Isolate.new(options).integrate
      end
    end
  end
end
