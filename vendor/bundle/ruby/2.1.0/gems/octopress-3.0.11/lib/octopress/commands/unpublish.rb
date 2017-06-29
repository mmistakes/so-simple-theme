module Octopress
  class Unpublish < Command
    def self.init_with_program(p)
      p.command(:unpublish) do |c|
        c.syntax 'unpublish <POST> [options]'
        c.option 'force', '--force', 'Overwrite draft if it already exists'
        c.description 'Convert a post to a draft. Command accepts path to post or search string.'
        CommandHelpers.add_common_options c

        c.action do |args, options|
          options['path'] = args.first
          options['type'] = 'draft from post'

          if !options['path']
            abort "Unpublish failed: Please provide a path or a search string to select your post."
          end
          if File.exist?(options['path'])
            unpublish_post(options)
          else
            options['path'] = CommandHelpers.select_posts(options['path'], 'unpublish')
            unpublish_post(options)
          end
        end
      end
    end

    def self.unpublish_post(options)
      Post.new(Octopress.site(options), options).unpublish
    end
  end
end

