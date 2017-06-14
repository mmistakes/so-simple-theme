module Octopress
  class Init < Command
    def self.init_with_program(p)
      p.command(:init) do |c|
        c.syntax 'init <PATH> [options]'
        c.description "Add Octopress's default scaffolding to your site."
        c.option 'force', '-f', '--force', 'Overwrite files if they already exist.'

        c.action do |args, options|
          Scaffold.new(args, options).write
        end
      end
    end
  end
end
