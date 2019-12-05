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
    default_offset_pct: 0.6, // How much of the before image is visible when the page loads
  });
});
