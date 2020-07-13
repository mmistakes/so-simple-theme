---
title: Advantages of MNPRX Indie/Studio
layout: maya-gray
excerpt: "Advantages of MNPRX Indie/Studio"
search: false
sitemap: false
---
<!-- TwentyTwenty CSS -->
<link rel="stylesheet" href="/assets/css/plugins/twentytwenty.css" type="text/css" media="screen" />

<div class="upgrade-text" markdown="1">
Thank you for using the **non-commercial** version of MNPRX.  
Support us by purchasing an **Indie/Studio** version and unlock more features!

<div class="upgrade-background" markdown="1">
Anti-aliasing - improved quality
  <figure>
    <div id="comparison" style="margin: 0 auto">
       <!-- The before image is first -->
       <img src="/images/MNPRX/comparison/no-AA.png" class="pull-center"/>
       <!-- The after image is last -->
       <img src="/images/MNPRX/comparison/TAA.png" class="pull-center"/>
    </div>
  </figure>
</div>

<i class="fal fa-chevron-double-down fa-2x"></i>

<div class="upgrade-background" markdown="1">
No resolution restrictions  
  <div class="upgrade-img">
    <img src="/images/MNPRX/comparison/resolutions.svg"/>
  </div>
</div>

<i class="fal fa-chevron-double-down fa-2x"></i>

<div class="upgrade-background" markdown="1">
Bulk attribute - change multiple attributes simultaneously  
  <div class="upgrade-img">
    <img src="/images/MNPRX/bulkAttribute.png"/>
  </div>
</div>

</div>

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

<!-- TwentyTwenty -->
<script src="/assets/js/plugins/jquery.event.move.js" type="text/javascript"></script>
<script src="/assets/js/plugins/jquery.twentytwenty.js" type="text/javascript"></script>

<!-- Font Awesome -->
<script src="https://pro.fontawesome.com/releases/v5.7.2/js/all.js" integrity="sha384-I3Hhe9TkmlsxzooTtbRzdeLbmkFQE9DVzX/19uTZfHk1zn/uWUyk+a+GyrHyseSq" crossorigin="anonymous"></script>

<script>
$(function(){
  $("#comparison").twentytwenty({
    move_slider_on_hover: true, // Move slider on mouse hover
    no_overlay: true, //Do not show the overlay with before and after
  });
});

(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

// GDPR compliant google analytics
ga('create', '{{ site.google_analytics_anon_nc }}', {
  'storage': 'none',
  'anonymizeIp': true,
  'storeGac': false
});
ga('send', 'pageview');
</script>
