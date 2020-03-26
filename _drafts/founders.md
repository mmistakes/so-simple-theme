---
title: Founder's Corner
layout: page
entries_layout: list
excerpt: Follow our journey from the beginning until now
place: You can add extra text under the thumbnail
image:
  path: /images/headers/MNPRX-Docs.jpg
  caption: This is a temporary header image
  thumbnail: images/logo.png
taxonomy: blogposts3
sitemap: false
---

<div class="blog-list entries-{{ page.entries_layout | default: 'list' }}">
    {% include blogs-category.html taxonomy=page.taxonomy %}
</div>
