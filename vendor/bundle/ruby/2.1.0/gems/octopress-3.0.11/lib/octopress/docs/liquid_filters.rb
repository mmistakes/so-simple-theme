# For plugin authors who need to generate urls pointing to ther doc pages.
module DocsFilters
  def docs_source_url(input)
    if input =~ /github.com/
      label = "GitHub"
    else
      label = "source"
    end
    "<a href='#{input}'>#{label}</a>"
  end
end

Liquid::Template.register_filter(DocsFilters)

