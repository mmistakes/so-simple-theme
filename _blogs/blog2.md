---
title: Monthly Digest
layout: page
permalink: /blog2
entries_layout: list
excerpt: We share our thoughts on everything from 3D rendering to career as an artist
place: Image by Dimitris Christoua from Pixabay
image:
  path: /images/headers/MNPRX-Docs.jpg
  caption: This is a temporary header image
  thumbnail: images/blog/blog-articles/article-1/article-1-banner-image.jpg
taxonomy: blogposts2
sitemap: false
---

<p style="text-align: center;"> We share our thoughts on everything from 3D rendering to career as an artist </p>
<div class="blog-list entries-{{ page.entries_layout | default: 'list' }}">
    {% include blogs-category.html taxonomy=page.taxonomy %}
</div>


