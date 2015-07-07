---
layout: page
title: 
excerpt: 
search_omit: true
image:
  feature: PhotoBlog.png

---

---
<!-- Start of the section post-loop-->
<section class="post-loop container-fluid">
    {% for post in site.posts %}
    <div class="row single-post">
        <div>
            <h1 class="post-title"><a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a></h1>

            <div class="post-details">
                <span>{{ post.date | date: "%b %-d, %Y" }}</span>

            </div>

            <p class="post-excerpt">
                {{post.excerpt | length: 800 }}
            </p>

            <a class="post-button pi-big pi-retro pi-flat" href="{{ post.url }}">More</a>

        </div>
    </div>
    {% endfor %}
</section>
