# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'octopress-deploy/version'

Gem::Specification.new do |spec|
  spec.name          = "octopress-deploy"
  spec.version       = Octopress::Deploy::VERSION
  spec.authors       = ["Brandon Mathis"]
  spec.email         = ["brandon@imathis.com"]
  spec.description   = %q{Easily deploy any Jekyll or Octopress site using S3, Git, or Rsync.}
  spec.summary       = %q{Easily deploy any Jekyll or Octopress site using S3, Git, or Rsync.}
  spec.homepage      = "https://github.com/octopress/deploy"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "colorator"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "octopress"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "clash"
  spec.add_development_dependency "aws-sdk-v1"

  if RUBY_VERSION >= "2"
    spec.add_development_dependency "pry-byebug"
  end
end
