---
layout: post
title: WordPress Plugin and Theme Development Using Git Only
excerpt: "Like WordPress and don't line SVN? Take a look how you can develop WordPress plugins and themes without any SVN specific thing."
categories: articles
tags: [wordress, plugin, git, travis-ci, github, development]
image:
  feature: wordpress-development.png
comments: true
---

I love [WordPress](https://wordpress.org) and I'm sure it is the best solution for corporate websites and blogs for companies who don't want or can't have own IT-man. I would be happy to contribute the code for WordPress, create plugins and themes. I even created few plugins and made two of them public ([Inline Spoilers](https://wordpress.org/plugins/inline-spoilers/) and [Sanitize Cyrillic](https://wordpress.org/plugins/sanitize-cyrillic/)).  
WordPress requires to use SVN to store plugins and themes but development with SVN is too annoying for me. There are topics how to use git for wordpress but it all about git-svn. I tried to use it but I don't like this way so much so I stopped supporting of created plugins.

Some time ago I thougt about created plugins and decided to move it forward but I still don't want to mess with SVN. So I decided to move all \`disliked\` stuff to CI service. I'm using [GitHub](https://github.com) to store plugins code so [Travis CI](https://travis-ci.org) is the best choise.

I expect that you are already familiar with the plugin development and have at least one.

## Step 0: Setup GitHub Repository

## Step 1: Travis CI Configuration

We begin with creating `.travis.yml` file in project directory.  
It lets Travis CI to know what it should do with your GitHub repository.

```yaml
# Which Linux distributive should be used
dist: trusty

# What language required,
# since WordPress is written in PHP so set it accordingly
language: php
php:
- 7.0
- 7.1

# How many history commits should be cloned,
# actually it use the last commit but I prefer to have 5
git:
  depth: 5

# Restrict branched for Travis CI,
# I always store stable code in master branch, 
# so I don't need to run CI on any other branch
branches:
  only:
  - master

# This is major required Travis CI thing:
# I just use syntax linter to make build passing,
# but actually there should be code tests
script:
- php -l *.php
```

Now enable Travis CI integration:

1. Go to [Travis CI](https://travis-ci.org) and login with GitHub;
2. Hit `+` at the top of left sidebar;
3. Enable plugin integration by clicking switch.

Now Travis will procceed all commits pushed to master branch.  
Travis will also proceed all pull requests by default.

## Step 2: Configure WordPress Plugin Assets

WordPress has custom `assets/` directory in plugin SVN repository to store plugin page assets such as screenshots, icons, etc. Create `assets/` directory and put empty `.gitkeep` file into to make sure it exists even without any plugin assets.

## Step 3: Write Deployment Script

At this point we have plugin's code and `assets/` directory in github repository.  
It is a good practice to have project description in `README.md` file. I'm using plugin's `readme.txt` with just updated markdown syntax.

Put all SVN stuff in deployment script. Create `deploy/` directory and `deploy/deploy.sh` file.

```shell
#!/usr/bin/env bash

#  1. Clone complete SVN repository to separate directory
svn co $SVN_REPOSITORY ../svn

#  2. Copy git repository contents to SNV trunk/ directory
cp -R ./* ../svn/trunk/

#  3. Go to trunk/
cd ../svn/trunk/

#  4. Move assets/ to SVN /assets/
mv ./assets/ ../assets/

#  5. Delete .git/
rm -rf .git/

#  6. Delete deploy/
rm -rf deploy/

#  7. Delete .travis.yml
rm .travis.yml

#  8. Delete README.md
rm README.md

#  9. Go to SVN home directory
cd ../

# 10. Copy trunk/ to tags/{tag}/
svn cp trunk tags/$TRAVIS_TAG

# 11. Commit SVN tag
svn ci  --message "Release $TRAVIS_TAG" \
        --username $SVN_USERNAME \
        --password $SVN_PASSWORD \
        --non-interactive
```

It will do all deployment stuff, just execute this script. Wait, actually you don't need to execute it to deploy new release. Travis will do it for you.  
*There are few global variables, we'll talk about it later.*

## Step 4: Enable Travis CI Deployment

We need to tell Travis to execute deployment script on some specific.  I prefer to sync plugin releases with git tags. So everytime I push a new tag to github repository Travis will procceed it and submit new plugin version to WordPress SVN repository.

```yaml
...
branches:
  only:
  - master

  # Enable Travis hook on tags
  - "/\\d\\.\\d\\.\\d/"
...
```
*Travis sees git tags the same way as branches. I use [semver](http://semver.org) for projects, so to enable Travis hook on this kind of tags I'm providing regular expression to determine it.*

Also put next few lines at the very bottom of `.travis.yml` file.

```yaml
...

# Enable Travis deployment
deploy:
  skip_cleanup: true
  # Use script as a deployment tool
  provider: script
  script: deploy/deploy.sh
  # Restrict deployment only for tags and builds on PHP 7.1
  # to prevent multiply deployments of the same version.
  on:
    tags: true
    php: 7.1

# Deployment script requires few enviromnet variables
env:
  global:
  - SVN_REPOSITORY={PLUGIN SVN REPOSITORY URL}
  - secure: {SECURED SVN ACCOUNT USERNAME}
  - secure: {SECURED SVN ACCOUNT PASSWORD}
```

### Environment variables

**$SVN_REPOSITORY** - URL to WordPress plugin SVN repository.  
**$TRAVIS_TAG** - This variable is provided by travis. It contains pushed tag label.  
**$SVN_USERNAME** - WordPress account username provided in secured format.  
**$SVN_PASSWORD** - WordPress account password also provided in secured way.

*Here is docs of how to [define encrypted variables in .travis.yml](https://docs.travis-ci.com/user/environment-variables/#Defining-encrypted-variables-in-.travis.yml)*

## Conclusion

Now we have complete setup of automated plugin deployment proccess.

With this way you don't need to make any SVN specific actions. You may just develop plugins and themes and when you're ready to give users a new version just commit code to git repository and push tag for commit you want to deploy. Travis will do all required stuff and after a few minutes you'll see deployed version on WordPress website.
