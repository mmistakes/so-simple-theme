# -*- coding: utf-8 -*-
#
#--
# Copyright (C) 2009-2016 Thomas Leitner <t_leitner@gmx.at>
#
# This file is part of kramdown which is licensed under the MIT.
#++
#

module Kramdown::Converter::MathEngine

  # Uses the MathJax javascript library for displaying math.
  #
  # Note that the javascript library itself is not include or linked, this has to be done
  # separately. Only the math content is marked up correctly.
  module Mathjax

    def self.call(converter, el, opts)
      type = el.options[:category]
      text = (el.value =~ /<|&/ ? "% <![CDATA[\n#{el.value} %]]>" : el.value)
      text.gsub!(/<\/?script>?/, '')

      preview = preview_string(converter, el, opts)

      attr = {:type => "math/tex#{type == :block ? '; mode=display' : ''}"}
      if type == :block
        preview << converter.format_as_block_html('script', attr, text, opts[:indent])
      else
        preview << converter.format_as_span_html('script', attr, text)
      end
    end

    def self.preview_string(converter, el, opts)
      preview = converter.options[:math_engine_opts][:preview]
      return '' unless preview

      preview = (preview == true ? converter.escape_html(el.value) : preview.to_s)

      if el.options[:category] == :block
        converter.format_as_block_html('div', {'class' => 'MathJax_Preview'}, preview, opts[:indent])
      else
        converter.format_as_span_html('span', {'class' => 'MathJax_Preview'}, preview)
      end
    end

  end

end
