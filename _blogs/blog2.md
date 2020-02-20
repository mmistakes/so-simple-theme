---
title: Long form blog posts
layout: page
permalink: /blog2
entries_layout: list
excerpt: This is a short introduction for this blog series
place: You can add extra text under the thumbnail
image:
  path: /images/headers/MNPRX-Docs.jpg
  caption: This is a temporary header image
  thumbnail: images/logo.png
taxonomy: blogposts2
---

<div class="blog-list entries-{{ page.entries_layout | default: 'list' }}">
    {% include blogs-category.html taxonomy=page.taxonomy %}
</div>


