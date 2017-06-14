---
title: Documentation Plugins
permalink: /docs/
---

# Octopress Docs

If you have the Octopress gem installed, run `$ octopress docs` from the root of your Jekyll site, and a website will mount at `http://localhost:4444` with documentation for Octopress and any plugins which support this feature.

## Adding docs to your plugin

If your plugin is built on Octopress Ink, these documentation pages are added automatically. If not, use
the code below to automatically add your plugin's Readme, Changelog and any pages in your gem path under `assets/docs`.

```ruby
if defined? Octopress::Docs
  Octopress::Docs.add({
    name:        "Your Plugin",
    gem_name:    "your-gem",
    description: "This plugin causes awesomeness",
    path:        File.expand_path(File.join(File.dirname(__FILE__), "../")), # gem root
    slug:        "your-plugin",                      # optional
    source_url:  "https://github.com/some/project",  # optional
    website:     "http://example.com",               # optional
  })
end
```

It's a bit odd, but the `if defined? Octopress::Docs` allows you to register doc pages if possible, without having to add the octopress gem as a dependency.
