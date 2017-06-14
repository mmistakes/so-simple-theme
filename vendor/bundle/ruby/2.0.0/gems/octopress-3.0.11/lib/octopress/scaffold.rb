require 'find'

module Octopress
  class Scaffold
    attr_reader :path, :force

    def initialize(args, options)
      @path  = init_path(args)
      @force = !!options['force']
      @blank = !!options['blank']
    end

    def init_path(args)
      path = File.expand_path(args.join(" "), Dir.pwd)
      config_file = File.join(path, '_config.yml') 

      # If there is a Jekyll configuration file present
      # Add template to source directory
      if File.exist?(config_file)
        config = SafeYAML.load_file(config_file)
        if config['source']
          path = File.join(path, config['source'])
        end
      end
      path
    end
    
    def write
      if !@force && File.exist?(File.join(path, '_templates'))
        abort "Some files already exist.  Use --force to overwrite."
      end

      FileUtils.cp_r(File.join(scaffold_path, '.'), path)
      puts "Added Octopress scaffold:"
      puts scaffold_file_list.green
    end

    def local_path
      pwd = File.join(Dir.pwd, '')
      path.sub(pwd, '')
    end

    def scaffold_path
      Octopress.gem_dir('scaffold')
    end

    # Returns a list of 
    def scaffold_files
      Find.find(scaffold_path).to_a.reject do |file| 
        file == scaffold_path
      end
    end

    def scaffold_file_list
      scaffold_files.map do |file| 
        name = file.sub(File.join(scaffold_path, ''), '')
        name = name.gsub(/[^\/]+\//, '  ')

        if File.directory?(file)
          name = File.join(name, '')
        end

        " + " + name
      end.join("\n")
    end
  end
end
