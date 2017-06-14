module Octopress
  class Publish < Command
    def self.init_with_program(p)
      p.command(:publish) do |c|
        c.syntax 'publish <DRAFT> [options]'
        c.description 'Convert a draft to a normal published post.'
        c.option 'date', '--date DATE', 'String that is parseable by Time#parse. (default: Time.now.iso8601)'
        c.option 'force', '--force', 'Overwrite file if it already exists'
        c.option 'dir', '--dir DIR', 'Create post at _posts/DIR/.'
        CommandHelpers.add_common_options c

        c.action do |args, options|
          abort "You didn't specify a post." if args.empty?
          options['path'] = args.first
          options['type'] = 'post from draft'

          if !options['path']
            abort "Publish failed: Please provide a path or a search string to select your post."
          end

          if File.exist?(options['path'])
            publish_post(options)
          else
            options['path'] = CommandHelpers.select_posts(options['path'], 'publish')
            publish_post(options)
          end
        end
      end
    end

    def self.publish_post(options)
      Draft.new(Octopress.site(options), options).publish
    end
  end
end

