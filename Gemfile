source "https://rubygems.org"

# Hello! This is where you manage which Jekyll version is used to run.
# When you want to use a different version, change it below, save the
# file and run `bundle install`. Run Jekyll with `bundle exec`, like so:
#
#     bundle exec jekyll serve
#
# This will help ensure the proper Jekyll version is running.
# Happy Jekylling!
#gem "jekyll", "3.5.2"

# You want these plugins to go with Jekyll if not using gh-pages
# group :jekyll_plugins do
#   gem "jekyll-feed", "~> 0.6"
#   gem "jekyll-gist"
#   gem "jekyll-sitemap"
# end

# If you want to use GitHub Pages, remove the "gem "jekyll"" and plugins
# above and uncomment the line below.
# To upgrade, run `bundle update github-pages`.
gem "github-pages", group: :jekyll_plugins

# If you have any additional plugins add them here
group :jekyll_plugins do
    gem "jemoji"  # Lets you show emojis
    gem "html-proofer"  # Used for continuous integration
    gem "jekyll-feed"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
platform :mswin, :mingw, :x64_mingw do
  gem "tzinfo-data"
  gem 'wdm', '>= 0.1.0'
end
