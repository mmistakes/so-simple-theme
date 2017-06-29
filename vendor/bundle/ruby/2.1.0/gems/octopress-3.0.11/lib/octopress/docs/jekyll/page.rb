module Octopress
  module Docs
    class Page < Jekyll::Page
      include Docs::Convertible

      # Purpose: Configs can override a page's permalink
      #
      # url - Path relative to destination directory.
      #       examples: 
      #         - '/' for the _site/index.html page
      #         - '/archive/' for the _site/archive/index.html page
      #
      def initialize(site, base, dir, name, config={})
        @config = config
        super(site, base, dir, name)
        post_init if respond_to?(:post_init)
      end

      def destination(dest)
        unless @dest
          if @config['path']
            dest = File.join(dest, @config['path'])
          end
          @dest = File.join(dest, self.url)
        end
        @dest
      end

      def relative_asset_path
        site_source = Pathname.new Docs.site.source
        page_source = Pathname.new @base
        page_source.relative_path_from(site_source).to_s
      end

      # Allow pages to read url from plugin configuration
      #
      def url
        unless @url
          super

          if @url && @url =~ /\/$/
            ext = (self.ext == '.xml'? 'xml' : 'html')
            @url = File.join(@url, "index.#{ext}")
          end
        end

        @url
      end
    end
  end
end

