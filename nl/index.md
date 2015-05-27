---
layout: nl-page
title: OpenStreetMap - De editeerbare online kaart!
excerpt: "OpenStreetMap - De editeerbare online kaart!
search_omit: true
---
OpenStreetMap (OSM) is een collaboratief project 

# Blog

<ul class="post-list">
{% for post in site.categories.blog %} 
	{% if post.categories contains 'en' %}
		<li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt }}</span>{% endif %}</a></article></li>
	{% endif %}
{% endfor %}
</ul>
