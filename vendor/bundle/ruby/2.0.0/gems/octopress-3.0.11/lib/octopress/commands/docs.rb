module Octopress
  module Docs
    class Commands < Octopress::Command
      def self.init_with_program(p)
        p.command(:docs) do |c|
          c.syntax 'octopress docs'
          c.description "Launch local server with docs for Octopress v#{Octopress::VERSION} and Octopress plugins."

          c.option 'port', '-P', '--port [PORT]', 'Port to listen on'
          c.option 'host', '-H', '--host [HOST]', 'Host to bind to'
          if ENV['OCTODEV']
            c.option 'watch', '--watch', 'Watch docs site for changes and rebuild. (For docs development)'
          end

          c.action do |args, options|
            serve_docs(options)
          end
        end
      end

      def self.serve_docs(options)

        # Activate dependencies for serving docs.
        #
        options = Docs.load_docs(options)

        if defined? Octopress::Ink
          Octopress::Ink.load_plugin_assets = false
        end

        
        Jekyll.logger.log_level = :error
        Jekyll::Commands::Build.process(options)
        url = "http://#{options['host']}:#{options['port']}"
        puts "Serving Docs site: #{url}"
        puts "  press ctrl-c to stop."
        Jekyll::Commands::Serve.process(options)
        Jekyll.logger.log_level = :info
      end

    end
  end
end

