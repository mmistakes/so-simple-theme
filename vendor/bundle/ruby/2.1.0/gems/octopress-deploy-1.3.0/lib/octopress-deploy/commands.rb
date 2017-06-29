module Octopress
  module Deploy
    class Commands < Octopress::Command
      def self.init_with_program(p)
        p.command(:deploy) do |c|
          c.syntax "deploy [options]"
          c.version Deploy::VERSION
          c.description "Deploy your Octopress site."
          c.option "config_file", "-c", "--config FILE", "The path to your config file (default: _deploy.yml)"

          c.action do |args, options|
            Octopress::Deploy.push(options)
          end

          c.command(:pull) do |c|
            c.syntax "pull <DIR>"
            c.description "Pull down the published copy of your site into DIR"
            c.option 'force', '-f', '--force', 'Overwrite existing files on pull'
            c.option "config_file", "-c", "--config FILE", "The path to your config file (default: _deploy.yml)"

            c.action do |args, options|
              options['dir'] = args.first
              Octopress::Deploy.pull(options)
            end
          end

          c.command(:init) do |c|
            c.syntax 'init <METHOD> [options]'
            c.description "Create a configuration file for a deployment method (#{Deploy::METHODS.keys.join(', ')})."

            c.command(:rsync) do |c|
              c.syntax 'rsync [options]'
              c.description "Create an rsync deployment configuration file."
              c.option 'user', '-u', '--user USER', 'SSH user (e.g. username@host.org)'
              c.option 'port', '-p', '--port PORT', 'SSH port (default: 22)'
              c.option 'flags', '-F', '--flags FLAGS', 'Flags to pass to Rsync command (default: -avz)'
              c.option 'remote_path', '--dir DIR', 'Path to site directory on host (e.g. ~/webroot/)'
              c.option 'delete', '--delete', 'Sync file deletion'
              add_common_init_options(c)

              c.action do |args, options|
                options['method'] = 'rsync'
                Octopress::Deploy.init_config(options)
              end
            end

            c.command(:git) do |c|
              c.syntax 'git <URL> [options]'
              c.description "Create a git deployment configuration file."
              c.option 'git_branch', '-b', '--branch NAME', 'Branch to deploy to (default: master)'
              c.option 'remote_path', '-d', '--dir DIR', 'Deploy site into a subdirectory.'
              c.option 'delete', '--delete', 'Sync file deletion'
              add_common_init_options(c)

              c.action do |args, options|
                options['method'] = 'git'
                options['git_url'] = args.first
                if options['git_url']
                  options['git_url'] = options['git_url'].sub(/^\./, Dir.pwd)
                else
                  $stderr.puts "git url missing"
                  puts c # print the help
                  abort
                end
                Octopress::Deploy.init_config(options)
              end
            end

            c.command(:s3) do |c|
              c.syntax 's3 [options]'
              c.description "Create an S3 deployment configuration file."
              c.option 'bucket_name', '-b', '--bucket NAME', 'S3 Bucket name'
              c.option 'access_key_id', '-a', '--access KEY', 'Access key id'
              c.option 'secret_access_key', '-s', '--secret KEY', 'Secret access key'
              c.option 'region', '-r', '--region REGION', 'AWS region (default: us-east-1)'
              c.option 'remote_path', '-d', '--dir DIR', 'Deploy site into a subdirectory.'
              c.option 'verbose', '-v', '--verbose', 'Log verbose output when deploying'
              c.option 'incremental', '-i', '--incremental', 'Only upload new/changed files'
              c.option 'delete', '--delete', 'Sync file deletion'
              add_common_init_options(c)

              c.action do |args, options|
                options['method'] = 's3'
                Octopress::Deploy.init_config(options)
              end
            end
          end

          c.command(:'add-bucket') do |c|
            c.syntax 'add-bucket <NAME> [options]'
            c.description "Add a new S3 bucket and configure it for static websites. Name defaults to bucket_name in config file"
            c.option 'region','--region REGION','Choose a region. (Defaults: to region in config file)'
            c.option 'index_page','--index PAGE','Specify an index page. (Default: index.html)'
            c.option 'error_page','--error PAGE','Specify an error page. (Default: 404.html)'
            c.option "config_file", "-c", "--config FILE", "The path to your config file (default: _deploy.yml)"

            c.action do |args, options|
              options['bucket_name'] = args.first
              Octopress::Deploy.add_bucket(options)
            end
          end
        end
      end

      def self.add_common_init_options(c)
        c.option 'site_dir', '--site DIR', 'Path to generated site (default: _site).'
        c.option 'force', '-f', '--force', 'Overwrite any exiting config file.'
        c.option 'config_file', "-c", '--config FILE', 'Choose a config file name. (default. _deploy.yml)'
      end
    end
  end
end
