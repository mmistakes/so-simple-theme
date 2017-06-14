# -*- encoding: utf-8 -*-
# stub: jekyll-watch 1.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "jekyll-watch".freeze
  s.version = "1.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Parker Moore".freeze]
  s.date = "2016-07-20"
  s.email = ["parkrmoore@gmail.com".freeze]
  s.homepage = "https://github.com/jekyll/jekyll-watch".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.12".freeze
  s.summary = "Rebuild your Jekyll site when a file changes with the `--watch` switch.".freeze

  s.installed_by_version = "2.6.12" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<listen>.freeze, ["< 3.1", "~> 3.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.35.1"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<jekyll>.freeze, [">= 2.0"])
    else
      s.add_dependency(%q<listen>.freeze, ["< 3.1", "~> 3.0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.35.1"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<jekyll>.freeze, [">= 2.0"])
    end
  else
    s.add_dependency(%q<listen>.freeze, ["< 3.1", "~> 3.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.35.1"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<jekyll>.freeze, [">= 2.0"])
  end
end
