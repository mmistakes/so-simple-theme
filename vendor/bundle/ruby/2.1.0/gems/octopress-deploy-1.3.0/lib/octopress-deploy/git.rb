module Octopress
  module Deploy
    class Git

      def initialize(options={})
        @options     = options
        @repo        = @options[:git_url]
        @branch      = @options[:git_branch]   || 'master'
        @remote      = @options[:remote]       || 'deploy'
        @remote_path = @options[:remote_path]  || ''
        @remote_path = @remote_path.sub(/^\//,'') #remove leading slash
        @local       = File.expand_path(@options[:site_dir]  || '_site')
        @deploy_dir  = File.expand_path(@options[:deploy_dir] || '.deploy')
        @pull_dir    = @options[:dir]
        abort "Deploy Failed: Configure a git_url in #{@options[:config_file]} before deploying.".red if @repo.nil?
      end

      # Initialize, pull, copy and deploy.
      #
      def push
        if File.exist?(@local)
          check_branch
          init_repo
          puts "Syncing #{@local.sub(Dir.pwd.strip+'/', '')} files to #{@repo}."
          FileUtils.cd @deploy_dir do
            git_pull
            clean_deploy
            copy_site
            git_push
          end
        else
          abort "Cannot find site build at #{@local}. Be sure to build your site first."
        end
      end

      def pull
        `git clone -b #{@branch} #{@repo} #{@pull_dir}`
      end

      # Ensure that the deploy branch is not that same as the current working branch
      #
      def check_branch
        same_branch = `git branch -a` =~ /\* #{@branch}/

        if current_remote = `git remote -v`.match(/\s\S+/)
          same_remote = current_remote[0].match(/#{@repo}/)
        end

        if same_remote && same_branch
          puts "Deploy to #{@branch} canceled:".red
          puts "You cannot deploy to the same branch you are working in. This will overwrite the source for your site.\n"
          puts "First, back up your site's source to a branch:"
          puts "\n  git checkout -b source".yellow
          puts "  git push origin source".yellow
          puts "\nWith that, you'll work in the #{"source".bold} branch and deploy to the #{@branch.bold} branch."
          abort
        end
      end

      # Check to see if local deployment dir is configured to deploy.
      #
      def check_deploy_dir
        if Dir.exist? @deploy_dir
          FileUtils.cd @deploy_dir do
            return `git remote -v`.include? @repo
          end
        end
      end

      def self.default_config(options={})
        config = <<-CONFIG
#{"git_url: #{options[:git_url]}".ljust(40)}  # remote repository url, e.g. git@github.com:username/repo_name

# Note on git_branch:
# If using GitHub project pages, set the branch to 'gh-pages'.
# For GitHub user/organization pages or Heroku, set the branch to 'master'.
#
#{"git_branch: #{options[:git_branch] || 'master'}".ljust(40)}  # Git branch where static site files are commited

CONFIG
        config << "\n# " unless options[:remote_path]
        config << "#{"remote_path: #{options[:remote_path]}".ljust(38)}  # Destination directory"
      end

      # If necessary create deploy directory and initialize it with deployment remote.
      #
      def init_repo
        return if check_deploy_dir
        FileUtils.mkdir_p @deploy_dir
        FileUtils.cd @deploy_dir do
          if Dir[@deploy_dir+'/*'].empty?

            # initialize the repository and add the remote.
            #
            `git init`
            `git remote add #{@remote} #{@repo}`

            # Attempt to pull from the remote.
            #
            if git_pull
              `git branch -m #{@branch}`

            # If no branch exists on remote, create one locally.
            else
              `echo "initialize deploy repo" > _`
              `git add .`
              `git commit -m \"initial commit\"`
              `git branch -m #{@branch}`
              `git rm _`
              `git add -u`
              `git commit -m 'cleanup'`
            end
          end
        end
      end

      def git_push
        if `git remote -v` =~ /#{@remote}\s+#{Regexp.quote(@repo)}.+\(push\)/
          `git push #{@remote} #{@branch}`
        else
          remotes = `git remote -v`
          push_remote = remotes.match(/^origin\s+(.+)\s+\(push\)/)
          if push_remote
            abort %Q{Deployment remote #{@remote} is pointing to "#{push_remote[1]}" but configuration points to #{@remote}
  To reset your deployment, run:
  rm -rf #{@deploy_dir}
  octopress deploy}
          else
            abort %Q{Deployment remote configured improperly. To reset your deployment run:
  rm -rf #{@deploy_dir}
  octopress deploy}
          end
        end
      end

      # Attempt to pull from the remote branch
      #
      def git_pull
        if `git branch -a` =~ /remotes\/#{@remote}\/#{@branch}/ ||
           `git ls-remote #{@remote}` =~ /refs\/heads\/#{@branch}/
             `git pull #{@remote} #{@branch}`
        end
      end

      # Remove files in deploy dir, ensuring a 1:1 site files deployment.
      #
      def clean_deploy
        FileUtils.rm_rf(Dir.glob('*'), secure: true)
      end

      # Copy site files into deploy dir.
      #
      def copy_site
        target_dir = File.join(@deploy_dir, @remote_path).sub(/\/$/,'')
        FileUtils.cp_r @local + '/.', target_dir
        message = "Site updated at: #{Time.now.utc}"
        `git add --all .`
        `git commit -m \"#{message}\"`
      end
    end
  end
end
