---
layout: page
title: Post Archives
permalink: /archives/
description: "An archive of posts."
comments: false
---

{% capture site_years %}{% for post in site.posts %}
  {{ post.date | date: "%Y" }}
{% endfor %}{% endcapture %}

{% assign years_array_duplicates = site_years | split:&nbsp; | sort %}
{% assign years_array = years_array_dup[1] %}

{% for year in years_array_duplicates %}
  {% unless years_array contains year %}
  {% capture years_array %}{{ years_array }}:{{ year }}{% endcapture %}
   {% endunless %}
{% endfor %}

{% assign years = years_array | split: ':' | sort %}

{% for year in years reversed %}{% unless forloop.last %}
<h2 id="{{ year }}">{{ year }}</h2>
<ul class="post-list">
{% for post in site.posts %}
{% assign date = post.date | date: "%Y" | strip_newlines %}
{% if date == year %}
<li><a href="{{ site.url }}{{ post.url }}">{{ post.title }}<span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span></a></li>
{% endif %}{% endfor %}
</ul>

{% endunless %}{% endfor %}
