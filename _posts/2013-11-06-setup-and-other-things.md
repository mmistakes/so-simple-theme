---
layout: post
title: "My Jekyll Setup and related things - Part 1"
description: "Post on my Jekyll setup Part 1"
tags: [blog, setup]
comments: true
link:   
share: true
published: true
---

I think finally I would like to write about how this blog is set up, for all you geeks out there, I am sure you might enjoy this.

So let us begin!

##Jekyll and all that

[Jekyll](http://jekyllrb.com/), is a simple static blogging system, or as they say, blogging for hackers. Basically, it eliminates the database from the backend. All that is there is your content (posts) and that is it. No database to store all that content, and retrive it when a user requests to view a post, hence making it blazing fast.

A Jekyll blog is essentially 'built' before you publish it. Sounds a bit complicated you say? Not really, you don't even need to know a lot of programming to get it all working honestly.

##What is needed

Here is a list of all the things you need to get it up and working.

1. [Ruby](https://www.ruby-lang.org/en/downloads/) - Don't worry too much about knowing Ruby, you just need to download and install it based on your platform. I am currently using Windows, where it is a bit more involved, but the guides are very straight forward.
2. [Jekyll](http://jekyllrb.com/) - is very straightfoward to install from the command-line/shell once you have Ruby installed, home page of Jekyll shows you how to do it.
3. [GitHub](https://github.com/) account, you will need this to either:
 - Host your blog on GitHub itself, eliminating the need for a dedicated hosting service.
 - Storing your blog for version control if you want.
 - If you plan on using a theme (process shown below), you can either download the theme directly, or fork it on GitHub and use Git.
4. [Git](http://git-scm.com/) - version control. They have a simple Windows installer, be sure to use Windows style commits in the installer if you are on Windows, and add it to the Windows commandl-line (In the installation steps you will be asked to do this.)
5. A Jekyll theme - You can pick up up at [Jekyll themes](http://jekyllthemes.org/), setups and how-tos included with each of them.
6. [Dropbox](https://db.tt/byHoqV0) account (Optional), I keep my blog in Dropbox so that it is synced across machines and makes my writing process as simple as creating a new text file from anywhere, be it my office machine, home machine or phone/tablet etc. Will explain later on in the post.

And that is pretty much it :). Scared already? Don't be. Read on.

#My setup

Ok granted my setup is a bit lame and complicated. You don't need something as complicated, I just do it to keep things automated and all that.

Dropbox holds my blog itself. All the assets, images, posts etc. It is all hosted on GitHub Pages (will explain how). To write a new post, I create a new text file in the _posts directory, give it a proper name according to the Jekyll naming convention <YYYY-MM-DD-name-of-post.md>, note the .md at the end, that is a [Markdown](http://daringfireball.net/projects/markdown/) based file. Very simple plain text format for writing, easily understood and picked up, just follow the link.

Once the file is created, there is just some little bit of stuff to do to add the front matter, basically a header of sorts for Jekyll's parsing engine to understand what the post looks like, it's name/description etc. An example is below from the first post:

{% highlight css %}
---
layout: post
title: "The Blank Page"
description: "Intro Post"
tags: [blog]
modified: 
image:
  feature: openbook.jpg
  credit: John Carey
  creditlink: http://fiftyfootshadows.net/mjuploads/writing.XYVnzAIkenzI.jpg
comments: true
share: true
---
{% endhighlight %}

After which I basically use standard Markdown for writing my plain text post, include pictures etc. and save the file. Once I have done that, all I need to do is commit back to GitHub and the magic over at GitHub Pages builds the Jekyll blog and publishes it. The commit is also automated with simple bash scripts that are scheduled on a Windows machine that is always on (my office one :P), all of that will be in Part 2.

To be continued in Part 2.

You can follow the author or shout at him on [Twitter](https://twitter.com/abijango)