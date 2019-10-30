# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [3.2.0] - 10-29-2019

### Added
- Add light and dark skins. [#347](https://github.com/mmistakes/so-simple-theme/pull/347)
- Add support for customizable skins. [#347](https://github.com/mmistakes/so-simple-theme/pull/347)

### Fixed
- Fix security alerts and update [onchange](https://www.npmjs.com/package/onchange) development dependency in `package.json`. [#341](https://github.com/mmistakes/so-simple-theme/issues/341)

## [3.1.3] - 08-20-2019

### Changed
- Relax Jekyll dependency to allow for version 4.0.
- Make entire entries and archive items "clickable"
- Remove redundant "Read more..." links on each entry.

### Added
- Add accent color variants for buttons and notices. [#335](https://github.com/mmistakes/so-simple-theme/pull/335)

## [3.1.2] - 02-17-2019

### Changed
- Update GitHub issue templates.
- Update NPM dependencies.

### Added
- Add Italian translations to `text.yml`. [#318](https://github.com/mmistakes/so-simple-theme/pull/318)
- Add French translations to `text.yml`. [#316](https://github.com/mmistakes/so-simple-theme/pull/316)
- Add German translations to `text.yml`. [#311](https://github.com/mmistakes/so-simple-theme/pull/311)
- Add Spanish translations to `text.yml`. [#300](https://github.com/mmistakes/so-simple-theme/pull/300)

### Fixed
- Fix security issue with seach-data.json by renaming to `.js` and use `relative_url` filter instead of `absolute_url` for all Lunr search scripts. [#323](https://github.com/mmistakes/so-simple-theme/issues/323)
- Remove duplicate `h1` headings for SEO benefit.
- Fix site title and description for page's with a hero image assigned with `page.image`. [#322](https://github.com/mmistakes/so-simple-theme/issues/322)
- Correct stylesheet path in documentation. [#309](https://github.com/mmistakes/so-simple-theme/pull/309)
- Clarify where to customize SCSS variables in `/assets/css/main.scss`. [#293](https://github.com/mmistakes/so-simple-theme/pull/293)

## [3.1.1] - 05-03-2018

### Changed
- Include creation of `navigation.yml` when "starting fresh". [#270](https://github.com/mmistakes/so-simple-theme/issues/270)
- Center hero image. [#289](https://github.com/mmistakes/so-simple-theme/pull/289)
- Update Font Awesome to version [`5.0.12`](https://github.com/FortAwesome/Font-Awesome/blob/master/CHANGELOG.md).
- Do not show `<footer>` in `_includes/entry.html` if there is no `site.read_time` or `entry.date` (typical of collection documents). [#283](https://github.com/mmistakes/so-simple-theme/pull/283)

### Fixed
- Fix documentation links to sample `index.md` file. [#288](https://github.com/mmistakes/so-simple-theme/issues/288)
- Fix "Uncaught TypeError: Cannot read property 'addEventListener' of null" in `main.js` when navigation isn't defined.
- Fix search form from resetting when pressing "Enter". [#278](https://github.com/mmistakes/so-simple-theme/pull/278)
- Fix author links from not displaying correct when a single link is defined in `_config.yml`. [#280](https://github.com/mmistakes/so-simple-theme/issues/280)
- Fix search result excerpts that run together because of implied spaces. [#281](https://github.com/mmistakes/so-simple-theme/pull/281)
- Fix usage of `$site-logo-height` variable in `_global.scss`. [#284](https://github.com/mmistakes/so-simple-theme/pull/284)

## [3.1.0] - 03-12-2018

### Changed
- Set `autofocus` on search input.
- Update Font Awesome to version [`5.0.7`](https://github.com/FortAwesome/Font-Awesome/blob/master/CHANGELOG.md).

### Added
- Add `posts_limit` override to `home` layout to set how many posts are shown (when not using pagination).
- Add `hidden: true` test post to verify it is excluded from home page pagination.
- Add note about disabling footer links with `footer_links: false`.
- Add support for sorting collections by `date` or `title`. [#272](https://github.com/mmistakes/so-simple-theme/pull/272)

### Fixed
- Fix `remote_theme` name in README documentation. [#268](https://github.com/mmistakes/so-simple-theme/pull/268)

## [3.0.1] - 02-06-2018

### Fixed
- Fix Google Analytics conditional and variable name in include.

## [3.0.0] - 02-06-2018

### Changed
- Freshen up look and feel, rebuilding with modern CSS using grid and flexbox.
- Improve parity with Jekyll's default theme (Minima).
- Properly support `url` and `baseurl` by leveraging Jekyll's `absolute_url` and `relative_url` filters.
- Rename image front matter to those used by jekyll-seo-tag, jekyll-feed, and jekyll-sitemap (e.g., rename `image.feature` to `image.path`).
- Require full paths to image assets instead of forcing them into `/images/`.
- Update MathJax to `2.7.2`.
- Update Font Awesome to `5.0.6`.
- Update jQuery to `3.3.1`.
- Remove FitVid.JS script.
- Replace Magnific Popup with Lity.
- Improve list view.
- Replace JSON search with [Lunr](https://lunrjs.com/).
- Improve syntax highlighting styling.
- Improve README.md with full installation guide.
- Replace Grunt tasks with `npm run` scripts.
- Update GitHub issue labels.
- Migrate `gh-pages` branch into `/docs` folder on `master`.

### Added
- Convert into a [Ruby gem-based theme](https://jekyllrb.com/docs/themes/#understanding-gem-based-themes).
- Add support for installing on GitHub Pages as a [remote theme](https://github.com/benbalter/jekyll-remote-theme).
- Add custom author links to post sidebar via `_config.yml`.
- Add custom footer links via `_config.yml`.
- Allow footer copyright to be changed via `_config.yml`.
- Assign Google Fonts to easily customize site's typography via `_config.yml`.
- Add hooks for injecting custom markup or content to `<head>` and `<footer>`.
- Add estimated reading time to pages.
- Add [data file](_data/text.yml) with all of the theme's text strings for localization.
- Add grid view.
- Add full document content, URL, and tags to search index for improved results.
- Add support for line numbers in syntax highlighted code blocks.
- Add toggle for showing or hiding excerpts with `show_excerpts`.
- Add `default` layout.
- Add `home` layout with [jekyll-paginate](https://jekyllrb.com/docs/pagination/) support.
- Add `posts` layout for showing all posts.
- Add `categories` layout for showing all posts grouped by category.
- Add `category` layout for showing posts of a specific category.
- Add `tags` layout for showing all posts grouped by tag.
- Add `tag` layout for showing posts of a specific tag.
- Add `collection` layout for showing documents of a specific collection.
- Add `search` layout.
- Add [Microformats](http://microformats.org/wiki/microformats2) markup to posts.
- Add responsive embed helper.
- Add table of contents helper.
- Add CHANGELOG.md file.
- Add migration guide for v2 to v3.
- Add stale bot for dealing with inactive issues and pull-requests.
- Add GitHub issue template.

### Fixed
- Fix MathJax CDN path. [#241](https://github.com/mmistakes/so-simple-theme/pull/241)

---

## [2.3.4] - 09-14-2016

### Changed
- Change `spin` to `adjust-hue`. [#201](https://github.com/mmistakes/so-simple-theme/issues/201)
- Improve readability of .scss files.

## [2.3.3] - 09-12-2016

### Changed
- Removed pro tip on applying for Twitter Cards.

## [2.3.2] - 09-12-2016

### Fixed
- Fix search.js interference with other forms. [#194](https://github.com/mmistakes/so-simple-theme/issues/194)
- Fix parenthesis Liquid error in `_layouts/post.html`. [#141](https://github.com/mmistakes/so-simple-theme/issues/141)

## [2.3.1] - 06-01-2016

### Changed
- Remove Octopress configuration from `_config.yml`.

## [2.3.0] - 06-01-2016

### Changed
- Update gems.
- Remove Octopress dependency.
- Replace `{% highlight %}` tags with GitHub Flavored Markdown backticks.
- Replace custom `feed.xml` with [jekyll-feed](https://github.com/jekyll/jekyll-feed) plugin.

## [2.2.3] - 05-05-2016

## [2.2.2] - 02-17-2016

## [2.2.1] - 02-07-2016

## [2.2.0] - 02-01-2016

### Changed
- Minor updates to `_syntax.scss` styling and theme documentation.

### Added
- Add compatibility with Jekyll 3.0.

## [2.1.1] - 01-22-2015

### Changed
- Improve comments in Sass partials and remove unused styles from Less versions.
- Enable Disqus comments globally instead of by post. [#94](https://github.com/mmistakes/so-simple-theme/issues/94)
- Improve Jekyll search feature by removing poorly performing input box overlay on mobile and touch devices [#88](https://github.com/mmistakes/so-simple-theme/issues/88.
- Move search form to dedicated page `/search/` and link to top navigation.

### Added
- Add post excerpts to index pages (`/blog`, `/articles`, and the home page) if set in a YAML Front Matter.

### Fixed
- Fix Disqus related bugs that were displaying `<noscript>` text on pages that had comments disabled.
- Fix typos in theme documentation.

## [2.1.0] - 01-22-2015

## [2.0.0] - 08-08-2014

## [1.4.0] - 02-12-2014

### Added
- Add rake tasks to create new posts or pages: `rake new_post` or `rake new_page`.

## [1.3.2] - 01-02-2014

### Added
- Add social share links to the sidebar. To enable, add `share: true` to a post's YAML Front Matter.

## [1.3.1] - 09-12-2013

### Changed
- Change order of navigation and browser upgrade includes. [#32](https://github.com/mmistakes/so-simple-theme/issues/32)

### Added
- Add Grunt build script for easier theme development. Preprocesses Less into CSS, concatenates and minifies JavaScript, and optimizes all images.
- Add search by post title overlay using Christian Fei’s [Simple Jekyll jQuery plugin](https://github.com/christian-fei/Simple-Jekyll-Search).

### Fixed
- Fix menu close action when clicking outside of it. [#29](https://github.com/mmistakes/so-simple-theme/issues/29)
- Fix jumpy navigation that was being absolutely positioned on click.

## [1.3.0] - 09-11-2013

## [1.2.11] - 08-16-2013

### Added
- Add support for summary large image Twitter Cards.

### Fixed
- Fix code syntax highlighting and added back Coderay styles for fenced code blocks.

## [1.2.10] - 08-12-2013

### Changed
- Update theme preview image.
- Update documentation.

### Added
- Add link post type support by adding `link: http://url-you-want-to-link` to a post's YAML Front Matter.

### Fixed
- Fix external links not being handled correctly in top navigation.
- Fix code syntax highlighting CSS.

## [1.2.9] - 08-05-2013

### Changed
- Refactor figure image classes to increase bottom padding when multiple rows of images are added to a figure element.

### Added
- Add hover effects to linked images in a `figure` element.
- Add non-intrusive image credit (for feature images).

### Fixed
- Fix Pygment CSS conflict with MathJax. [#20](https://github.com/mmistakes/so-simple-theme/issues/20)
- Fix RSS feed link in top navigation. [#21](https://github.com/mmistakes/so-simple-theme/issues/21)

## [1.2.8] - 07-30-2013

### Changed
- Adjust navigation and site logo animations in header.
- Adjust masthead feature images.

## [1.2.7] - 07-29-2013

### Fixed
- Fix typo in `variables.less`. 

## [1.2.6] - 07-26-2013

### Changed
- Modify hover states of links in the top navigation bar.
- Lighten body text to a dark gray to improve readability and lessen eye strain.

## [1.2.5] - 07-19-2013

### Changed
- Increase space around top-navigation text.
- Make Disqus comments optional and only load when `disqus_shortname` is defined and a post is set to `comments: true`.

### Fixed
- Fix post index `ul` element.

## [1.2.4] - 07-18-2013

## [1.2.3] - 07-17-2013

## [1.2.1] - 07-12-2013

### Changed
- Optimize `head` by loading CSS before AdobeEdge webfont JavaScript.

## [1.2.0] - 07-10-2013

### Changed
- Use [Google's enhance 404 widget](https://support.google.com/webmasters/answer/93641) to embed a search box in `404.md`.

### Added
- Add a starter 404 page.

## [1.1.0] - 07-03-2013

### Added
- Add support for configurable external links in `_config.yml`.

## [1.0.0] - 07-03-2013
