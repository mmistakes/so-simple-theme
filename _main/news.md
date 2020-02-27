---
layout: about-page
title: News
excerpt: Artineering News
image:
  header: images/about/winter.jpg
  caption: Photo of Tallinn by Jaanus Jagomägi
schema: ContactPoint
---
## Press
{: .pull-center .top1}

<div class="entries-{{ page.entries_layout | default: 'list' }}">
  {%- for entry in site.data.press -%}
    {% include entry.html collection='press' %}
  {%- endfor -%}
</div>

---
{: .top2}

<div class="twitter-follow pull-center top2">
<a href="https://twitter.com/artineering?ref_src=twsrc%5Etfw" class="twitter-follow-button" data-size="large" data-lang="en" data-align="right" data-show-count="true">Follow @artineering</a>
</div>

<div class="two-split-news">

<div>
<h2>Highlights</h2>
<a class="twitter-timeline" data-height="800" data-lang="en" href="https://twitter.com/artineering/timelines/1166336484850458626?ref_src=twsrc%5Etfw" data-chrome="nofooter noheader noborders" data-tweet-limit="3"></a>
</div>

<div class="main-twitter">
<h2>Twitter Feed</h2>
<div class="twitter-news">
<a class="twitter-timeline" data-height="800" href="https://twitter.com/{{site.twitter.username}}" data-chrome="nofooter noheader noborders" data-tweet-limit="4">Please allow cookies to display News</a>
</div>
</div>
</div>
