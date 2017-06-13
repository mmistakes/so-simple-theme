module Jekyll
  class FeedMetaTag < Liquid::Tag
    def render(context)
      @context = context
      attrs    = attributes.map { |k, v| %(#{k}="#{v}") }.join(' ')
      "<link #{attrs} />"
    end

    private

    def config
      @context.registers[:site].config
    end

    def attributes
      {
        :type => 'application/atom+xml',
        :rel => 'alternate',
        :href => "#{url}/#{path}",
        :title => title
      }.keep_if { |_, v| v }
    end

    def path
      if config["feed"] && config["feed"]["path"]
        config["feed"]["path"]
      else
        "feed.xml"
      end
    end

    def url
      if config["url"]
        URI.join(config["url"], config["baseurl"])
      elsif config["github"] && config["github"]["url"]
        config["github"]["url"]
      end
    end

    def title
      config["title"] || config["name"]
    end
  end
end

Liquid::Template.register_tag("feed_meta", Jekyll::FeedMetaTag)
