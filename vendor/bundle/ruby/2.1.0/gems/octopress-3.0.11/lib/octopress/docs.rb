require "find"
require "octopress/docs/doc"

module Octopress
  module Docs
    attr_reader :docs
    @docs = {}
    @enabled = false

    autoload :Doc, 'octopress/docs/doc'

    def self.pages
      doc_pages.values.flatten
    end

    def self.enabled?
      @enabled
    end

    def self.doc_pages
      if !@pages
        @pages = @docs.dup

        @pages.each do |slug, docs|

          # Convert docs to pages
          #
          docs.map! { |doc| doc.page }

          # Inject docs links from other docs pages
          #
          docs.map! do |doc|
            doc.data = doc.data.merge({
              'docs' => plugin_page_links(@pages[slug])
            })
            doc
          end
        end
      end
      @pages
    end

    def self.plugin_page_links(pages)
      pages.clone.map { |page|
        data = page.data
        title   = data['link_title'] || data['title'] || page.basename
        url = File.join('/', data['plugin']['url'], page.url.sub('index.html', ''))

        {
          'title' => title,
          'url' => url
        }
      }.sort_by { |i| 
        # Sort by depth of url
        i['url'].split('/').size
      }
    end
    

    # Return a hash of plugin docs information
    # for Jekyll site payload
    #
    def self.pages_info
      docs = {}

      # Retrieve plugin info from docs
      #
      doc_pages.each do |slug, pages|
        data = pages.first.data
        docs[slug] = data['plugin'].merge({
          'pages' => data['docs']
        })
      end

      # Sort docs alphabetically by name
      #
      docs = Hash[docs.sort_by { |k,v| v['name'] }]

      @pages_info = { 'plugin_docs' => docs }
    end

    def self.add_plugin_docs(plugin)
      options = plugin_options(plugin)
      options[:docs] ||= %w{readme docs}

      plugin_doc_pages = add_asset_docs(options)
      plugin_doc_pages.concat add_root_docs(options, plugin_doc_pages)
      plugin_doc_pages
    end

    def self.plugin_options(plugin)
      options = {
        name: plugin.name,
        slug: plugin.slug,
        type: plugin.type,
        version: plugin.version,
        gem: plugin.gem,
        description: plugin.description,
        path: plugin.path,
        source_url: plugin.source_url,
        website: plugin.website,
        docs_path: File.join(plugin.assets_path, 'docs'),
        docs: %w{readme changelog}
      }

      options[:base_url] = base_url(options)
      options
    end

    def self.default_options(options)
      options[:docs] ||= %w{readme changelog}
      options[:type] ||= 'plugin'
      options[:slug] = slug(options)
      options[:base_url] = base_url(options)
      options[:path] ||= '.'
      options[:docs_path] ||= File.join(options[:path], 'assets', 'docs')
      options
    end

    def self.slug(options)
      slug = options[:slug] || options[:name]
      options[:type] == 'theme' ? 'theme' : Jekyll::Utils.slugify(slug)
    end
    
    def self.base_url(options)
      options[:base_url] || if options[:type] == 'theme'
        'theme'
      else
        if options[:source_url] =~ /github\.com\/(octopress|imathis)/
          File.join('octopress', options[:slug].sub(/octopress-/,''))
        else
          File.join('plugins', options[:slug])
        end
      end
    end

    # Add doc pages for a plugin
    # 
    # Input: options describing a plugin
    #
    # Output: array of docs
    #
    def self.add(options)
      options = default_options(options)
      docs = []
      docs.concat add_asset_docs(options)
      docs.concat add_root_docs(options, docs)
      docs.compact! 
    end

    # Add pages from the root of a gem (README, CHANGELOG, etc)
    #
    def self.add_root_docs(options, asset_docs=[])
      root_docs = []
      options[:docs].each do |doc|
        doc_data = {
          'title' => doc.capitalize
        }

        if doc =~ /readme/ && asset_docs.select {|d| d.file =~ /^index/ }.empty?
          doc_data['permalink'] = '/'
        end

        root_docs << add_root_doc(doc, options.merge(data: doc_data))
      end
      root_docs
    end

    # Add a single root doc
    #
    def self.add_root_doc(filename, options)
      if file = select_first(options[:path], filename)
        add_doc_page(options.merge({file: file}))
      end
    end

    # Register a new doc page for a plugin
    #
    def self.add_doc_page(options)
      page = Docs::Doc.new(options)
      @docs[options[:slug]] ||= []
      @docs[options[:slug]] << page
      page
    end

    private

    # Add doc pages from /asset/docs
    #
    def self.add_asset_docs(options)
      docs = []
      find_doc_pages(options[:docs_path]).each do |doc|
        unless doc =~ /^_/
          opts = options.merge({file: doc, path: options[:docs_path]})   
          docs << add_doc_page(opts)
        end
      end
      docs
    end

    # Find all files in a directory recursively
    #
    def self.find_doc_pages(dir)

      return [] unless Dir.exist? dir

      Find.find(dir).to_a.reject do |f| 
        File.directory? f 
      end.map do |f|
        # truncate file to relative path
        f.sub(dir+'/', '')
      end
    end

    def self.select_first(dir, match)
      Dir.new(dir).select { |f| f =~/#{match}/i}.first
    end

    def self.load_docs(options=nil)
      @enabled = true

      require "octopress-hooks"
      require "octopress/docs/hooks"
      require "octopress/docs/liquid_filters"
      require "octopress/docs/jekyll/convertible"
      require "octopress/docs/jekyll/page"
      require "octopress-escape-code"

      if !options.nil?
        # Look at the local site and require all of its plugins
        # Ensuring their documentation is loaded into the docs site
        #
        site = Octopress.read_site({'config'=>options['config']})

        # Require escape code last to set Octopress hook priority.
        #
        options = Docs.site.config.merge(options)
      end
      options
    end

    def self.site(options={})
      @site ||= Octopress.site(site_options.merge(options))
    end

    def self.site_options
      source = Octopress.gem_dir('local')
      {
        'source'      => source,
        'destination' => File.join(source, '_site'),
        'layouts'     => File.join(source, '_layouts'),
        'port'        => '4444',
        'serving'     =>  true,
      }
    end
  end
end
