---
layout: post
title: Open Source is Awesome!
categories: blog
excerpt: How this website is built upon with open-source code
tags: []
image:
  feature:
link:
date: 2017-08-22
modified: 2017-08-25
share: true
author: mark_dunning
---

# Open Source tools are awesome!

The Sheffield Bioinformatics Core website is hosted on [github](http://www.github.com) and anyone, anywhere, is welcome to check out the code for themselves. It's actually built-upon the efforts of others who have invested a lot of time in creating software that allows sophisticated websites to be constructed with minimal amounts of coding. Thanks to such open-source projects, I've been able to create the content of the website by writing a few lines of [markdown](https://en.wikipedia.org/wiki/Markdown), which is a easy to write and easy to read markup language. 

Everything was going well, until things start to break :confused: :grimacing: 

![A helpful build report from github](https://pbs.twimg.com/media/DH2sg66XYAAtxgw.jpg)

I spent many fruitless hours of hacking away at various pages, and attemping to restore earlier versions of the site, the page was still broken :scream:

![tearing hair out trying to fix the error](https://pbs.twimg.com/media/DH3GG8LWAAAbh3S.jpg)

Fortunately the community came to the rescue. Because all the code is public and built on top of other open projects, others were able to see the state of the website, reproduce my error and come to my rescue with a fix. As it turned-out, the error was related to issues [others had seen](https://github.com/mmistakes/so-simple-theme/issues/250#issuecomment-323451633) and already fixed. Thanks to the issue-tracking system in github, I have [detailed documentation](https://github.com/sheffield-bioinformatics-core/sheffield-bioinformatics-core.github.io/pull/1) from @KirstieJane of the files that were at fault, should things go pear-shaped again

So, thanks to open source software and those that embrace it :tada: :clap: