# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rouge"
  s.version = "1.11.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeanine Adkisson"]
  s.date = "2016-06-14"
  s.description = "Rouge aims to a be a simple, easy-to-extend drop-in replacement for pygments."
  s.email = ["jneen@jneen.net"]
  s.executables = ["rougify"]
  s.files = ["bin/rougify"]
  s.homepage = "http://rouge.jneen.net/"
  s.licenses = ["MIT, 2-clause BSD"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "rouge"
  s.rubygems_version = "2.0.14.1"
  s.summary = "A pure-ruby colorizer based on pygments"
end
