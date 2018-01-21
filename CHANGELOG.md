# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## Unreleased

### Changed
### Added
### Fixed

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
