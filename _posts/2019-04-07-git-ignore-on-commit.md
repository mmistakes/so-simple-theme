---
title: Git Ignore-On-Commit
layout: post
excerpt: "Ignore files which are already versioned."
last_modified_at: 2019-04-07 22:05:04
categories: notes
tags: [git]
image:
  feature: git.png
comments: true
---

I used SVN & Tortoise SVN for years ago. There was one cool feature: **ignore-on-commit**.

Now I use Git to track projects & file changes. I'm pretty sure that Tortoise GIT has **ignore-on-commit** feature, but I prefer to use Git within Terminal. Anyway there is a legal way to do the same behavior.

* `git update-index --assume-unchaged <filename>`  
    makes file changes 'invisible' for git tree status;
* `git update-index --no-assume-unchaged <filename>`  
    unhides file from beeing 'invisible' for git;
* `git ls-files -v | grep '^h' | cut -c3-`  
    shows all 'invisible' files;

There is one more tip with it - use aliases. Put lines below to .gitconfig file.
{% gist 8a110a1bbfcf43a985597400336c28e8 %}

Now commands at the begining is available the next way:
* `git hide <filename>`  
    makes file changes 'invisible' for git tree status;
* `git unhide <filename>`  
    unhides file from beeing 'invisible' for git;
* `git show-hidden`  
    shows all 'invisible' files;

That's it!
