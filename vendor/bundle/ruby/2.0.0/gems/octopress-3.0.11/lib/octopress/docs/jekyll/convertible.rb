module Octopress
  module Docs
    module Convertible
      include Jekyll::Convertible

      # Read the YAML frontmatter.
      #
      # base - The String path to the dir containing the file.
      # name - The String filename of the file.
      # opts - optional parameter to File.read, default at site configs
      #
      # Returns nothing.
      def read_yaml(base, name, opts = {})
        begin
          self.content = File.read(File.join(base, name),
                                   merged_file_read_opts(opts))
          if content =~ /\A(---\s*\n.*?\n?)^((---|\.\.\.)\s*$\n?)/m
            self.content = $POSTMATCH
            self.data = SafeYAML.load($1)
          end
        rescue SyntaxError => e
          Jekyll.logger.warn "YAML Exception reading #{File.join(base, name)}: #{e.message}"
        rescue Exception => e
          Jekyll.logger.warn "Error reading file #{File.join(base, name)}: #{e.message}"
        end

        self.data ||= {}
      end
    end
  end
end

