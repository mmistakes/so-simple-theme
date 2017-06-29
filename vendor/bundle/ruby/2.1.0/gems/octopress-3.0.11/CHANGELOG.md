# Changelog

### 3.0.11 (2015-07-15)
- Fix: filenames and extensions are preserved when publishing drafts and unpublishing posts.

### 3.0.10 (2015-07-15)
- Fix: `--force` flag works properly when publishing drafts and unpublishing posts.

### 3.0.9 (2015-06-18)
- Documentation improvements

### 3.0.8 (2015-06-17)
- Added documentation for Octopress's deploy project.

### 3.0.7 (2015-06-01)
- Fixed a bug where pages templates would only show dates if the `new page` command included a `--date` option. Now if a template has a date, the new page will have a date.

### 3.0.6 (2015-05-26)
- Fixed issue with Bundler gem loading.

### 3.0.5 (2015-05-12)
- Support for Jekyll 2 & 3
- Relaxed version requirements for Jekyll
- Added support for Jekyll Hooks when available
- Support for < Jekyll 2.5 by loading Jekyll plugins manually if necessary
- Updated documentation for adding doc pages to plugins
- Requiring Redcarpet because it gives us proper codefences for documentation pages (Ugh. I don't like Kramdown)

### 3.0.4 (2015-05-10)
- Fix: Changed shortcode for `--dir` to `-D` so it doesn't interfere with `-d` for `--date`.

### 3.0.3 (2015-05-09)
- Fix: Require gems from Gemfile if possible to reduce need to prefix with bundle exec.

### 3.0.2 (2015-05-06)
- Fix: Scaffolding path was broken when a configuration didn't have a source setting.

### 3.0.1 (2015-05-05)
- Fix: Now template scaffolding is installed at the configured Jekyll site source.

### 3.0.0 (2015-05-02)
- Minor: No more need to run bundle exec. Yay.
- Minor: Improved octopress docs functionality.

### 3.0.0 RC37 (2015-04-29)

- Fix: Added UTF-8 encoding to fix an issue with Ruby 1.9 support.

### 3.0.0 RC36 (2015-04-29)

- Fix: Layout is not automatically added to post/page templates
- Minor: Improved output for publishing drafts. 

### 3.0.0 RC35 (2015-03-21)

- Raised minimum Jekyll version to 2.5.

### 3.0.0 RC34 (2015-02-21)

- Added `multilingual?` method so plugins can easily check if a site is configured with Octopress Multilingual.

### 3.0.0 RC33 (2015-02-14)

- Removed `--lang` option from CLI. This adds unnecessary complexity which can be addressed with templates.

### 3.0.0 RC32 (2015-02-02)

- Added octopress-multilingual to list of plugins which can extend the CLI.

### 3.0.0 RC31 (2015-01-26)

- Fixed issue where Gemfile plugins weren't being required.

### 3.0.0 RC30 (2015-01-19)

- Fixed issue where `docs` command referenced Octopress Ink.

### 3.0.0 RC29 (2015-01-17)

- Added `--lang` option for multi-language support.

### 3.0.0 RC28 (2015-01-15)

- Fix: `--template` option accepts a path, allowing shell auto-completion.
- Added short option flags for most commands.

### 3.0.0 RC27 (2015-01-15)

- Minor fix to paths.
- Improved scaffold command output.
- Fixed drafts template config.
- Added config documentation for template file configs.

### 3.0.0 RC26 (2015-01-11)

- Added `unpublish` command for converting posts into drafts.

### 3.0.0 RC25 (2015-01-05)

- Fixed missing scaffolding.

### 3.0.0 RC24 (2015-01-02)

- Absorbed Octopress Docs features.

### 3.0.0 RC23 (2014-12-19)

- Fixed issue with site configuration caching

### 3.0.0 RC22 (2014-12-13)

- Docs integration improvements.
- Refactored and documented Jekyll site methods.

### 3.0.0 RC21 (2014-12-12)

- Improved access to Jekyll site instance.

### 3.0.0 RC20 (2014-12-11)

- Minor improvements to config management system.

### 3.0.0 RC19 (2014-12-09)

- Improvements to configuration management.
- Now using _config.yml for configuration instead of _octopress.yml

### 3.0.0 RC18 (2014-12-08)

- Loads site plugins before creating new pages, posts and drafts, allowing liquid tag processing in _template files.

### 3.0.0 RC17 (2014-12-08)

- Added a configuration tip when adding a new collection page.

### 3.0.0 RC16 (2014-11-24)

- Added `integrate` and `isolate` commands.
- Removed unnecessary Jekyll pass-through commands (`serve`, `build` and `doctor`).

### 3.0.0 RC14 (2014-07-26)

- Simplified configuration management.
- Now requiring titlecase gem directly.

### 3.0.0 RC13 (2014-07-24)

- Templates are no longer required unless passed as an option.
- The default drafts template doesn't have a date anymore.
- Now using octopress filters for titlecase.

### 3.0.0 RC12 (2014-05-23)

- Change: Default page template no longer includes a date.
- Improved date management when publishing a draft.

### 3.0.0 RC11 (2014-05-07)

- Replaced Hash extensions with Jekyll utility methods.
- Replaced String extension "titlecase" with Octopress utility method.

### 3.0.0 RC10 (2014-05-07)

- Now using SafeYAML.load instead of YAML.safe_load [#38](https://github.com/octopress/octopress/issues/38)

### 3.0.0 RC9 (2014-05-07)

- Support for Jekyll 2.0

### 3.0.0 RC8 (2014-05-02)

- Improved draft date management [#35](https://github.com/octopress/octopress/issues/35)

### 3.0.0 RC7 (2014-03-24)

- Fixed Time.parse with `--date` option on new posts and pages.
- Bumped Jekyll to 1.5.

### 3.0.0 RC6 (2014-03-22)

- Added support for octopress-ink documentation system.
- Added a `update_docs` Rake task to update docs from the readme and changelog.

### 3.0.0 RC5 (2014-03-21)
- Added octopress-docs to blessed gem list.

### 3.0.0 RC4 (2014-03-18)
- Updated mercenary. Fixed issue: #34

### 3.0.0 RC3 (2014-03-18)
- `serve --watch` fixed. Fixed issue: #33

### 3.0.0 RC2 (2014-03-18)
- `new post` command has new `--dir` option to save new posts in _posts/<DIR>/. Fixed issue #31

### 3.0.0 RC1 (2014-03-17)
- Initial release of Octopress CLI

