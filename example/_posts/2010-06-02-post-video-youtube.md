---
title: "Post: Video (YouTube)"
categories:
  - Post Formats
tags:
  - Post Formats
last_modified_at: 2018-02-01T12:54:35-05:00
---

This post tests YouTube video embeds.

{% include responsive-embed url="https://www.youtube-nocookie.com/embed/l2Of1-d5E5o?controls=0&amp;" %}

Simply use the `responsive-embed` helper include like so:

```html
{% raw %}{% include responsive-embed url="https://www.youtube.com/watch?v=-PVofD2A9t8" ratio="16:9" %}{% endraw %}
```

Or wrap embeds with a `<div>` element and the appropriate classes:

```html
<!-- 21:9 aspect ratio -->
<div class="responsive-embed responsive-embed-21by9">
  <iframe class="responsive-embed-item" src="..."></iframe>
</div>

<!-- 16:9 aspect ratio -->
<div class="responsive-embed responsive-embed-16by9">
  <iframe class="responsive-embed-item" src="..."></iframe>
</div>

<!-- 4:3 aspect ratio -->
<div class="responsive-embed responsive-embed-4by3">
  <iframe class="responsive-embed-item" src="..."></iframe>
</div>

<!-- 1:1 aspect ratio -->
<div class="responsive-embed responsive-embed-1by1">
  <iframe class="responsive-embed-item" src="..."></iframe>
</div>
```


