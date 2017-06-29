# -*- encoding: utf-8 -*-
# stub: octopress 3.0.11 ruby lib

Gem::Specification.new do |s|
  s.name = "octopress".freeze
  s.version = "3.0.11"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Brandon Mathis".freeze, "Parker Moore".freeze]
  s.date = "2015-07-15"
  s.email = ["brandon@imathis.com".freeze, "parkrmoore@gmail.com".freeze]
  s.executables = ["octopress".freeze]
  s.files = ["bin/octopress".freeze]
  s.homepage = "http://octopress.org".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.12".freeze
  s.summary = "Octopress is an obsessively designed framework for Jekyll blogging. It\u{2019}s easy to configure and easy to deploy. Sweet huh?".freeze

  s.installed_by_version = "2.6.12" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mercenary>.freeze, ["~> 0.3.2"])
      s.add_runtime_dependency(%q<jekyll>.freeze, [">= 2.0"])
      s.add_runtime_dependency(%q<titlecase>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<octopress-deploy>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<octopress-hooks>.freeze, ["~> 2.0"])
      s.add_runtime_dependency(%q<octopress-escape-code>.freeze, ["~> 2.0"])
      s.add_runtime_dependency(%q<redcarpet>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<octopress-ink>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<clash>.freeze, [">= 0"])
      s.add_development_dependency(%q<pry-byebug>.freeze, [">= 0"])
    else
      s.add_dependency(%q<mercenary>.freeze, ["~> 0.3.2"])
      s.add_dependency(%q<jekyll>.freeze, [">= 2.0"])
      s.add_dependency(%q<titlecase>.freeze, [">= 0"])
      s.add_dependency(%q<octopress-deploy>.freeze, [">= 0"])
      s.add_dependency(%q<octopress-hooks>.freeze, ["~> 2.0"])
      s.add_dependency(%q<octopress-escape-code>.freeze, ["~> 2.0"])
      s.add_dependency(%q<redcarpet>.freeze, ["~> 3.0"])
      s.add_dependency(%q<octopress-ink>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<clash>.freeze, [">= 0"])
      s.add_dependency(%q<pry-byebug>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<mercenary>.freeze, ["~> 0.3.2"])
    s.add_dependency(%q<jekyll>.freeze, [">= 2.0"])
    s.add_dependency(%q<titlecase>.freeze, [">= 0"])
    s.add_dependency(%q<octopress-deploy>.freeze, [">= 0"])
    s.add_dependency(%q<octopress-hooks>.freeze, ["~> 2.0"])
    s.add_dependency(%q<octopress-escape-code>.freeze, ["~> 2.0"])
    s.add_dependency(%q<redcarpet>.freeze, ["~> 3.0"])
    s.add_dependency(%q<octopress-ink>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<clash>.freeze, [">= 0"])
    s.add_dependency(%q<pry-byebug>.freeze, [">= 0"])
  end
end
