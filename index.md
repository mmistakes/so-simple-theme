---
layout: page
title: OpenStreetMap - The editable map of the world!
excerpt: "OpenStreetMap - The editable map of the world!"
search_omit: true
---
OpenStreetMap (OSM) is a collaborative project to create a free editable map of the entire world. Our community in Belgium is part of the more than 2 million registered users worldwide.

# What's this community about?

Our community is about collecting data and contributing it to OpenStreetMap. Most of us are called 'mappers'. With OpenStreetMap mapping isn't just for professionals, everybody can join us! If you're intrested have a look at our community page.

# Latest Posts

<ul class="post-list">
{% for post in site.categories.blog %} 
  <li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt }}</span>{% endif %}</a></article></li>
{% endfor %}
</ul>
