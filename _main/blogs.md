---
title: Blog
layout: page
entries_layout: grid
---

<div class="entries-{{ page.entries_layout | default: 'list' }} top2">
  {% include documents-collection.html collection='blogs' sort_by=page.sort_by sort_order=page.sort_order %}
</div>