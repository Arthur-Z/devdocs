module Docs
  class Docker
    class CleanHtmlFilter < Filter
      def call
        if root_page?
          doc.inner_html = "<h1>Docker Documentation</h1>"
          return doc
        end

        @doc = at_css('#DocumentationText')

        at_css('h2').name = 'h1' unless at_css('h1')

        css('.anchorLink').remove

        css('pre').each do |node|
          node.content = node.content
        end

        doc
      end
    end
  end
end
