# coding: utf-8

Gem::Specification.new do |spec|
  spec.name        = "jekyll-sitemap"
  spec.summary     = "Automatically generate a sitemap.xml for your Jekyll site."
  spec.version     = "1.1.1"
  spec.authors     = ["GitHub, Inc."]
  spec.email       = "support@github.com"
  spec.homepage    = "https://github.com/jekyll/jekyll-sitemap"
  spec.licenses    = ["MIT"]

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r!^bin/!) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r!^(test|spec|features)/!)
  spec.require_paths = ["lib"]

  spec.add_dependency "jekyll", "~> 3.3"

  spec.add_development_dependency "jekyll-last-modified-at", "0.3.4"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rubocop"
end
