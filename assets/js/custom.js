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

$(function(){
  $("#container1").twentytwenty({
    //move_slider_on_hover: true, // Move slider on mouse hover?
    before_label: 'Standard Quality', // Set a custom before label
    after_label: 'TAA Quality', // Set a custom after label
  });
});

$(function(){
  $("#mnprx-comparison").twentytwenty({
    move_slider_on_hover: true, // Move slider on mouse hover
    no_overlay: true, //Do not show the overlay with before and after
  });
});


// pricing togglers
var e = document.getElementById("filt-monthly"),
    d = document.getElementById("filt-yearly"),
    t = document.getElementById("switcher"),
    m = document.getElementById("monthly"),
    y = document.getElementById("yearly");


e.addEventListener("click", function(){
  t.checked = false;
  e.classList.add("toggler--is-active");
  d.classList.remove("toggler--is-active");
  m.classList.remove("hide");
  y.classList.add("hide");
});

d.addEventListener("click", function(){
  t.checked = true;
  d.classList.add("toggler--is-active");
  e.classList.remove("toggler--is-active");
  m.classList.add("hide");
  y.classList.remove("hide");
});

t.addEventListener("click", function(){
  d.classList.toggle("toggler--is-active");
  e.classList.toggle("toggler--is-active");
  m.classList.toggle("hide");
  y.classList.toggle("hide");
})
