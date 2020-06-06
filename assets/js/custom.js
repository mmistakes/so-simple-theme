$(document).ready(function() {
  $('.aio-slick').slick({
    dots: true,
    autoplay: true,
    autoplaySpeed: 4000,
    infinite: true,
    speed: 500,
    fade: true,
    cssEase: 'linear',
    adaptiveHeight: true,
  });
});


//// AGENCY - Our Process Toggle ////


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
// $(document).ready(function(){
//   var x = 0;
    // for next slide
  // $('.mobile-nav-next').click(function(){
  //     x= (x<=300)?(x+100):0;
  //     $('figure').css('left', -x+'%');
  //     $('.process-headlines').css('left', -x+'%');
  // });

     // for prev slide
//   $('.mobile-nav-prev').click(function(){
//     x= (x>=100)?(x-100):400;
//     $('figure').css('left', -x+'%');
//   });
// });

// working
$(document).ready(function(){
  var x = 0;
$('.mobile-nav-next').click(function(){
      x= (x<=300)?(x+100):0;
      $('figure').css('left', -x+'%');
      $('.process-headlines').css('left', -x+'%');
      $('.process-descriptions').css('left', -x+'%');
  });
});





// pricing togglers
var filtMonthly = document.getElementById("filt-monthly"),
    filtQuarterly = document.getElementById("filt-quarterly"),
    filtYearly = document.getElementById("filt-yearly"),
    switcher = document.getElementById("switcher"),
    mSwitch = document.getElementById("state-m"),
    qSwitch = document.getElementById("state-q"),
    ySwitch = document.getElementById("state-y"),
    monthlyTable = document.getElementById("monthly"),
    quarterlyTable = document.getElementById("quarterly"),
    yearlyTable = document.getElementById("yearly");
    mSwitchCaption = document.getElementById("state-m-caption");
    ySwitchCaption = document.getElementById("state-y-caption");


filtMonthly.addEventListener("click", function(){
  mSwitch.checked = true;
  // change text
  filtMonthly.classList.add("toggler--is-active");
  filtQuarterly.classList.remove("toggler--is-active");
  filtYearly.classList.remove("toggler--is-active");
  // change content
  ySwitchCaption.classList.add("transparent");
  mSwitchCaption.classList.remove("transparent");
  monthlyTable.classList.remove("hide");
  quarterlyTable.classList.add("hide");
  yearlyTable.classList.add("hide");
});

filtQuarterly.addEventListener("click", function(){
  qSwitch.checked = true;
  // change text
  filtQuarterly.classList.add("toggler--is-active");
  filtMonthly.classList.remove("toggler--is-active");
  filtYearly.classList.remove("toggler--is-active");
  // change content
  ySwitchCaption.classList.add("transparent");
  mSwitchCaption.classList.add("transparent");
  monthlyTable.classList.add("hide");
  quarterlyTable.classList.remove("hide");
  yearlyTable.classList.add("hide");
});

filtYearly.addEventListener("click", function(){
  ySwitch.checked = true;
  // change text
  filtYearly.classList.add("toggler--is-active");
  filtQuarterly.classList.remove("toggler--is-active");
  filtMonthly.classList.remove("toggler--is-active");
  // change content
  ySwitchCaption.classList.remove("transparent");
  mSwitchCaption.classList.add("transparent");
  monthlyTable.classList.add("hide");
  quarterlyTable.classList.add("hide");
  yearlyTable.classList.remove("hide");
});

mSwitch.addEventListener("click", function(){
  // change text
  filtMonthly.classList.add("toggler--is-active");
  filtQuarterly.classList.remove("toggler--is-active");
  filtYearly.classList.remove("toggler--is-active");
  // change content
  ySwitchCaption.classList.add("transparent");
  mSwitchCaption.classList.remove("transparent");
  monthlyTable.classList.remove("hide");
  quarterlyTable.classList.add("hide");
  yearlyTable.classList.add("hide");
});

qSwitch.addEventListener("click", function(){
  // change text
  filtMonthly.classList.remove("toggler--is-active");
  filtQuarterly.classList.add("toggler--is-active");
  filtYearly.classList.remove("toggler--is-active");
  // change content
  ySwitchCaption.classList.add("transparent");
  mSwitchCaption.classList.add("transparent");
  monthlyTable.classList.add("hide");
  quarterlyTable.classList.remove("hide");
  yearlyTable.classList.add("hide");
});

ySwitch.addEventListener("click", function(){
  // change text
  filtMonthly.classList.remove("toggler--is-active");
  filtQuarterly.classList.remove("toggler--is-active");
  filtYearly.classList.add("toggler--is-active");
  // change content
  ySwitchCaption.classList.remove("transparent");
  mSwitchCaption.classList.add("transparent");
  monthlyTable.classList.add("hide");
  quarterlyTable.classList.add("hide");
  yearlyTable.classList.remove("hide");
});
