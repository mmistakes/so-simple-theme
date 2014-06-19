---
layout: post
title: "Override Author Byline Test Post"
description: "An article to test overriding the default site author."
category: articles
tags: [sample post, readability, test]
author:
  name: Billy Rick
  avatar: bio-photo-alt.jpg
comments: true
share: true
---

For those of you who may have content written by multiple authors on your site, here's a new feature I added to So Simple.

Traditionally you would assign a global author for the entire site and those attributes would be used in all post bylines, social networking links in the footer, Twitter Cards, and Google Authorship. These `owner` variables still work the same way when set in your `config.yml`, but now if you add an author variable to a post's YAML front matter, you can override a post's author byline.

Let's say we have an author Billy Rick --- he wrote this post and we want his name and photo to appear on the page instead of whoever the default site author is. To do so we'd add the following YAML front matter.

{% highlight yaml %}
author:
  name: Billy Rick
  avatar: billy-photo.jpg    #place in /images
  twitter: billyrick         #marked as a creator for Twitter Card links
{% endhighlight %}
