---
layout: page
title: "Suche"
date: 
modified:
excerpt:
search_omit: true
sitemap: false
image:
  feature: background_search.jpg
  credit: CC-BY  www.gotcredit.com
  creditlink: https://www.flickr.com/photos/jakerust/16226034713/

---
  
<!-- Search form -->
<form method="get" action="{{ site.url }}/search/" data-search-form class="simple-search">
  <label for="q">Search {{ site.title }} for:</label>
  <input type="search" name="q" id="q" placeholder="Wonach suchst du?" data-search-input id="goog-wm-qt" autofocus />
  <input type="submit" value="Search" id="goog-wm-sb" />
</form>

<!-- Search results placeholder -->
<h6 data-search-found>
  <span data-search-found-count></span> Ergebnisse für &ldquo;<span data-search-found-term></span>&rdquo; gefunden.
</h6>
<ul class="post-list" data-search-results></ul>

<!-- Search result template -->
<script type="text/x-template" id="search-result">
  <li><article>
    <a href="##Url##">##Title## <span class="excerpt">##Excerpt##</span></a>
  </article></li>
</script>
