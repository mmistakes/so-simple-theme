---
layout: page
title: Latest Posts
excerpt: "A simple and clean responsive Jekyll theme for words and photos."
---

{% for post in site.posts %}
  {% include post-grid.html %}
{% endfor %}
