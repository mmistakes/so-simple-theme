module Octopress
  module Deploy
    class Rsync

      def initialize(options)
        @options      = options
        @flags        = @options[:flags] || ' -avz'
        @user         = @options[:user]
        @port         = @options[:port]
        @local        = @options[:site_dir] || '_site'
        @remote_path  = @options[:remote_path]
        @exclude      = @options[:exclude]
        @exclude_from = @options[:exclude_from]
        @exclude_from = File.expand_path(@exclude_from) if @exclude_from
        @include      = @options[:include]
        @include_from = @options[:include_from]
        @include_from = File.expand_path(@include_from) if @include_from
        @delete       = @options[:delete] || false
        @pull_dir     = @options[:dir]
      end

      def push
        if File.exist?(@local)
          puts "Syncing #{@local} files to #{@remote_path} with rsync."
          system cmd
        else
          abort "Cannot find site build at #{@local}. Be sure to build your site first."
        end
      end

      def pull
        puts "Syncing #{@remote_path} files to #{@pull_dir} with rsync."
        system cmd
      end

      def cmd
        local = ''
        remote = ''

        cmd    =  "rsync "
        cmd    << "#{@flags} "
        cmd    << " --exclude-from #{@exclude_from}"  if @exclude_from
        Array(@exclude).each do |e|
          cmd  << " --exclude #{e}"
        end
        cmd    << " --include-from #{@include_from}"  if @include_from
        Array(@include).each do |i|
          cmd  << " --include #{i}"
        end
        cmd    << " --rsh='ssh -p#{@port}'"           if @user && @port
        cmd    << " --delete "                        if @delete

        local  << " #{File.join(@local, '')} "
        remote << " #{@user}:"                         if @user
        remote << "#{@remote_path}"

        if @pull_dir
          cmd << remote+'/ ' << @pull_dir
        else
          cmd << local << remote
        end
      end

      def self.default_config(options={})
        <<-CONFIG
#{"user: #{options[:user]}".ljust(40)}  # The user for your host, e.g. user@host.com
#{"remote_path: #{options[:remote_path]}".ljust(40)}  # Destination directory
#{"delete: #{options[:delete]}".ljust(40)}  # Remove files from destination which don't match files in source
#{"port: #{options[:port]}".ljust(40)}  # If your host requires a non standard port
#{"flags: #{options[:flags] || ' -avz'}".ljust(40)}  # Modify flags as necessary to suit your hosting setup

#{"# exclude: ".ljust(40)}  # files to exclude
#{"# exclude-from: ".ljust(40)}  # Path to file containing list of files to exclude
#{"# include: ".ljust(40)}  # files to include
#{"# include-from: ".ljust(40)}  # Path to file containing list of files to include
CONFIG
      end

    end
  end
end
