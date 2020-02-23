---
title: Blog 1
layout: page
permalink: /blog
entries_layout: grid
excerpt: This is a short introduction for this blog series
place: You can add extra text under the thumbnail
image:
  path: /images/headers/MNPRX-Docs.jpg
  caption: This is a temporary header image
  thumbnail: images/logo.png
taxonomy: blogposts1
sitemap: false
---

<div class="entries-{{ page.entries_layout | default: 'list' }}">
    {% include blogs-category.html taxonomy=page.taxonomy %}
</div>



