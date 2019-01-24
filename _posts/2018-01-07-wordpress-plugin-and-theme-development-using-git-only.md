---
layout: post
title: WordPress plugin deployment using GitHub and Travis CI
excerpt: "Actually you may not use SVN for WordPress plugin and theme development and deployment. Travis can do all SVN stuff for you."
modified: 2019-01-23
categories: articles
tags: [deployment, github, travis-ci, wordpress]
image:
  feature: wordpress.png
comments: true
---

> I love [WordPress](https://wordpress.org) and I'm sure it is the best solution for corporate websites and personal blogs. I'm happy to contribute code for WordPress, create plugins and themes. I've made a few public plugins: [Inline Spoilers](https://wordpress.org/plugins/inline-spoilers/) and [Sanitize Cyrillic](https://wordpress.org/plugins/sanitize-cyrillic/).  
But there is one unpleasant thing that everytime stopped me. WordPress wants you to use SVN to store and deploy public plugins and themes but development with SVN is too annoying for me. There are topics how to use git for WordPress but it is all about git-svn.

*I'm expecting that you already have a submitted WordPress plugin and just want to avoid SVN things, otherwise, please, take a look at [this guide](https://developer.wordpress.org/plugins/wordpress-org/) and welcome back.*

## Step 1: Travis CI Configuration

At this point, you have plugin's code hosted on [WordPress SVN](https://developer.wordpress.org/plugins/wordpress-org/how-to-use-subversion/) and [GitHub](https://github.com). Next you need to create configuration and describe all things you want to be executed by [Travis](https://travis-ci/org). 

Start with creating 'dummy' `.travis.yml` file in your repository to tell Travis what to do:

{% gist 112d65c7998be8d3644c641b247abafb %}

Travis will procceed all future commits and pull requests for repository with `.travis.yml` file.

## Step 2: Configure WordPress Plugin Assets

*WordPress has custom `assets/` directory in plugin SVN repository to store plugin page assets such as screenshots, icons, and etc.*

Create `assets/` directory and put empty `.gitkeep` file into to make sure it exists even without any file inside.

## Step 3: Write Deployment Script

### 🤹‍♀️ ~ that's where the magic begins...

To avoid SVN stuff just put it to shell script, create `deploy/deploy.sh` script file with next contents: 

{% gist f598ea30e0d791e1eef9f96d941e8b2f %}
<small>* *Used global variables will be covered a little bit later.*</small>

It will do all deployment stuff, you just need to execute this script. 

Wait...

Actually you don't need to execute script to deploy a new release. Travis will do that for you.

## Step 4: Enable Travis CI Deployment

I think you don't need to deploy each new commit, you need to tell Travis to execute deployment script only on "some" specific events.  

> I'd preffer using tags to specify plugin releases. I want Travis to submit new plugin version to Wordpress each time I push a new git tag.

To enable deployment on git tags provide next configuration to `.travis.yml`:

{% gist 3763eb6231c69ea66882b16f05ef9f97 %}

<small>* *Travis sees git tags the same way as branches.*</small>

> I like to use [semver](http://semver.org) for projects, I've set semver regular expression as a branch filter to allow deployments only for this kind of tags.

### Environment variables

**$SVN_REPOSITORY** - WordPress plugin SVN repository URL.  
**$TRAVIS_TAG** - Tag label. *(This variable is fetched and provided by Travis from GitHub)*  
**$SVN_USERNAME** - Encrypted WordPress account username.  
**$SVN_PASSWORD** - Encrypted WordPress account password.

*How to [define encrypted variables in .travis.yml](https://docs.travis-ci.com/user/environment-variables/#Defining-encrypted-variables-in-.travis.yml).*

## Conclusion

*Now you have complete setup of automated plugin deployment proccess.*

*With this way you don't need to do any SVN specific actions. You may just develop plugins and when you're ready to give users a new version just push tag for commit you want to deploy. Travis will do all required stuff and after a few minutes you'll see new deployed version on WordPress website.*

## References

* [WordPress](https://wordpress.org)
* [WordPress Plugin Handbook](https://developer.wordpress.org/plugins/wordpress-org/)
* [GitHub](https://github.com)
* [Travis](https://travis-ci/org)
* [Semantic Versioning](http://semver.org)
