/*! Plugin options and other jQuery stuff */

// Responsive Nav
var navigation = responsiveNav("#site-nav", { // Selector: The ID of the wrapper
  animate: true, // Boolean: Use CSS3 transitions, true or false
  transition: 400, // Integer: Speed of the transition, in milliseconds
  label: "<i class='icon-reorder'></i> Menu", // String: Label for the navigation toggle
  insert: "before", // String: Insert the toggle before or after the navigation
  customToggle: "", // Selector: Specify the ID of a custom toggle
  openPos: "relative", // String: Position of the opened nav, relative or static
  jsClass: "js", // String: 'JS enabled' class which is added to <html> el
  init: function(){}, // Function: Init callback
  open: function(){}, // Function: Open callback
  close: function(){} // Function: Close callback
});

// FitVids options
$(function() {
	$("article").fitVids();
});

// Simple Jekyll Search options
$(document).ready(function() {
    $('.search-field').simpleJekyllSearch({
        searchResults : '.search-results',
        template : '<li><article><a href="{url}">{title} <span class="entry-date"><time datetime="{date}">{shortdate}</time></span></a></article></li>',
        noResults: '<p>Nothing found.</p>'
      });
});

(function( $, window, undefined ) {
  
   var bs = {
        close: $(".icon-remove-sign"),
        searchform: $(".search-form"),
        canvas: $("body"),
        dothis: $('.dosearch')
    };
  
  bs.dothis.on('click', function() {
    $('.search-wrapper').css({ display: "block" });
    bs.searchform.toggleClass('active');
    bs.searchform.find('input').focus();
    bs.canvas.toggleClass('search-overlay');
  });
  
    bs.close.on('click', function() {
      $('.search-wrapper').removeAttr( 'style' );
      bs.searchform.toggleClass('active');
      bs.canvas.removeClass('search-overlay');
  });
    
})( jQuery, window );