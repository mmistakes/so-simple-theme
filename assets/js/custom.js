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


// Comparison Slider

document.addEventListener('DOMContentLoaded', function() {
  var parent = document.querySelector('.aio-compare-splitview'),
      topPanel = parent.querySelector('.aio-compare-top'),
      handle = parent.querySelector('.aio-compare-handle');

  parent.addEventListener('mousemove', function(event) {
    // Move the handle
    handle.style.left = event.clientX + 'px';

    // Adjust the top panel width
    topPanel.style.width = event.clientX + 'px';
  });
});
