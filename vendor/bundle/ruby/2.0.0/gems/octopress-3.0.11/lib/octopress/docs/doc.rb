module Octopress
  module Docs
    class Doc
      attr_reader :filename, :name, :slug, :base_url, :type, :description, :source_url, :version, :gem

      def initialize(options={})
        @file            = options[:file]
        @path            = options[:path] ||= '.'
        @file_dir        = File.dirname(@file)
        @name            = options[:name]
        @slug            = options[:slug]
        @type            = options[:type]
        @base_url        = options[:base_url]
        @source_url      = options[:source_url]
        @description     = options[:description]
        @data            = options[:data] || {}
        @gem             = options[:gem]
        @version         = options[:version]
      end

      # Add doc page to Jekyll pages
      #
      def add
        Octopress.site.pages << page
      end

      def disabled?
        false
      end

      def file
        File.basename(@file)
      end

      def info
        "  - #{permalink.ljust(35)}"
      end

      def page
        @page ||= begin
          p = Octopress::Docs::Page.new(Octopress.site, @path, page_dir, file, {'path'=>@base_url})
          p.data['layout'] = 'docs'
          p.data['escape_code'] = true

          p.data['plugin'] = { 
            'name'        => @name, 
            'slug'        => @slug,
            'type'        => @type,
            'source_url'  => @source_url,
            'description' => @description,
            'url'         => @base_url,
            'version'     => @version,
            'gem'         => @gem,
          }

          p.data['dir'] = doc_dir
          p.data = @data.merge(p.data)
          p.data.merge!(comment_yaml(p.content))
          p
        end
      end

      private

      def permalink
        File.basename(file, ".*")
      end

      def read
        File.open(File.join(@path, @file)).read
      end

      def plugin_slug
        Jekyll::Utils.slugify(@type == 'theme' ? 'theme' : @slug)
      end

      def page_dir
        @file_dir == '.' ? '' : @file_dir
      end

      def doc_dir
        File.join(@path, page_dir, File.dirname(@file))
      end

      def comment_yaml(content)
        if content =~ /<!-{3}\s+(.+)?-{3}>/m
          SafeYAML.load($1)
        else
          {}
        end
      end
    end
  end
end

