# -*- encoding: utf-8 -*-
# stub: rb-inotify 0.9.8 ruby lib

Gem::Specification.new do |s|
  s.name = "rb-inotify".freeze
  s.version = "0.9.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nathan Weizenbaum".freeze]
  s.date = "2017-01-26"
  s.description = "A Ruby wrapper for Linux's inotify, using FFI".freeze
  s.email = "nex342@gmail.com".freeze
  s.extra_rdoc_files = ["README.md".freeze]
  s.files = ["README.md".freeze]
  s.homepage = "http://github.com/nex3/rb-inotify".freeze
  s.rubygems_version = "2.6.12".freeze
  s.summary = "A Ruby wrapper for Linux's inotify, using FFI".freeze

  s.installed_by_version = "2.6.12" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ffi>.freeze, [">= 0.5.0"])
      s.add_development_dependency(%q<yard>.freeze, [">= 0.4.0"])
    else
      s.add_dependency(%q<ffi>.freeze, [">= 0.5.0"])
      s.add_dependency(%q<yard>.freeze, [">= 0.4.0"])
    end
  else
    s.add_dependency(%q<ffi>.freeze, [">= 0.5.0"])
    s.add_dependency(%q<yard>.freeze, [">= 0.4.0"])
  end
end
