---
title: Community News
layout: maya-gray
excerpt: "MNPRX community news feed"
search: false
sitemap: false
---
<div class="simple-feed">
  <h1> We <i class="fas fa-heart fa-xs"></i> Community </h1>
  {% include flair-feed.html %}
</div>

<!-- Google Analytics -->
<script>
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

// GDPR compliant google analytics
ga('create', '{{ site.google_analytics_flair_community }}', {
  'storage': 'none',
  'anonymizeIp': true,
  'storeGac': false
});
ga('send', 'pageview');
</script>
