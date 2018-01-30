# [So Simple Jekyll Theme][1]

[![Gem](https://img.shields.io/gem/v/so-simple-theme.svg?style=flat-square)](https://rubygems.org/gems/jekyll-theme-so-simple)
[![license](https://img.shields.io/github/license/mmistakes/so-simple-theme.svg?style=flat-square)](LICENSE)

So Simple is a simple and clean [Jekyll theme](https://jekyllrb.com/docs/themes/) for your words and pictures. Its primary focus is to provide a:

- A variety of layouts with clean and readable typography
- Disqus Comments and Google Analytics support
- SEO best practices via [Jekyll SEO Tag](https://github.com/jekyll/jekyll-seo-tag/)
- Enough options to customize the theme and make it your own

[![So Simple live preview][2]][1]

[1]: https://mmistakes.github.io/so-simple-theme/
[2]: image.jpg (live preview)

## Installation

If you're running Jekyll v3.5+ and self-hosting you can quickly install the 
theme as a Ruby gem. If you're hosting with GitHub Pages you can install as a 
[remote theme](https://github.com/benbalter/jekyll-remote-theme) or directly copy all of the theme files (see [structure](#structure) 
below) into your project.

### Ruby Gem Method

1. Add this line to your Jekyll site's `Gemfile` (or [create one](https://github.com/mmistakes/so-simple-theme/blob/master/example/Gemfile)):

   ```ruby
   gem "jekyll-theme-so-simple"
   ```

2. Add this line to your Jekyll site's `_config.yml` file:

   ```yaml
   theme: jekyll-theme-so-simple
   ```

2. Then run [Bundler](http://bundler.io/) to install the theme gem and dependencies:
   
   ```terminal
   bundle install
   ```

### GitHub Pages Method

GitHub Pages has added [full support](https://github.com/blog/2464-use-any-theme-with-github-pages) 
for any GitHub-hosted theme.

1. Replace `gem "jekyll"` with:

   ```ruby
   gem "github-pages", group: :jekyll_plugins
   ```

2. Run `bundle update` and verify that all gems install properly.

3. Add `remote_theme: "mmistakes/jekyll-theme-so-simple"` to your 
   `_config.yml` file. Remove any other `theme:` or `remote_theme:` entries.

---

**Note:** Your Jekyll site should be viewable immediately at 
<http://USERNAME.github.io>. If it's not, you can force a rebuild by 
**Customizing Your Site** (see below for more details).

If you're hosting several Jekyll based sites under the same GitHub username you 
will have to use Project Pages instead of User Pages. Essentially you rename the 
repo to something other than **USERNAME.github.io** and create a `gh-pages` 
branch off of `master`. For more details on how to set things up check 
[GitHub's documentation](https://help.github.com/articles/user-organization-and-project-pages/).

#### Remove the Unnecessary

If you forked or downloaded the [`so-simple-theme` repo](https://github.com/mmistakes/so-simple-theme) you can 
safely remove the following files and folders:

- `docs/*`
- `example/*`
- `.editorconfig`
- `.gitattributes`
- `CHANGELOG.md`
- `Gemfile`
- `jekyll-theme-so-simple.gemspec`
- `LICENSE`
- `Rakefile`
- `README.md`
- `screenshot.png`

## Upgrading

If you're using the Ruby Gem or remote theme versions of So Simple, 
upgrading is fairly painless.

To check which version you are currently using, view the source of your built 
site and you should something similar to:

```
<!--
    So Simple Jekyll Theme 3.0.0
    Copyright 2013-2018 Michael Rose - mademistakes.com | @mmistakes
    Free for personal and commercial use under the MIT license
    https://github.com/mmistakes/so-simple-theme/blob/master/LICENSE
-->
```

At the top of every `.html` file, `/assets/css/main.css`, and `/assets/js/main.js`.

### Ruby Gem

Simply run `bundle update` if you're using Bundler (have a `Gemfile`) or `gem 
update jekyll-theme-so-simple` if you're not.

### Remote Theme

When hosting with [GitHub Pages](https://pages.github.com/) you'll need to push up a commit to force a 
rebuild with the latest [theme release](https://github.com/mmistakes/so-simple-theme/releases).

An empty commit will get the job done too if you don't have anything to push at 
the moment:

```terminal
git commit --allow-empty -m "Force rebuild of site"
```

### Use Git

If you want to get the most out of the Jekyll + GitHub Pages workflow, then 
you'll need to utilize Git. To pull down theme updates manually you must first ensure 
there's an upstream remote. If you forked the theme's repo then you're likely 
good to go.

To double check, run `git remote -v` and verify that you can fetch from `origin https://github.com/mmistakes/so-simple-theme.git`.

To add it you can do the following:

```terminal
git remote add upstream https://github.com/mmistakes/so-simple-theme.git
```

#### Pull Down Updates

Now you can pull any commits made to theme's `master` branch with:

```terminal
git pull upstream master
```

Depending on the amount of customizations you've made after forking, there's 
likely to be merge conflicts. Work through any conflicting files Git flags, 
staging the changes you wish to keep, and then commit them.

### Update Files Manually

Another way of dealing with updates is [downloading the theme](https://github.com/mmistakes/so-simple-theme/archive/master.zip) 
--- replacing your layouts, includes, and assets with the newer ones manually. 
To be sure that you don't miss any changes it's probably a good idea to review 
the theme's [commit history](https://github.com/mmistakes/so-simple-theme/commits/master) 
to see what's changed.

Here's a quick checklist of the important folders/files you'll want to be 
mindful of:

| Name                   |     |
| ----                   | --- |
| `_layouts`             | Replace all. Apply edits if you customized any layouts. |
| `_includes`            | Replace all. Apply edits if you customized any includes. |
| `assets`               | Replace all. Apply edits if you customized stylesheets or scripts. |
| `_sass`                | Replace all. Apply edits if you customized Sass partials. |
| `_data/navigation.yml` | Safe to keep. Verify that there were no major structural changes or additions. |
| `_data/text.yml`       | Safe to keep. Verify that there were no major structural changes or additions. |
| `_config.yml`          | Safe to keep. Verify that there were no major structural changes or additions. |

---

**Note:** If you're not seeing the latest version, be sure to flush browser and 
CDN caches. Depending on your hosting environment older versions of 
`/assets/css/main.css`, `/assets/js/main.min.js`, or `*.html` may be cached.

## Structure

Layouts, includes, Sass partials, and data files are all placed in their default 
locations. Stylesheets and scripts can be found in `assets`, and a few development related 
files in the project's root directory.

**Please note:** If you installed So Simple via the Ruby Gem  or remote theme methods, theme 
files found in `/_layouts`, `/_includes`, `/_sass`, and `/assets` will be 
missing. This is normal as they are bundled with the [`jekyll-theme-so-simple`](https://rubygems.org/gems/jekyll-theme-so-simple) gem.

```terminal
jekyll-theme-so-simple
├── _data                      # data files
|  └── text.yml                # theme text
├── _includes                  # theme includes
├── _layouts                   # theme layouts (see below for usage)
├── _sass                      # Sass partials
├── assets
|  ├── css
|  |  └── main.scss
|  └── javascripts
|     └── main.min.js
├── _config.yml                # sample configuration
└── index.md                   # sample home page (recent posts/not paginated)
```

### Starting Fresh

After creating a `Gemfile` and installing the theme you'll need to add and edit 
the following files:

- [`_config.yml`](_config.yml)
- [`/_data/text.yml`](_data/text.yml)
- [`index.md`](index.md) 

**Note:** Consult the [**pagination**](#pagination) documentation below for
instructions on how to enable it on the home page.

### Starting from `jekyll new`

Using the `jekyll new` command will get you up and running the quickest.

Edit `_config.yml` following the guide below and then create `_data/theme.yml` as instructed earlier.

## Configuring

Configuration of site-wide elements (`locale`, `title`, `description`, `url`, `logo`, 
`author`, etc.) happens in your project's `_config.yml`. See the 
[example configuration](example/_config.yml) in this repo for additional 
reference.

| Name | Description | Example |
| ---- | ----------- | ------- |
| `locale` | Primary language for the site. | `"en-us"` |
| `title` | Site's title. | `"My Awesome Site"` |
| `description` | A short description. | `"This is my site, it is awesome."` |
| `baseurl` | Used to test the website under the same base url it will be deployed to. | `/my-base-path` |
| `url` | The full URL to your site. | `"https://your-site.com"` |
| `logo` | URL to a site-wide logo used in masthead. | `/images/your-logo.png` |


**`site.locale`** is used to declare the primary language for each web page within the site.

*Example:* locale: `"en-US"` sets the lang attribute for the site to the United States flavor of English, while `en-GB` would be for the United Kingdom style of English. Country codes are optional and the shorter variation `locale: "en"` is also acceptable. To find your language and country codes check this [reference table](https://msdn.microsoft.com/en-us/library/ee825488(v=cs.20).aspx).

Properly setting the locale is important for associating localized text found in the text data file.

**Note:** The theme defaults to text in English (`en`, `en-US`, `en-GB`). If you change locale in `_config.yml` to something else be sure to add the corresponding locale key and translated text to `\_data/text.yml`.

### Site URL

The base hostname and protocol for your site. If you're hosting with GitHub Pages this will be something like `url: "https://github.io.mmistakes"` or `url: "https://your-site.com"` if you have a custom domain name.

GitHub Pages now [forces `https://` for new sites](https://help.github.com/articles/securing-your-github-pages-site-with-https/) so be mindful of that when setting your URL to avoid mixed-content warnings.

**Note:** Jekyll 3.3 overrides the value of `url` with `http://localhost:4000` when running `jekyll serve` locally in development. If you want to avoid this behavior set `JEKYLL_ENV=production` to [force the environment](http://jekyllrb.com/docs/configuration/#specifying-a-jekyll-environment-at-build-time) to production.

### Site Base URL

This option causes all kinds of confusion in the Jekyll community. If you're not hosting your site as a GitHub Pages Project or in a subfolder (e.g., `/blog`), then don't mess with it.

In the case of the **So Simple** demo site it's hosted on GitHub at <https://mmistakes.github.io/so-simple-theme>. To correctly set this base path I'd use `url: "https://mmistakes.github.io"` and `baseurl: "/so-simple-theme"`.

For more information on how to properly use `site.url` and `site.baseurl` as intended by the Jekyll maintainers, check [Parker Moore's post on the subject](https://byparker.com/blog/2014/clearing-up-confusion-around-baseurl/).

**Note:** When using `baseurl` remember to include it as part of your path when testing your site locally. Values of `url:` and `baseurl: "/blog"` would make your local site visible at <http://localhost:4000/blog> and not <http://localhost:4000>. You can either prepend all your asset and internal link paths with `{{ site.baseurl }}` or use Jekyll's `relative_url`.

To use the example values above the following image path of `{{ '/images/my-image.jpg' | relative_url }}` would output as `http://localhost:4000/blog/images/my-image.jpg`.

### Date Format

You can change the default date format by specifying `date_format` in `_config.yml`. It accepts any of the standard [Liquid date formats](http://shopify.github.io/liquid/filters/date/).

For example change the default value of `"%B %-d, %Y"` like so:

```yaml
date_format: "%Y-%m-%d"
```

### Reading Time

Enable estimated reading time snippets site-wide with `read_time: true`. `200` has been set as the default words per minute value — which can be changed via `words_per_minute`.

```yaml
read_time: true
words_per_minute: 200
```

### Mathematics

Enable [MathJax](https://www.mathjax.org) (a JavaScript display engine for mathematics) site-wide with `mathjax: true`.

### Google Fonts

Easily use Google Fonts throughout your site by replacing the font `name` and `weights` accordingly. Suggested font pairings are as follows:

```yaml
google_fonts:
  - name: "Source Sans Pro"
    weights: "400,400i,700,700i"
  - name: "Lora"
    weights: "400,400i,700,700i"
```

**Note:** If other font families are used be sure to override the following SCSS variables in your `/assets/css/main.scss` file.

```scss
$serif-font-family: "Lora", serif;
$sans-serif-font-family: "Source Sans Pro", sans-serif;
$monospace-font-family: Menlo, Consolas, Monaco, "Courier New", Courier, monospace;

$base-font-family: $sans-serif-font-family;
$headline-font-family: $sans-serif-font-family;
$title-font-family: $serif-font-family;
$description-font-family: $serif-font-family;
$meta-font-family: $serif-font-family;
```

See stylesheet documentation below for more information on overriding the theme's default variables.

### Pagination

Break up the main listing of posts into smaller lists and display them over multiple pages by [enabling pagination](http://jekyllrb.com/docs/pagination/).

1. Include the [`jekyll-paginate`][jekyll-paginate] plugin in your `Gemfile`.

   ```ruby
   group :jekyll_plugins do
     gem "jekyll-paginate"
   end
   ```

2. Add `jekyll-paginate` to the `plugins` array (previously `gems`) in your `_config.yml` file and the following pagination settings:

   ```yaml
   paginate: 10  # amount of posts to show per page
   paginate_path: /page:num/
   ```

3. Create `index.html` (or rename `index.md`) in the root of your project and add the following front matter:

   ```yaml
   layout: home
   paginate: true
   ```

### Taxonomy Pages

By default, category and tags found on a post are not linked to taxonomy archive pages. To enable this behavior and link to page's with posts grouped by tag or category, add the following:

```yaml
category_archive_path: "/categories/#"
tag_archive_path: "/tags/#"
```

These paths should mimic the permalinks used for your category and tag archive pages. The `#` at the end is necessary to target the correct taxonomy section on the page.

For example if you were to create `categories.md` with the following front matter:

```yaml
title: Categories Archive
layout: categories
permalink: /foo/
```

You'd need to `category_archive_path` to `"/foo/#` for category links to function properly.

### Comments (via Disqus)

If you have a [**Disqus**](https://disqus.com/) account, you can show a comments section below each post.

To enable Disqus comments, add your [Disqus shortname](https://help.disqus.com/customer/portal/articles/466208) to your project's `_config.yml` file:

```yaml
disqus:
  shortname: my_disqus_shortname
```

Comments only appear in production when built with the following [environment value](http://jekyllrb.com/docs/configuration/#specifying-a-jekyll-environment-at-build-time): `JEKYLL_ENV=production` to avoid polluting your Disqus account with `localhost` content.

If you don't want to display comments for a particular post you can disable them by adding `comments: false` to that page's front matter.

### Google Analytics

To enable [**Google Analytics**](https://analytics.google.com/analytics/web/), add your tracking ID to `_config.yml` like so:

```yaml
google_analytics: UA-NNNNNNNN-N
```

Similar to Disqus comments above, the Google Analytics tracking script will only appear in production when using the following environment value: `JEKYLL_ENV=production`.

For more configuration options be sure to consult the documentation for: 
[**jekyll-seo-tag**][jekyll-seo-tag], [**jekyll-feed**][jekyll-feed], 
[**jekyll-paginate**][jekyll-paginate], and [**jekyll-sitemap**][jekyll-sitemap].

[jekyll-seo-tag]: https://github.com/jekyll/jekyll-seo-tag
[jekyll-feed]: https://github.com/jekyll/jekyll-feed
[jekyll-paginate]: https://github.com/jekyll/jekyll-paginate
[jekyll-sitemap]: https://github.com/jekyll/jekyll-sitemap

---

## Layouts

This theme provides the following layouts, which you can use by setting the 
`layout` [Front Matter](https://jekyllrb.com/docs/frontmatter/) on each page, 
like so:

```yaml
---
layout: name
---
```

### `layout: default`

This layout handles all of the basic page scaffolding placing the page content 
between the masthead and footer elements. All other layouts inherit this one 
and provide additional styling and features inside of the `{{ content }}` block.

### `layout: post`

This layout accommodates the following front matter:

| Name | Type | Description |
| ---- | ---- | ----------- |
| `image` | String | Path to a large image associated with the post. Also used for OpenGraph and site feed thumbnail if enabled. |
| `image.path` | String | Same as above. Used when a `thumbnail` or `caption` needs to be assigned to the `image` object as well. |
| `image.caption` | String | Describes the image or provides credit. Markdown is allowed. |
| `author` | Object or string | Specify a post's author. |
| `comments` | Boolean | Disable comments with `comments: false`. | 
| `share` | Boolean | Add social share links to a post with `share: true`. |

**Examples:**

```yaml
image:
  path: /images/post-image-lg.jpg
  thumbnail: /images/post-image-th.jpg
  caption: "Photo credit [Unsplash](https://unsplash.com/)
```

**Note:** `image.feature` front matter has been deprecated, to fully support [jekyll-seo-tag](https://github.com/jekyll/jekyll-seo-tag). If you are not using `thumbnail` or `caption` the post image can be assigned more concisely as `image: /images/your-post-image.jpg`.

```yaml
# post specific author data if different from what is set in _config.yml 
author:
  name: John Doe
  picture: /images/john-doe.jpg
```

**Note:** Author information can centralized in `_data/authors.yml` by doing following in the document's front matter:

```yaml
author: johndoe
```

With the corresponding author key in `_data/authors.yml`:

```yaml
johndoe:
  name: John Doe
  picture: /images/john-doe.jpg
```

### `layout: page`

Visually this layout looks and acts similar `layout: post`, with the following 
differences.

- Author sidebar and page meta (published date, categories, and tags) are ommitted.
- Disqus comments are omitted.

The page layout forms the base for several other layouts like `home`, `posts`, `categories`, `tags`, and `search`.

### `layout: home`

This layout accommodates the same front matter as `layout: page`, with the 
addition of the following:

```yaml
paginate: true  # enables pagination loop, see section above for additional setup
```

When not enabled the page defaults to showing the latest 10 posts. To change the amount posts shown, you can edit or override [`/_includes/posts-limit.html`](_includes/posts-limit.html).

### `layout: posts`

### `layout: categories`

### `layout: tags`

### `layout: search`

## i18n Text

To change text found throughout the theme add the following to your 
[`/_data/theme.yml`](_data/theme.yml) file and customize as necessary.

## Navigation

By default all internal pages with a `title` will be added to the "off-canvas" 
menu. For more granular control and sorting of these menu links:

1. Create a custom list to override the default setting by adding a 
`navigation_pages` array to your [`/_data/theme.yml`](_data/theme.yml) file. 

2. Add raw page paths in the order you'd like:

   ```yaml
   navigation_pages:
     - about.md
     - cv.md
   ```

Each menu link's title and URL will be populated based on their `title` and 
`permalink` respectively.

## Author

Author information is used as meta data for post "by lines" and propagates the 
`creator` field of Twitter summary cards with the following front matter in 
`_config.yml`:

```yaml
author:
  name: John Doe
  twitter: johndoetwitter
  picture: /assets/images/johndoe.png
```

Site-wide author information can be overridden in a document's front matter in 
the same way:

```yaml
author:
  name: Jane Doe
  twitter: janedoetwitter
  picture: /assets/images/janedoe.png
```

Or by specifying a corresponding key in the document's front matter, that 
exists in `site.data.authors`. E.g., you have the following in the document's 
front matter:

```yaml
author: megaman
```

And you have the following in `_data/authors.yml`:

```yaml
megaman:
  name: Mega Man
  twitter: megamantwitter
  picture: /assets/images/megaman.png

drlight:
  name: Dr. Light
  twitter: drlighttwitter
  picture: /assets/images/drlight.png
```

Currently `author.picture` is only used in `layout: about`. Recommended size is 
`300 x 300` pixels.

## Footer

### Footer Links

### Copyright Text

## Customization

The default structure, style, and scripts of this theme can be overridden and 
customized in the following two ways.

### Overriding Includes and Layouts

Theme defaults can be [overridden](http://jekyllrb.com/docs/themes/#overriding-theme-defaults) 
by placing a file with the same name into your project's `_includes` or 
`_layouts` directory. For instance:

- To specify a custom style path or meta data to the [`_includes/head.html `](_includes/head.html) 
file, create an `_includes` directory in your project, copy 
`_includes/head.html` from Basically Basic's gem folder to 
`<your_project>/_includes` and start editing that file.

**ProTip:** to locate the theme's files on your computer run 
`bundle show jekyll-theme-basically-basic`. This returns the location of the 
gem-based theme files.

### Customizing Sass (SCSS)

To override the default [Sass](http://sass-lang.com/guide) (located in theme's 
`_sass` directory), do one of the following:

1. Copy directly from the Basically Basic gem

   - Go to your local Basically Basic gem installation directory (run 
     `bundle show jekyll-theme-basically-basic` to get the path to it).
   - Copy the contents of `/assets/stylesheets/main.scss` from there to 
     `<your_project>`.
   - Customize what you want inside `<your_project>/assets/stylesheets/main.scss`.

2. Copy from this repo.

   - Copy the contents of [assets/stylesheets/main.scss](assets/stylesheets/main.scss) 
     to `<your_project>`.
   - Customize what you want inside `<your_project/assets/stylesheets/main.scss`.

**Note:** To make more extensive changes and customize the Sass partials bundled 
in the gem. You will need to copy the complete contents of the `_sass` directory 
to `<your_project>` due to the way Jekyll currently reads those files.

To make basic tweaks to theme's style Sass variables can be overridden by adding 
to `<your_project>/assets/stylesheets/main.scss`. For instance, to change the 
accent color used throughout the theme add the following:

```scss
$accent-color: red;
```

### Customizing JavaScript

To override the default JavaScript bundled in the theme, do one of the following:

1. Copy directly from the Basically Basic gem

   - Go to your local Basically Basic gem installation directory (run 
     `bundle show jekyll-theme-basically-basic` to get the path to it).
   - Copy the contents of `/assets/javascripts/main.js` from there to 
     `<your_project>`.
   - Customize what you want inside `<your_project>/assets/javascripts/main.js`.

2. Copy from this repo.

   - Copy the contents of [assets/javascripts/main.js](assets/javascripts/main.js) 
     to `<your_project>`.
   - Customize what you want inside `<your_project>/assets/javascripts/main.js`.

## Font Awesome Icons

---

## Development

To set up your environment to develop this theme:

1. Clone this repo
2. `cd` into `/example` and run `bundle install`.

To test the theme the locally as you make changes to it:

1. `cd` into the root folder of the repo (e.g. `jekyll-theme-basically-basic`).
2. Run `bundle exec rake preview` and open your browser to 
   `http://localhost:4000/example/`. 

This starts a Jekyll server using the theme's files and contents of the 
`example/` directory. As modifications are made, refresh your browser to see 
any changes.

## Contributing

Found a typo in the documentation? Interested in adding a feature or 
[fixing a bug][issues]? Then by all means [submit an issue][new-issue] or take a
stab at submitting a [pull request][using-pull-requests]. If this is your first 
pull request, it may be helpful to read up on the [GitHub Flow][github-flow].

[issues]: https://github.com/mmistakes/jekyll-theme-basically-basic/issues
[new-issue]: https://github.com/mmistakes/jekyll-theme-basically-basic/issues/new
[using-pull-requests]: https://help.github.com/articles/using-pull-requests/
[github-flow]: https://guides.github.com/introduction/flow/

### Pull Requests

When submitting a pull request:

1. Clone the repo.
2. Create a branch off of `master` and give it a meaningful name (e.g.
   `my-awesome-new-feature`) and describe the feature or fix.
3. Open a pull request on GitHub.

Sample pages can be found in the [`/docs`](docs) and [`/example`](/example) 
folders if you'd like to tackle any "low-hanging fruit" like fixing typos, bad 
grammar, etc.

---

## Credits

### Creator

**Michael Rose**

- <https://mademistakes.com>
- <https://twitter.com/mmistakes>
- <https://github.com/mmistakes>

### Icons + Demo Images:

- [Font Awesome](https://fontawesome.com)
- [Unsplash](https://unsplash.com/)

### Other:

- [Jekyll](http://jekyllrb.com/)
- [Breakpoint](http://breakpoint-sass.com/)
- [jQuery](http://jquery.com/)
- [jQuery Smooth Scroll](https://github.com/kswedberg/jquery-smooth-scroll)
- [Lity](https://sorgalla.com/lity/)
- [Lunr](http://lunrjs.com/)

---

## License

The theme is available as open source under the terms of the [MIT License](LICENSE).
