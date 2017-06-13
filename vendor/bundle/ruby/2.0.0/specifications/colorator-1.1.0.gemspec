# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "colorator"
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Parker Moore", "Brandon Mathis"]
  s.date = "2016-06-29"
  s.email = ["parkrmoore@gmail.com", "brandon@imathis.com"]
  s.extra_rdoc_files = ["README.markdown", "LICENSE"]
  s.files = ["README.markdown", "LICENSE"]
  s.homepage = "https://github.com/octopress/colorator"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14.1"
  s.summary = "Colorize your text in the terminal."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 3.1"])
    else
      s.add_dependency(%q<rspec>, ["~> 3.1"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 3.1"])
  end
end
