---
layout: page
title: Welcome
excerpt: "A simple and clean responsive Jekyll theme for words and photos."
search_omit: true
---

### I am a 1st level header

This website is a work in progress but should give you a sense of the work that Kirstie Whitaker and her collaborators are conducting at the Alan Turing Institute.

## I am a 2nd level header

I am some text.

### I am a 3rd level header

This is some text

#### I am a 1st level header

lalaland

## Committed to Open Science


allaaland

## Reproducible research


bjklaf;jkasdl


## Questions about mental health and adolescent brain development

ajfld;akljf

<ul class="post-list">
{% for post in site.posts limit:10 %}
  <li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt | remove: '\[ ... \]' | remove: '\( ... \)' | markdownify | strip_html | strip_newlines | escape_once }}</span>{% endif %}</a></article></li>
{% endfor %}
</ul>
