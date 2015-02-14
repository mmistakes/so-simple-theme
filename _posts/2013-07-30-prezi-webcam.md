---
layout: post
title: "Prezi webcam controller test"
category: posts
featured_image: /images/prezi.png
description: Control your prezi steps using gestures with your webcam
comments: true
share: true
image:
  social: prezi.png
  social_thumb: 
---



<script src="//code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.3/jquery.mousewheel.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.4/jquery.fancybox.pack.js"></script>

<script src="/js/prezi_player.js"></script>
<script src="/js/webcam.js"></script>
<script>

var step = 0;
var moving = false;

function next() {
    if (!moving) {
        step += 1;
    	if (step >= player.getStepCount()) step = player.getStepCount() - 1;
        player.toStep(step);
        moving = true;
        setTimeout(function() {
           moving = false; 
        }, 400);
    }
    
}

var init = function() {
    $("body").bind("webcamSwipeLeft", next);
    $("body").bind("webcamSwipeRight", next);
    player.on('statusChange', function() {
        if (player.getStatus() == PreziPlayer.STATUS_CONTENT_READY ) {
          window.initializeWebcamSwiper();
          console.log("initialized");   
        }
    });	
}

window.onload = function () {
    var d=document.createElement('div'), p=document.createElement('script'), pp=document.createElement('script'), incl; 
    incl = function() { 
        d.id="prezi_player_ufnrer-swszq"; 
        pp.innerHTML="var player = new PreziPlayer('"+d.id+"', {preziId: 'ufnrer-swszq', width: '640', height: '450'});"; 
        $('#prezi-container').append(d); 
        $('#prezi-container').append(pp); 
    }; 
    if (!window.PreziPlayer){ 
        p.src="http://prezi.github.io/prezi-player/lib/prezi_player.js"; $('#prezi-container').append(p); p.onload = incl; 
    } 
    else { incl(); }
    init();
}
</script>

<p class="pagination-centered">Wait for the prezi to load, allow webcam acces then swipe your hands in front of the webcam to advance the prezi</p>
<div id="prezi-container"></div>