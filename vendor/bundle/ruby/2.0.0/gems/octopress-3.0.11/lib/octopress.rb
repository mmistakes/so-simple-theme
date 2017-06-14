# encoding: UTF-8
require 'mercenary'
require 'titlecase'

module Octopress
  extend self

  require 'octopress/command'
  require 'octopress/version'
  require 'octopress/utils'
  require 'octopress/commands/new'
  require 'octopress/commands/docs'
  require 'octopress/commands/init'
  require 'octopress/commands/publish'
  require 'octopress/commands/unpublish'
  require 'octopress/commands/isolate'
  require 'octopress/isolate'
  require 'octopress/docs'

  autoload :Page, 'octopress/page'
  autoload :Post, 'octopress/post'
  autoload :Draft, 'octopress/draft'
  autoload :Scaffold, 'octopress/scaffold'

  # Automatically require these gems if installed
  BLESSED_GEMS = %w[
    octopress-ink
    octopress-deploy
    octopress-multilingual
  ]

  def logger
    @logger ||= Mercenary::Command.logger
    @logger.level = Logger::DEBUG
    @logger
  end

  # Cache Jekyll's site configuration
  #
  def configuration(options={})
    if site?
      @site.config
    else
      @config ||= Jekyll.configuration(options)
    end
  end

  def site?
    !@site.nil?
  end

  # Is this site set up with the multilingual plugin?
  #
  def multilingual?
    defined?(Octopress::Multilingual) && !Octopress.site.config['lang'].nil?
  end

  # Cache Jekyll's site
  #
  def site(options={})
    @site ||= read_site(options)
  end

  # Quietly read from Jekyll's site
  #
  def read_site(options={})
    Jekyll.logger.log_level = :error
    s = Jekyll::Site.new(Jekyll.configuration(options))
    if defined?(Jekyll::PluginManager) && Jekyll::PluginManager.respond_to?(:require_from_bundler)
      Jekyll::PluginManager.require_from_bundler
      s.plugin_manager.conscientious_require
    end
    Jekyll.logger.log_level = :info
    alias_site_title(s)
  end

  # Allow site to be set
  #
  def site=(site)
    @site = alias_site_title(site)
  end

  # Octopress historically used site.title
  # This ensures we can all use site.name to be
  # compatible with Jekyll's scaffold convention
  #
  def alias_site_title(site)
    site.config['name'] ||= site.config['title']
    site
  end

  def gem_dir(dir='')
    File.expand_path(File.join(File.dirname(__FILE__), '..', dir))
  end

  def require_blessed_gems
    BLESSED_GEMS.each do |gem|
      begin
        require gem
      rescue LoadError
      end
    end
  end

  def require_gems
    require_blessed_gems

    if !ENV["OCTOPRESS_NO_BUNDLER_REQUIRE"] && File.file?("Gemfile")
      begin
        require "bundler"
        Bundler.setup(:default, :octopress, :jekyll_plugins)
        true
      rescue LoadError, Bundler::GemfileNotFound
        false
      end
    else
      false
    end
  end
end

Octopress::Docs.add({
  name:        "Octopress",
  gem:         "octopress",
  version:     Octopress::VERSION,
  description: "A framework for writing Jekyll sites ",
  base_url:    "octopress",
  path:        File.expand_path(File.join(File.dirname(__FILE__), "..")),
  source_url:  "https://github.com/octopress/octopress",
  website:     "http://octopress.org",
})

Octopress.require_gems

