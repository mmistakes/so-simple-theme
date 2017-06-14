require 'find'

module Octopress
  class Isolate
    attr_accessor :site

    def initialize(options)
      @options = options
      @site = Octopress.site(@options)
    end

    def integrate
      dir = File.join(site.source, '_posts')
      exile_dir = File.join(dir, '_exile')
      if Dir.exist?(exile_dir)
        posts = CommandHelpers.find_exiled_posts
        if posts.size > 0
          FileUtils.mv(posts, dir)
          FileUtils.rmdir(File.join(dir, '_exile'))

          puts "Reintegrated #{posts.size} post#{'s' if posts.size != 1} from _posts/_exile"
        else
          abort "There aren't any posts in _posts/_exile."
        end
      else
        abort "There aren't any posts in _posts/_exile."
      end
    end

    def isolate
      post = File.expand_path(@options['path']) if @options['path']
      others = (post ? find_other_posts(post) : CommandHelpers.find_posts)
      exile_dir = File.join(site.source, '_posts/_exile')

      FileUtils.mkdir_p(exile_dir)
      FileUtils.mv(others, exile_dir)

      count = (post ? others.size : "all #{others.size}")

      puts "Moved #{count} post#{'s' if others.size != 1} into _posts/_exile"
      puts "Isolated: " << "#{post.sub(Octopress.site.source + '/_posts/', '')}".yellow if post
    end

    def find_other_posts(path)
      CommandHelpers.find_posts.reject { |p| p == path }
    end

    def default_array(input)
      i = input || []
      i = [i] unless i.is_a?(Array)
      i
    end

  end
end
