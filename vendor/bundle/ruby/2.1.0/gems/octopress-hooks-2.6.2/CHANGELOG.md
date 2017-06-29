# Changelog

### 2.6.2 - 2016-09-15
- Bug: Properly pass the path to the Liquid render function.

### 2.6.1 - 2015-05-11
- Minor: Loosened Gemspec dependency version to allow Jekyll 3.0

### 2.6.0 - 2015-02-16
- New: Site `reset` hook helps you reset variables before successive builds.

### 2.5.0 - 2015-02-16
- New: `deep_merge_payload` hook allows Posts, Pages, and Documents to have control over the way the payload is merged. (Expert level)

### 2.4.1 - 2015-01-30
- Fix: Collection rendering issues for no-output collection items.

### 2.4.0 - 2015-01-30
- New: Pages, Posts, and Documents now have a `merge_payload` method which lets you modify the payload for each page before render.

### 2.3.2 - 2015-01-07
- Now hooks are registered after Jekyll Site resets.

### 2.3.1 - 2015-01-05
- Removed development logging (how embarrassing)

### 2.3.0 - 2015-01-05
- Added hooks to collection documents
- Added New All hook which hooks posts, pages and collection pages.

### 2.2.3 - 2014-12-19
- Readme updates

### 2.2.2 - 2014-10-12
- Added support for octopress-docs
- Minor bug fix for when there are no hooks

### 2.2.1 - 2014-08-13
- Fix: Now compatible with Jekyll 2.3.0

### 2.2.0 - 2014-07-28
- New: Site hook - pre_read, runs before site reads items
- New: Site hook - post_read, runs after site reads items

### 2.1.0 - 2014-07-28
- New: Added Post hooks.
- Change: Page hooks now only target pages.
- New: Added post_init hooks for pages and posts which is triggered after initialization.
- Gone: Removed the ConvertiblePartial thing. It was unnecessary. Extending hooks is easy.

### 2.0.0
- Added support for Site hooks: pre_render, post_write and a way to patch the site payload.
- Changed name to octopress-hooks and moved repository to octopress/hooks.

### 1.3.1
- No longer requires Octopress Ink.
- Renamed to octopress-hooks
- moved to https://github.com/octopress/hooks

### 1.3.0
- Added support for processing partials as a ConvertiblePartial.

### 1.2.0
- Added support Jekyll 2.0

### 1.1.1
- Added support for Octopress Ink.

### 1.1.0
- Added Jekyll::ConvertiblePage type to hookable classes.

### 1.0.2
- Now requires Jekyll (oops).
- Added tests.

### 1.0.1
- Naming refactor.

### 1.0.0
- Initial release.
