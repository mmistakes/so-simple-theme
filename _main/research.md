---
layout: about-page
title: Research
excerpt: Artineering Publications
image:
  header: images/about/winter.jpg
  caption: Photo of Tallinn by Jaanus Jagomägi
entries_layout: list
sort_by: date
sort_order: reverse
schema: ContactPoint
redirect_from:
  - /publications/
---

<div class="entries-{{ page.entries_layout | default: 'list' }}">
  {% include documents-collection.html collection='publications' sort_by=page.sort_by sort_order=page.sort_order %}
</div>

---
{: .top2}

### Symbols
<div class="aio-symbols">
  <span><i class="fas fa-award"></i>Award</span>
  <span><i class="far fa-scroll"></i>Conference paper</span>
  <span><i class="far fa-presentation"></i>Conference talk</span>
  <span><i class="far fa-book"></i>Journal paper</span>
  <span><i class="far fa-graduation-cap"></i>Thesis</span>
</div>
