---
layout: about-page
title: Publications
excerpt: Artineering Publications
image:
  path: images/about/winter.jpg
  caption: Photo of Tallinn by Jaanus Jagomägi
entries_layout: list
sort_by: date
sort_order: reverse
schema: ContactPoint
---
## Press
{: .pull-center .top1}

<div class="entries-{{ page.entries_layout | default: 'list' }}">
  {%- for entry in site.data.press -%}
    {% include entry.html collection='press' %}
  {%- endfor -%}
</div>

---
{: .top2}

## Research
{: .pull-center}

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
