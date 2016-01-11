---
layout: page
title: Blog
excerpt: "An archive of blog posts sorted by date."
search_omit: true
image:
  feature: background_blog.jpg
  credit: CC-BY NOGRAN s.r.o.
  creditlink: https://www.flickr.com/photos/128629824@N06/15604441651

---

<ul class="post-list">
    {% for post in site.categories.blog %}
        <li>
            <article>
                <a href="{{ site.url }}{{ post.url }}">
                    {{ post.title }}
                    <span class="entry-date">
                        <time datetime="{{ post.date | date_to_xmlschema }}">
                            {% assign m = post.date | date: "%-m" %}
                            {{ post.date | date: "%-d" }}.
                            {% case m %}
                                {% when '1' %}Januar
                                {% when '2' %}Februar
                                {% when '3' %}M&auml;rz
                                {% when '4' %}April
                                {% when '5' %}Mai
                                {% when '6' %}Juni
                                {% when '7' %}Juli
                                {% when '8' %}August
                                {% when '9' %}September
                                {% when '10' %}Oktober
                                {% when '11' %}November
                                {% when '12' %}Dezember
                            {% endcase %}
                            {{ post.date | date: "%Y" }}
                        </time>
                    </span>
                    {% if post.excerpt %}
                        <span class="excerpt">{{ post.excerpt }}</span>
                    {% endif %}
                </a>
            </article>
        </li>
    {% endfor %}
</ul>
