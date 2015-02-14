
 if (!is_index_page) {
  $("a.fancybox").fancybox({
      beforeShow : function() {
          var alt = this.element.find('img').attr('alt');
          
          this.inner.find('img').attr('alt', alt);
          
          this.title = alt;
      }
  });

       if (bg_image) {
        $('body').css('padding-top', '0px');
        $('#footer').css('margin-top', '0px').css('background-color', 'white');
        $('#header-cover').css('height', "" + $(window).height()  + "px");
        $('#medium-style-title').css('top', Math.round($(window).height() / 1.7)+ "px");
        $('#header-cover-image').css('background-image', 'url(' + bg_image + ')');
        $(window).scroll(function() {
            var oVal;
            
            if ($(window).scrollTop()  < 50) {
              oVal = 1.0;
              $('#medium-top-nav').css("opacity", 0.5).css('padding-bottom', '0px');
            }
            else if ($(window).scrollTop()  > $('#header-cover').height()  ) {
              oVal = 0;
              $('#medium-top-nav').css("opacity", 1).css('padding-bottom', '15px');;
            }
            else {
              oVal = 1 - $(window).scrollTop()  / $('#header-cover').height();
              $('#medium-top-nav').css("opacity", 0.5).css('padding-bottom', '0px');
            }
            console.log(oVal);
            return $("#header-cover-image").css("opacity", oVal);
        });
      }

 
  var disqus_shortname = 'ochronuscom';
  (function() {
    var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
    dsq.src = 'https://' + disqus_shortname + '.disqus.com/embed.js';
    dsq.async=true;
    dsq.defer=true;
    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
  })();

  function social_event(channel, position) {
    ga('send', 'event', 'social', 'share', channel, position);
  }

  $.scrollDepth({
    elements: ['#disqus_thread', '#related_posts_header'] // Track DOM elements | Default: []
  });
}

