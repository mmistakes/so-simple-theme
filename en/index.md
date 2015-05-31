---
layout: en-page
title: OpenStreetMap - The free editable map of the whole world!
excerpt: "OpenStreetMap - The free editable map of the whole world!"
search_omit: true
---
OpenStreetMap (OSM) is a collaborative project to create a free editable map of the entire world. Our community in Belgium is part of the more than 2 million registered users worldwide.

# What's this community about?

Our community is about collecting data and contributing it to OpenStreetMap. Most of us are called 'mappers'. With OpenStreetMap, mapping isn't just for professionals anymore, everybody can join us! If you're intrested have a look at our community page.

# Why build your own maps?

**Community**

Good maps aren't always available. Even big companies like Google get things wrong sometimes. [Compare](http://tools.geofabrik.de/mc/#15/51.0894/4.3809&num=2&mt0=mapnik&mt1=google-map) with an encyclopedia that just a few can edit and wikipedia, that has an whole community contributing articles! OpenStreetMap works in much the same way.

**What to map?**

Who decides what to map? The government? Big companies? Navigation software companies? Those maps would be pretty boring, they would just contain either 'official' data, just the roads or whatever is profitable to collect. Our community does so much more and creates a much richer dataset. Just have a look at all the cyclists that use OpenStreetMap.

**Open!**

... and last but not least, we're open. Everybody can download OpenStreetMap data and start experimenting with it. We believe a collaberative mapping project has to be open and publish it's data freely to be successful in the long run. Why would anyone contribute to a project that's just going to keep all your work for themselves?

# Blog

<ul class="post-list">
{% for post in site.categories.blog %} 
	{% if post.categories contains 'en' %}
		<li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt }}</span>{% endif %}</a></article></li>
	{% endif %}
{% endfor %}
</ul>
