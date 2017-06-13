# The `strip` filter was added to Liquid in version 3
# Jekyll did not require Liquid 3 until Jekyll 3.0.0
# This shim is needed for compatibility with Jekyll 2.x

module Jekyll
  module StripWhitespace
    def strip(input)
      input.to_s.strip
    end
  end
end

unless Liquid::StandardFilters.method_defined?(:strip)
  Liquid::Template.register_filter(Jekyll::StripWhitespace)
end
