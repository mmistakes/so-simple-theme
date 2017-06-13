require "fileutils"

module Jekyll
  class JekyllFeed < Jekyll::Generator
    safe true
    priority :lowest

    # Main plugin action, called by Jekyll-core
    def generate(site)
      @site = site
      @site.config["time"] = Time.new
      unless file_exists?(feed_path)
        @site.pages << content_for_file(feed_path, feed_source_path)
      end
      unless file_exists?(xslt_path)
        @site.pages << content_for_file(xslt_path, xslt_source_path)
      end
    end

    private

    # Path to feed from config, or feed.xml for default
    def feed_path
      if @site.config["feed"] && @site.config["feed"]["path"]
        @site.config["feed"]["path"]
      else
        "feed.xml"
      end
    end

    # Path to feed stylesheet from config
    def xslt_path
      "feed.xslt.xml"
    end

    # Path to feed.xml template file
    def feed_source_path
      File.expand_path "../feed.xml", File.dirname(__FILE__)
    end

    # Path to the feed.xslt.xml template file
    def xslt_source_path
      File.expand_path "../feed.xslt.xml", File.dirname(__FILE__)
    end

    # Checks if a file already exists in the site source
    def file_exists?(file_path)
      if @site.respond_to?(:in_source_dir)
        File.exist? @site.in_source_dir(file_path)
      else
        File.exist? Jekyll.sanitized_path(@site.source, file_path)
      end
    end

    # Generates contents for a file
    def content_for_file(file_path, file_source_path)
      file = PageWithoutAFile.new(@site, File.dirname(__FILE__), "", file_path)
      file.content = File.read(file_source_path).gsub(/(?<!\")\s+([<{])/, '\1')
      file.data["layout"] = nil
      file.data["sitemap"] = false
      file.output
      file
    end
  end
end
