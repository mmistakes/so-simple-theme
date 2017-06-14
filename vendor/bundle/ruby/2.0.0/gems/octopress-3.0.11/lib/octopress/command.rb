require 'jekyll'
require File.expand_path('commands/helpers', File.dirname(__FILE__))

module Octopress
  class Command
    def self.inherited(base)
      subclasses << base
    end

    def self.subclasses
      @subclasses ||= []
    end

    def init_with_program(p)
      raise NotImplementedError.new("")
    end
  end
end
