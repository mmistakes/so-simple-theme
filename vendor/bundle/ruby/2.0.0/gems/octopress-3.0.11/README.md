# Octopress

Octopress is an obsessively designed toolkit for writing and deploying Jekyll blogs. Pretty sweet, huh?

[![Gem Version](https://badge.fury.io/rb/octopress.svg)](http://badge.fury.io/rb/octopress)
[![Build Status](https://travis-ci.org/octopress/octopress.svg?branch=master)](https://travis-ci.org/octopress/octopress)

## Installation

Add this line to your application's Gemfile:

    gem 'octopress', '~> 3.0'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install octopress

## Configuration

Octopress reads its configurations from `_config.yml`. Here's what the configuration looks like by default.

```yaml
# Default extension for new posts and pages
post_ext: markdown
page_ext: html

# Default templates for posts and pages
# Found in _templates/
post_layout: post
page_layout: page

# Format titles with titlecase?
titlecase: true

# Change default template file (in _templates/)
post_template: post
page_template: page
draft_template: draft
```

## Octopress CLI Commands

Here are the subcommands for Octopress.

```
init <PATH>         # Adds Octopress scaffolding to your site
new <PATH>          # Like `jekyll new` + `octopress init`
new post <TITLE>    # Add a new post to your site
new page <PATH>     # Add a new page to your site
new draft <TITLE>   # Add a new draft post to your site
publish <POST>      # Publish a draft from _drafts to _posts
unpublish <POST>    # Search for a post and convert it into a draft
isolate [POST]      # Stash all posts but the one you're working on for a faster build
integrate           # Restores all posts, doing the opposite of the isolate command
deploy              # deploy your site via S3, Rsync, or to GitHub pages.
```

Run `octopress --help` to list sub commands and `octopress <subcommand> --help` to learn more about any subcommand and see its options.

### Init

```sh
$ octopress init <PATH> [options]
```

This will copy Octopress's scaffolding into the specified directory. Use the `--force` option to overwrite existing files. The scaffolding is pretty simple:

```
_templates/
  draft
  post
  page
```

### New Post

This automates the creation of a new post.

```sh
$ octopress new post "My Title"
```

This will create a new file at `_posts/YYYY-MM-DD-my-title.markdown` with the following YAML front-matter already added.

```
layout: post
title: "My Title"
date: YYYY-MM-DDTHH:MM:SS-00:00
```

#### Command options

| Option               | Description                             |
|:---------------------|:----------------------------------------|
| `--template PATH`    | Use a template from <path>              |
| `--date DATE`        | The date for the post. Should be parseable by [Time#parse](http://ruby-doc.org/stdlib-2.1.0/libdoc/time/rdoc/Time.html#method-i-parse) |
| `--slug SLUG`        | Slug for the new post.                  |
| `--dir DIR`          | Create post at _posts/DIR/.             |
| `--force`            | Overwrite existing file.                |

### New Page

Creating a new page is easy, you can use the default file name extension (.html), pass a specific extension, or end with a `/` to create
an index.html document.

```
$ octopress new page some-page           # ./some-page.html
$ octopress new page about.md            # ./about.md
$ octopress new page docs/               # ./docs/index.html
```

If you are working with collections, you might add a page like this:

```
$ octopress new page _legal/terms        # ./_legal/terms.html
```

After the page is created, Octopress will tell you how to configure this new collection.


#### Command options

| Option               | Description                             |
|:---------------------|:----------------------------------------|
| `--template PATH`    | Use a template from <path>              |
| `--title TITLE`      | The title of the new page               |
| `--date DATE`        | The date for the page. Should be parseable by [Time#parse](http://ruby-doc.org/stdlib-2.1.0/libdoc/time/rdoc/Time.html#method-i-parse) |
| `--force`            | Overwrite existing file.                |

Note: The default page template doesn't expect a date. If you want to add dates
to your pages, consider adding `date: {{ date }}` to the default template
`_templates/page`, or create a new template to use for dated pages. Otherwise,
you will have the `--date` option to add a date to a page.

### New Draft

This will create a new post in your `_drafts` directory.

```sh
$ octopress new draft "My Title"
```

| Option             | Description                               |
|:-------------------|:------------------------------------------|
| `--template PATH`  | Use a template from <path>                |
| `--date DATE`      | The date for the draft. Should be parseable by [Time#parse](http://ruby-doc.org/stdlib-2.1.0/libdoc/time/rdoc/Time.html#method-i-parse) (defaults to Time.now) |
| `--slug SLUG`      | The slug for the new post.                |
| `--force`          | Overwrite existing file.                  |

### Publish a draft

Use the `publish` command to publish a draft to the `_posts` folder. This will also rename the file with the proper date format.

```sh
$ octopress publish _drafts/some-cool-post.md
$ octopress publish cool
```
In the first example, a draft is published using the path. The publish command can also search for a post by filename. The second command
would work the same as the first. If other drafts match your search, you will be prompted to select them from a menu. This is often much
faster than typing out the full path.

| Option             | Description                               |
|:-------------------|:------------------------------------------|
| `--date DATE`      | The date for the post. Should be parseable by [Time#parse](http://ruby-doc.org/stdlib-2.1.0/libdoc/time/rdoc/Time.html#method-i-parse) |
| `--slug SLUG`      | Change the slug for the new post.         |
| `--dir DIR`        | Create post at _posts/DIR/.               |
| `--force`          | Overwrite existing file.                  |

When publishing a draft, the new post will use the draft's date. Pass the option `--date now` to the publish command to set the new post date from your system clock. As usual, you can pass any compatible date string as well.

### Unpublish a post

Use the `unpublish` command to move a post to the `_drafts` directory, renaming the file according to the drafts convention.

```sh
$ octopress unpublish _posts/2015-01-10-some-post.md
$ octopress unpublish some post
```

Just like the publish command, you can either pass a path or a search string to match the file name. If more than one match is found, you
will be prompted to select from a menu of posts.

#### Templates for Posts and pages

Octopress post and page templates look like this.

```
---
layout: {{ layout }}
title: {{ title }}
---
```

Dates get automatically added to a template for posts, and for pages if a --date option is set.

You can add to the YAML front matter, add content below and even even use liquid tags and filters from your site's plugins. There are
a handful of local variables you can use when working with templates.

| Variable           | Description                               |
|:-------------------|:------------------------------------------|
| `date`             | The date (if set) or Time.now.iso8601     |
| `title`            | The title of the page (if set)            |
| `slug`             | The title in slug form                    |
| `ymd`              | The date string, YYYY-MM-DD format        |
| `year`             | The date's year                           |
| `month`            | The date's month, MM                      |
| `day`              | The date's day, DD                        |

By default Octopress has templates for pages, posts and drafts. You can change them or create new ones for different types of content.
To create linkposts template, add a file at `_templates/linkpost`, such as:

```
---
title: {{ title }}
external-url: {{ url }}
---
```

Then you can use it with a new post like this:

```sh
$ octopress new post "Some title" --template linkpost
$ octopress new post "Some title" -tm _templates/linkpost
```

In the second example, I'm passing the full template file path. This way I can use my shell's tab to auto-complete feature.

When creating templates, file name extensions are unnecessary since the files are just plain text anyway.

### Isolate

The `isolate` command will allow you to stash posts in `_posts/_exile` where they will be ignored by Jekyll during the build process.
Run `octopress integrate` to restore all exiled posts. This can be helpful if you have a very large site and you want to quickly preview a build
for a single post or page.

```sh
$ octopress isolate                                # Move all posts
$ octopress isolate _posts/2014-10-11-kittens.md   # Move post at path
$ octopress isolate kittens                        # Move post matching search
```

In the third example, if multiple posts match the search a prompt will ask you to select a post from a menu.

### Deploying your site

The Octopress gem comes with [octopress-deploy](https://github.com/octopress/deploy) which allows you to easily deploy your site with Rsync, on S3 or Cloudfront, to GitHub pages, or other Git based deployment hosting platforms.

Once you've built your site (with `jekyll build`) you can deploy it like this:

```
$ octopress deploy
```

This reads a `_deploy.yml` configuration and deploys your site. Read below to learn how Octopress can generate a deployment configuration file for you.

Note: The `_deploy.yml` is processed through ERB, which makes it easy to load configurations from environment variables.

Deploy has a few commands you should know.

| Commands                                   | Description                                                        |
|:-------------------------------------------|:-------------------------------------------------------------------|
| `octopress deploy`                         | Deploy your site (based on the `_deploy.yml` configuration)        |
| `octopress deploy init <METHOD> [options]` | Generate a config file for the deployment method. (git, s3, rsync) |
| `octopress deploy pull [DIR]`              | Pull down your site into a local directory.                        |
| `octopress deploy add-bucket <NAME>`       | (S3 only) Add a bucket using your configured S3 credentials.       |


#### Generate Deployment configuration

**Remember to add your configuration to `.gitignore` to be sure
you never commit sensitive information to your repository.**


Octopress can generate a deployment configuration file for you using the `octopress deploy init` command.

```
$ octopress deploy init s3
$ octopress deploy init rsync
$ octopress deploy init git git@github.com:user/project
```

This will generate a `_deploy.yml` file in your current directory which you can edit to add any necessary configuration.

If you like, you can pass configurations as command line options. To see specific options for any method, add the `--help` flag.
For example to see the options for configuring S3:

```
$ octopress deploy init s3 --help
```

If you want to publish your site to a staging server, you can create a second configuration. For example, to setup rsync for a staging site, you'd do this.

```
$ octopress deploy init rsync --config _staging.yml
```

After modifying the configuration file, you can deploy your site to it like this:

```
$ octopress deploy --config _staging.yml
```

#### Git Deployment Configuration

Only `git_url` is required. Other options will default as shown below.

| Config        | Description                                      | Default
|:--------------|:-------------------------------------------------|:---------------|
| `method`      | Deployment method, in this case use 'git'        |                |
| `site_dir`    | Path to static site files                        | _site          |
| `git_url`     | Url for remote git repository                    |                |
| `git_branch`  | Deployment branch for git repository             | master         |
| `deploy_dir`  | Directory where deployment files are staged      | .deploy        |
| `remote`      | Name of git remote                               | deploy         |

#### Rsync Deployment Configuration

| Config         | Description                                       | Default
|:---------------|:--------------------------------------------------|:---------------|
| `method`       | Deployment method, in this case use 'rsync'       |                |
| `site_dir`     | Path to static site files                         | _site          |
| `user`         | ssh user, e.g user@host.com                       |                |
| `port`         | ssh port                                          | 22             |
| `remote_path`  | Remote destination's document root                |                |
| `exclude_from` | Path to a file containing rsync exclusions        |                |
| `exclude`      | Inline list of rsync exclusions                   |                |
| `include_from` | Path to a file containing rsync inclusions        |                |
| `include`      | Inline list of inclusions to override exclusions  |                |
| `delete`       | Delete files in destination not found in source   | false          |

You can rsync to a local directory by configuring `remote_path` and leaving off `user` and `port`.

#### Amazon S3 Deployment Configuration

To deploy with Amazon S3 you will need to install the [aws-sdk-v1 gem](https://rubygems.org/gems/aws-sdk-v1).

Important: when using S3, you must add your `_deploy.yml` to your .gitignore to prevent accidentally sharing
account access information.

| Config              | Description                                           | Default
|:--------------------|:------------------------------------------------------|:-------------|
| `method`            | Deployment method, in this case use 's3'              |              |
| `site_dir`          | Path to static site files                             | _site        |
| `bucket_name`       | S3 bucket name                                        |              |
| `access_key_id`     | AWS access key                                        |              |
| `secret_access_key` | AWS secret key                                        |              |
| `distribution_id`   | [optional] AWS CloudFront distribution id             |              |
| `remote_path`       | Directory files should be synced to.                  | /            |
| `verbose`           | [optional] Display all file actions during deploy.    | false        |
| `incremental`       | [optional] Incremental deploy (only updated files)    | false        |
| `region`            | [optional] Region for your AWS bucket                 | us-east-1    |
| `delete`            | Delete files in `remote_path` not found in `site_dir` | false        |
| `headers`           | Set headers for matched files                         | []           |

If you choose a bucket which doesn't yet exist, Octopress Deploy will offer to create it for you, and offer to configure it as a static website.

If you configure Octopress to delete files, all files found in the `remote_path` on S3 bucket will be removed unless they match local site files.
If `remote_path` is a subdirectory, only files in that subdirectory will be evaluated for deletion.

You can also set up your configuration to read your AWS credentials from your environment variables using ERB like this:

```
access_key_id: <%= ENV['AWS_ACCESS_KEY'] %>
secret_access_key: <%= ENV['AWS_SECRET_KEY'] %>
```

##### S3 Headers

You can create an array of header congifs to set expiration, content and cache settings for any paths matching the `filename`.

| Header Config       | Description                                           | Default
|:--------------------|:------------------------------------------------------|:-------------|
| `filename`          | A regex or a substring of the file to match           |              |
| `site_dir`          | An http date or a number of years or days from now    |              |
| `content_type`      | A string which is passed through to the headers       |              |
| `content_encoding`  | A string which is passed through to the headers       |              |
| `cache_control`     | A string which is passed through to the headers       |              |

Here is how you might set expriation and cache controls for CSS and Javascript files.

```yaml
headers:
  - filename: '^assets.*\.js$'
    expires: '+3 years'
    cache_control: 'max-age=94608000'
    content_type: 'application/javascript'
  - filename: '^assets.*\.css$'
    expires: '+3 years'
    cache_control: 'max-age=94608000'
    content_type: 'text/css'
```

##### AWS config via ENV

If you prefer, you can store AWS access credentials in environment variables instead of a configuration file. 

| Config              | ENV var                        |
|:--------------------|:-------------------------------|
| `access_key_id`     | AWS_ACCESS_KEY_ID              |
| `secret_access_key` | AWS_SECRET_ACCESS_KEY          |

Note: configurations in `_deploy.yml` will override environment variables so be sure to remove those if you decide to use environment variables.

### Pull down your site

With the `pull` command, you can pull your site down into a local directory.

```
$ octopress deploy pull [DIR]
```

Mainly you'd do this if you're troubleshooting deployment and you want to see if it's working how you expected.

## Contributing

1. Fork it ( https://github.com/octopress/octopress/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
