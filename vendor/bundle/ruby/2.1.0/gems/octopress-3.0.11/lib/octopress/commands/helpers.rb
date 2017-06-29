module Octopress
  module CommandHelpers
    extend self

    def add_page_options(c)
      c.option 'date',     '-d', '--date DATE', "Use 'now' or a String that is parseable by Time#parse."
      c.option 'template', '-T','--template PATH', "New #{c.name.to_s} from a template."
      c.option 'force',    '-f', '--force', 'Overwrite file if it already exists'
    end

    def add_common_options(c)
      c.option 'config',    '-c', '--config <CONFIG_FILE>[,CONFIG_FILE2,...]', Array, 'Custom Jekyll configuration file'
    end

    def select_posts(search, action)
      posts = (action == 'publish' ? find_drafts : find_posts)
      posts = search_posts(search, posts)

      if posts.size > 1
        post = prompt_for_selection(posts, search, action)

        if post.is_a? Integer
          posts[post - 1]
        else
          abort "#{action.capitalize} canceled: You didn't enter number."
        end
      else
        posts.first
      end
    end

    def find_drafts
      @drafts ||= begin
        dir = File.join(Octopress.site.source, '_drafts')
        Find.find(dir).to_a.reject do |f| 
          File.directory?(f)
        end
      end
    end
  
    def find_all_posts
      @posts ||= begin
        dir = File.join(Octopress.site.source, '_posts')
        Find.find(dir).to_a.reject do |f| 
          File.directory?(f)
        end
      end
    end

    def find_posts
      find_all_posts.reject { |f| f =~ /_exile\// }
    end

    def find_exiled_posts
      find_all_posts.select { |f| f =~ /_exile\// }
    end

    def search_posts(search, posts)
      posts = posts.select do |p|
        p =~ /#{search.gsub(/\s/, '-')}/i 
      end
      if posts.empty?
        abort (STDOUT.tty? ? "No posts found matching: #{search}".red : '')
      else
        posts
      end
    end

    def prompt_for_selection(posts, search, action)
      abort if !STDOUT.tty?

      puts "Found #{posts.size} posts matching: '#{search}'"
      posts.each_with_index do |p, i| 
        post = p.sub(/#{Octopress.site.source}\/_(posts|drafts)\//, '')
        puts "  #{i+1}) #{post}"
      end

      print "Which do you want to #{action}? (enter a number): "
      $stdout.flush
      post = $stdin.gets.strip.to_i

      # Give a newline for further output
      puts ''

      # Handle invalid input (because "oops".to_i == 0)
      (post == 0 ? nil : post)
    end

  end
end
