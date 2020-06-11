//// AGENCY - Our Process Toggle ////

//PC Image Slider
//Slider 1
$("label.process-slider1").click (function(){                // Press Slider 1
  $("label.process-slider2").removeClass("process-active");  // remove .process-active from h3 Sliders 2
  $("label.process-slider3").removeClass("process-active");  // remove .process-active from h3 Sliders 3
  $("label.process-slider4").removeClass("process-active");
  $("label.process-slider5").removeClass("process-active");
  $("label.process-slider1").addClass("process-active");     // add .process-active to h3 Slider 1
  $("li.process-slider-text2").addClass("process-text-inactive");
  $("li.process-slider-text3").addClass("process-text-inactive");
  $("li.process-slider-text4").addClass("process-text-inactive");
  $("li.process-slider-text5").addClass("process-text-inactive");
  $("li.process-slider-text1").removeClass("process-text-inactive");
});
// Slider 2
$("label.process-slider2").click (function(){                // Press Slider 2
  $("label.process-slider1").removeClass("process-active");  // remove .process-active from h3 Sliders 1
  $("label.process-slider3").removeClass("process-active");  // remove .process-active from h3 Sliders 3
  $("label.process-slider2").addClass("process-active");     // add .process-active to h3 Slider 2
  $("label.process-slider4").removeClass("process-active");
  $("label.process-slider5").removeClass("process-active");
  $("li.process-slider-text1").addClass("process-text-inactive");
  $("li.process-slider-text3").addClass("process-text-inactive");
  $("li.process-slider-text4").addClass("process-text-inactive");
  $("li.process-slider-text5").addClass("process-text-inactive");
  $("li.process-slider-text2").removeClass("process-text-inactive");
});
// Slider 3
$("label.process-slider3").click (function(){                // Press Slider 3
  $("label.process-slider1").removeClass("process-active");  // remove .process-active from h3 Sliders 1
  $("label.process-slider2").removeClass("process-active");  // remove .process-active from h3 Sliders 2
  $("label.process-slider4").removeClass("process-active");
  $("label.process-slider5").removeClass("process-active");
  $("label.process-slider3").addClass("process-active");     // add .process-active to h3 Slider 3
  $("li.process-slider-text1").addClass("process-text-inactive");
  $("li.process-slider-text2").addClass("process-text-inactive");
  $("li.process-slider-text4").addClass("process-text-inactive");
  $("li.process-slider-text5").addClass("process-text-inactive");
  $("li.process-slider-text3").removeClass("process-text-inactive");
});
// Slider 4
$("label.process-slider4").click (function(){
  $("label.process-slider1").removeClass("process-active");
  $("label.process-slider2").removeClass("process-active");
  $("label.process-slider3").removeClass("process-active");
  $("label.process-slider5").removeClass("process-active");
  $("label.process-slider4").addClass("process-active");
  $("li.process-slider-text1").addClass("process-text-inactive");
  $("li.process-slider-text2").addClass("process-text-inactive");
  $("li.process-slider-text3").addClass("process-text-inactive");
  $("li.process-slider-text5").addClass("process-text-inactive");
  $("li.process-slider-text4").removeClass("process-text-inactive");
});
// Slider 5
$("label.process-slider5").click (function(){
  $("label.process-slider1").removeClass("process-active");
  $("label.process-slider2").removeClass("process-active");
  $("label.process-slider3").removeClass("process-active");
  $("label.process-slider4").removeClass("process-active");
  $("label.process-slider5").addClass("process-active");
  $("li.process-slider-text1").addClass("process-text-inactive");
  $("li.process-slider-text2").addClass("process-text-inactive");
  $("li.process-slider-text3").addClass("process-text-inactive");
  $("li.process-slider-text4").addClass("process-text-inactive");
  $("li.process-slider-text5").removeClass("process-text-inactive");
});

// Mobile Image Slider
$(document).ready(function(){
  var x = 0;
  $('.mobile-nav-next').click(function(){
        x= (x<=300)?(x+100):0;
        $('figure').css('left', -x+'%');
        $('.process-headlines').css('left', -x+'%');
        $('.process-descriptions').css('left', -x+'%');
    });
  $('.mobile-nav-prev').click(function(){
        x= (x>=100)?(x-100):400;
        $('figure').css('left', -x+'%');
        $('.process-headlines').css('left', -x+'%');
        $('.process-descriptions').css('left', -x+'%');
    });
});

// autoplay of videos on hover
/*
window.onload = function() { //executes code after DOM loads
 //--- select all .entry-video on the page
 const vids = document.getElementsByClassName('entry-video')
 // Loop over the selected elements and add event listeners
 for (let i = 0; i < vids.length; i++) {
   vids[i].addEventListener( 'mouseover', function(e) {
     // vids[i].loop = true;
     vids[i].play();
   })
   vids[i].addEventListener( 'mouseout', function(e) {
     vids[i].pause();
   })
 }
}*/
