---
layout: page
title: Welcome
excerpt: "A simple and clean responsive Jekyll theme for words and photos."
search_omit: true
---

This website is a work in progress but should give you a sense of the work that Kirstie Whitaker and her collaborators are conducting at the Alan Turing Institute.

## Reproducible research

One of the major focuses of the Whitaker Lab is to empower researchers to make their work reproducible from beginning to end.

Reproducible means 

## Contact

You can contact Kirstie at
<script language="JavaScript">
    var username = "[kwhitaker]";
    var hostname = "[turing.ac.uk]";
    var linktext = username + "@" + hostname ;
    document.write("<a href='" + "mail" + "to:" + username + "@" + hostname + "'>" + linktext + "</a>");
</script>
or on twitter [@kirstie_j](https://twitter.com/kirstie_j).

The lab tweets [@Whitaker_Lab](https://twitter.com/Whitaker_Lab). Give us a follow and let us know what you think.

### I am a 3rd level header

This is some text

#### I am a 4th level header

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
