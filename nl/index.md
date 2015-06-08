---
layout: nl-page
title: OpenStreetMap - Dé editeerbaare!
excerpt: "OpenStreetMap - The editable map of the world!"
search_omit: true
---
OpenStreetMap (OSM) is a collaborative project to create a free editable map of the entire world. Our community in Belgium is part of the more than 2 million registered users worldwide.

# What's this community about?

Our community is about collecting data and contributing it to OpenStreetMap. Most of us are called 'mappers'. With OpenStreetMap, mapping isn't just for professionals anymore, everybody can join us! If you're intrested have a look at our community page.

# Why build your own maps?

First of all good maps aren't always available. Even big companies like Google and TomTom get things wrong sometimes. Compare with an encyclopedia that just a few can edit and wikipedia, that has an whole community contributing articles! OpenStreetMap works in much the same way.

Secondly, who decides what to map? The government? Big companies? Navigation software companies? Those maps would be pretty boring, they would just contain either 'official' data, just the roads or whatever is profitable to collect. Our community does so much more and creates a much richer dataset. Just have a look at all the cyclists that use OpenStreetMap.

... and last but not least, we're open. Everybody can download OpenStreetMap data and start experimenting with it. We believe a collaberative mapping project has to be open and publish it's data freely to be successful in the long run. Why would anyone contribute to a project that's just going to keep all your work for themselves?

# Blog

<ul class="post-list">
{% for post in site.categories.blog %} 
	{% if post.categories contains 'nl' %}
		<li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt }}</span>{% endif %}</a></article></li>
	{% endif %}
{% endfor %}
</ul>
