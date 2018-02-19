---
layout: post
title: WordPress Plugin Deployment Using GitHub and Travis&nbsp;CI
excerpt: "Actually you may not use SVN for WordPress plugin and theme development and deployment. Travis can do all SVN stuff for you."
categories: articles
tags: [deployment, github, travis-ci, wordress]
image:
  feature: wordpress.png
comments: true
---

*I love [WordPress](https://wordpress.org) and I'm sure it is the best solution for corporate websites and personal blogs. I'm happy to contribute code for WordPress, create plugins and themes. I've made a few public plugins: [Inline Spoilers](https://wordpress.org/plugins/inline-spoilers/) and [Sanitize Cyrillic](https://wordpress.org/plugins/sanitize-cyrillic/).*  
*But there is one unpleasant thing that stopped me. WordPress wants you to use SVN to store public plugins and themes but development with SVN is too annoying. There are topics how to use git for WordPress but it is all about git-svn.*

> I'm expecting that you already have a submitted WordPress plugin and just want to avoid SVN things, if no, please, take a look at [this guide](https://developer.wordpress.org/plugins/wordpress-org/) and welcome back.

## Step 1: Travis CI Configuration

At this point, you have plugin's code hosted on [WordPress SVN](https://developer.wordpress.org/plugins/wordpress-org/how-to-use-subversion/) and [GitHub](https://github.com). Next you need to create configuration file and describe all things you want to be executed by [Travis](https://travis-ci/org). 

Begin with creating `.travis.yml` file in your repository to tell Travis what to do:

```yaml
language: php
php:
- 7.0

script:
- php -l *.php
```

Now enable integration with your GitHub repository:

1. Go to [Travis CI](https://travis-ci.org) and login with GitHub;
2. Hit `+` at the top of sidebar;
3. Enable integration by clicking switcher near repository name.

Travis will procceed all commits pushed to plugin repository. Also it will proceed all pull requests.

## Step 2: Configure WordPress Plugin Assets

WordPress has custom `assets/` directory in plugin SVN repository to store plugin page assets such as screenshots, icons, and etc.

Create `assets/` directory and put empty `.gitkeep` file into to make sure it exists even without any plugin assets.

## Step 3: Write Deployment Script

### <i class="fa fa-magic" aria-hidden="true"></i> ~ that's where the magic begins...

To avoid SVN stuff put it to shell script, create `deploy/deploy.sh` script file with next contents: 

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

# 8. Go to SVN home directory && copy trunk/ to tags/{tag}/
cd ../
svn cp trunk tags/$TRAVIS_TAG

# 9. Commit SVN tag
svn ci  --message "Release $TRAVIS_TAG" \
        --username $SVN_USERNAME \
        --password $SVN_PASSWORD \
        --non-interactive
```
<small>* *There are few global variables, we'll talk about it later.*</small>

It will do all deployment stuff, just execute this script. 

Wait...

Actually you don't need to execute script to deploy new version. Travis will do it for you.

## Step 4: Enable Travis CI Deployment

Not you need to tell Travis to execute deployment script on some specific events.  

> I use git tags to mark plugin releases. So everytime I push a new git tag to GitHub Travis will procceed it and submit new plugin version to WordPress SVN repository.

To enable new releases on git tags provide next configuration to `.travis.yml`:

```yaml
...
branches:
  only:
  # Enable Travis hook on tags (it is regular expression for semver tag)*
  - "/\\d\\.\\d\\.\\d/"

# Enable Travis deployment
deploy:
  # Use script as a deployment tool
  provider: script
  script: deploy/deploy.sh
  # Restrict deployment only for tags
  on:
    tags: true

# Deployment script requires few enviromnet variables
env:
  global:
  - SVN_REPOSITORY={PLUGIN SVN REPOSITORY URL}
  - secure: {SECURED SVN ACCOUNT USERNAME}
  - secure: {SECURED SVN ACCOUNT PASSWORD}
```

*\*Travis sees git tags the same way as branches. I use [semver](http://semver.org) for projects, so to enable Travis hook on this kind of tags I'm providing regular expression to determine it.*

### Environment variables

**$SVN_REPOSITORY** - URL to WordPress plugin SVN repository.  
**$TRAVIS_TAG** - Pushed tag label. *(This variable is provided by Travis)*  
**$SVN_USERNAME** - Secured WordPress account username.  
**$SVN_PASSWORD** - Secured WordPress account password.

> How to [define encrypted variables in .travis.yml](https://docs.travis-ci.com/user/environment-variables/#Defining-encrypted-variables-in-.travis.yml)

## Conclusion

Now you have complete setup of automated plugin deployment proccess.

With this way you don't need to do any SVN specific actions. You may just develop plugins and when you're ready to give users a new version just push tag for commit you want to deploy. Travis will do all required stuff and after a few minutes you'll see new deployed version on WordPress website.

**Don't forget to set *Stable tag* and *Version* in main plugin file and `readme.txt`.**
