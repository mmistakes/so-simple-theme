---
layout: page
title: "Welcome to MAGIC Grants!"
ignore_title: true
excerpt: "MAGIC is a 501(c)(3) public charity focused on financial privacy. Our mission is to build and support the technology infrastructure that will enable people to control their own financial data."
---


MAGIC Grants is a public charity that provides undergraduate scholarships for students interested in cryptocurrencies and supports various critical cryptocurrency public payment infrastructure.



{% include email-cta.html %}

## Undergraduate Scholarships

MAGIC Grants offers undergraduate scholarships to students interested in cryptocurrencies, regardless of pursued degree. Applications typically open in late March and close in mid July. [Click here to learn more](/scholarships/).

## MAGIC Funds and Public Infrastructure

MAGIC Grants supports various cryptocurrency networks, which we believe are essential public payment infrastucture. MAGIC Grants empowers communities to set up MAGIC Funds for various projects deemed essential. These Funds are semi-autonomous and can choose to fund various qualifying activities, including educational materials, essential developer maintenance, research, and security audits.

## Announcements and Updates

<ul class="post-list">
{% for post in site.posts limit:10 %}
  <li><article><a href="{{ site.url }}{{ post.url }}"><div class="post-entry-title">{{ post.title }}</div> <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt | remove: '\[ ... \]' | remove: '\( ... \)' | markdownify | strip_html | strip_newlines | escape_once }}</span>{% endif %}</a></article></li>
{% endfor %}
</ul>
