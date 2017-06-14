unless Octopress::Docs.enabled?
  require 'octopress'
  Octopress::Docs.load_docs
  require 'octopress-escape-code'
end
