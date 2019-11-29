---
title: MNPRX Education - End-User License Agreement
layout: empty
excerpt: "End-User License Agreement of MNPRX Education"
schema:
---

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

<!-- TwentyTwenty -->
<link rel="stylesheet" href="/assets/css/plugins/twentytwenty.css" type="text/css" media="screen" />

<!-- TwentyTwenty -->
<script src="/assets/js/plugins/jquery.event.move.js" type="text/javascript"></script>
<script src="/assets/js/plugins/jquery.twentytwenty.js" type="text/javascript"></script>

<!-- custom js -->
<script type="text/javascript" src="/assets/js/custom.js"></script>

<!-- Font Awesome -->
<script src="https://pro.fontawesome.com/releases/v5.7.2/js/all.js" integrity="sha384-I3Hhe9TkmlsxzooTtbRzdeLbmkFQE9DVzX/19uTZfHk1zn/uWUyk+a+GyrHyseSq" crossorigin="anonymous"></script>


<script>
$(function(){
  $("#container1").twentytwenty({
    before_label: 'Standard Quality',
    after_label: 'TAA Quality',
  });
});

$(function(){
  $("#mnprx-comparison").twentytwenty({
    before_label: 'Viewport Render',
    after_label: 'MNPRX Render',
  });
});
</script>


<div class="upgrade-text" markdown="1">
You are currently using the **non-commercial** version of MNPRX.  
Support us by purchasing the **Indie** or **Studio** version and unlock more features!

<div class="upgrade-background" markdown="1">
Anti-aliasing - improved quality
  <figure>
    <div id="container1" style="margin: 0 auto">
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
Bulk attribute - change multiple attributes in simultaneously  
  <div class="upgrade-img">
    <img src="/images/MNPRX/bulkAttribute.png"/>
  </div>
</div>

</div>
