---
layout: post
title: "Building a Static Website with Jekyll"
modified:
categories: blog
excerpt:
tags: []
image:
  feature:
date: 2016-11-20T17:24:23-05:00
modified: 2016-11-20T17:24:23-05:00
share: true
---

Greetings traveler, this post will show you how to create a beautiful static website (like this one)
with [Jekyll][jekyll], and host it on [GitHub][github] with a custom domain from [Amazon Route 53][route-53].

## Introduction
Jekyll is a tool that allows you to transform your plain text into static websites and blogs. As we
speak I am typing this content in markdown, which will later be compiled along with other website
assets into static HTML. Jekyll is not the only tool out there that does this, but it is among the
most popular tool for the job. Alternatives can be found at [StaticGen][static-gen].
[GitHub Pages][github-pages] are powered by Jekyll, so hosting your code on GitHub actually will
allow you to host and deploy your site for free. Lastly, a custom domain name can be given to your
page. I chose to use Amazon Route 53 as my DNS web service.

## Now for the Action

### 1. Choose a theme
A variety of Jekyll themes are available to give you a quick place from which to begin your site.
Check out the following sites in no particular order:
- [jekyllthemes.org](http://jekyllthemes.org)
- [jekyllthemes.io](https://jekyllthemes.io)
- [themes.jekyllrc.org](http://themes.jekyllrc.org)

### 2. Setup your repo
Once you have chosen a theme, follow a link to its source on GitHub and fork the repository. The
theme itself may include instructions on how to set it up. However, in general you will now
want to do the following:
```
git clone git@github.com:username/repo.git
cd repo
```
If no Gemfile exists you will want to create one that looks like the following:
```
source "https://rubygems.org"
gem "jekyll"
```
Next you will want to install these required Ruby dependencies and locally serve the webpage with:
```
bundle install
bundle exec jekyll serve
```

### 3. Personalize
A nice feature of Jekyll is its ability to store site wide configuration in a `_config.yml` file.
Much of the site can now be personalized by editing this YAML file with your own values. For
further customizations check out the documentation on Jekyll's own [website][jekyll]. Editing
files other than the config will rebuild the site automatically while using the jekyll serve command.

### 4. Deploy to GitHub Pages
When using Jekyll, all it takes to deploy your site is to push your changes to GitHub! Since you
have forked the theme's repo, GitHub Pages will most likely already be enabled. If they are not,
you can enable them in your repositories Settings tab. After doing so you will be able to find your
site at a url of the form `https://username.github.io/repo`. If you are happy with this URL, you are done! However if you would like a custom domain name proceed to the following steps.

### 5. Register your domain
I chose to use Amazon Route 53 to register this site's domain name. Most services offer a
single dot com domain name for a low yearly cost of around twelve dollars.

### 6. Wire up the domain
While registering a domain with Amazon Route 53, a Hosted Zone will be created for you.
By default this hosted zone will have `NS` and `SOA` record sets. The first thing you will
want to do is create an `A` record set pointing to the following IP addresses:
```
192.30.252.153
192.30.252.154
```
Lastly, you will want to create a `CNAME` record set pointing to your GitHub Pages URL of the
form `username.github.io/repo`.

### 7. Enjoy
Congratulations, you now have a fully functional Jekyll site hosted on GitHub with a custom
domain. Iterating on this site or adding additional content is as simple as pushing up new
commits!

[jekyll]:       http://jekyllrb.com
[github]:       https://github.com
[route-53]:     https://aws.amazon.com/route53
[static-gen]:   https://www.staticgen.com
[github-pages]: https://pages.github.com
