---
title: Animation Film Spotlight
layout: page
entries_layout: grid
excerpt: Our team picks one animation short to inspire you every other Friday
place: Fú 福 by TAIKO Studios
image:
  path: /images/headers/MNPRX-Docs.jpg
  caption: This is a temporary header image
  thumbnail: images/blog/animation-spotlight/Fu thumbnail.jpg
taxonomy: anim-film-spot
sitemap: false
---

<p style="text-align: center;"> Our team picks one animation short to inspire you every other Friday </p>
<div class="entries-{{ page.entries_layout | default: 'list' }}">
    {% include blogs-category.html taxonomy=page.taxonomy %}
</div>
