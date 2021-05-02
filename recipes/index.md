---
layout: page
title: Recipes
excerpt: "An archive of recipes posts sorted by date."
search_omit: true
---

<ul class="recipe-list">
{% for recipe in site.categories.recipes %} 
  <li><article><a href="{{ site.url }}{{ recipe.url }}">{{ recipe.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ recipe.date | date: "%B %d, %Y" }}</time></span>{% if recipe.excerpt %} <span class="excerpt">{{ recipe.excerpt | remove: '\[ ... \]' | remove: '\( ... \)' | markdownify | strip_html | strip_newlines | escape_once }}</span>{% endif %}</a></article></li>
{% endfor %}
</ul>
