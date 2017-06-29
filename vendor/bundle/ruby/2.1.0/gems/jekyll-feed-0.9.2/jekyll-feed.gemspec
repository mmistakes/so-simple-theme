# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "jekyll-feed"
  spec.version       = "0.9.2"
  spec.authors       = ["Ben Balter"]
  spec.email         = ["ben.balter@github.com"]
  spec.summary       = "A Jekyll plugin to generate an Atom feed of your Jekyll posts"
  spec.homepage      = "https://github.com/jekyll/jekyll-feed"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "jekyll", "~> 3.3"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "typhoeus", "~> 0.7"
  spec.add_development_dependency "nokogiri", "~> 1.6"
  spec.add_development_dependency "rubocop"
end
