---
layout: post
title: "User tracking with HTTP Redirect"
featured_image: /images/user_tracking_with_redirect.jpg
category: posts
permalink: "user-tracking-http-redirect"
description: "User tracking using HTTP redirects (301 moved permanently) - no cookies or localstorage needed. Similar to ETag based tracking, a bit less effective though."
keywords:
- user tracking
- tracking
- security
- etag
- if-none-match
---
Ok we're though with [ETag based user tracking](/tracking-without-cookies/), now let's see a slightly less effective but still usable 'invisible' user tracking method, the redirect based one.


First, the obligatory demo:
<iframe width="540" height="80" src="http://aspartame.poc.ochronus.com/redirect/index/"></iframe>

This is an iframe, it's src is http://aspartame.poc.ochronus.com/redirect/index/. As you can see on your developer toolbar/etc. that site does not set any cookie.
  
The trick is simple - browsers tend to cache HTTP 301 redirect codes, even if you restart the browser. But what is an HTTP redirect anyway? Well, it's an HTTP server's way of telling the browser that the document it requested can be found at another address. There are basically two types of redirects - permanent and temporary, HTTP status codes respectively 301 and 302. For this technique we use the 301 moved permanently response.
  
The timeline for a 301 redirect is as follows:
  
1. The browser requests the document, http://funcats.lol/nyaancat.png
2. The server knows that e.g. the document has been renamed to nyaancat-notsofunnyanymore.png, thus says 301 : location: /nyaancat-notsofunnyanymore.png
3. The browser sees the response and now fires up another request to the new location http://funcats.lol/nyaancat-notsofunnyanymore.png
  
This all seems fine and innocent, but browsers cache 301 redirects (as they are meant to be permanent). This caching can be used like this:

1. We embed a remote javascript in the document like <script src="http://trackingserver.wow/trackmeplease.js"></script> . This script is dynamically generated on the malicious tracking server.
2. We set up a rule in the web server config / app to redirect all plain /trackmeplease.js requests to /newly-generated-userid/trackmeplease.js , on which url we serve the javascript but we also generate the userid in it.
3. When the browser requests http://trackingserver.wow/trackmeplease.js for the first time, it gets redirected to e.g. http://trackingserver.wow/813bd2b9-6a5f-4314-b829-7e5dde8aa0ec/trackmeplease.js with 813bd2b9-6a5f-4314-b829-7e5dde8aa0ec being the newly generated userid. After this every request going to http://trackingserver.wow/trackmeplease.js automatically goes to http://trackingserver.wow/813bd2b9-6a5f-4314-b829-7e5dde8aa0ec/trackmeplease.js and this is all handled now in the browser (it cached the redirect target url), so the server gets the same userid it first generated. 
Voilá, just like a sessionid coming from a cookie, with every request. This is what you can see in the iframe above.
  
Some proof of concept Django code (see the whole app at https://github.com/ochronus/poc-aspartame/ , including the example for ETag tracking, too):

{% highlight python %}
def redirect(request, id=None):
    if id is None:
        response = HttpResponsePermanentRedirect("/redirect/{id}/".format(id=uuid.uuid4()))
    else:
        response = render(request, "id_writer.html", {'id': id})

    response['Pragma'] = 'public'
    response['Cache-Control'] = 'max-age=315360000'
    response['Expires'] = "Thu, 24 Aug 2023 11:36:38 GMT"

    return response

def redirect_container(request):
    return render(request, "redirect_tracking.html")
{% endhighlight %}
  
The two templates:
  
{% highlight html %}
<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">

  <title>Redirect user tracking test</title>

</head>

<body>
  Your tracking ID:
  <div id="tracking_info"></div>
  <a href="/redirect/index/">Reload page/frame</a>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script src="/redirect/"></script>
</body>
</html>
{% endhighlight %}
  
The script (it simply puts the tracking id in the div, but in a real app it would send user action logs to the server):
  
{% highlight javascript %}
$('#tracking_info').html("{{ id }}");
{% endhighlight %}

  
I've tested this in IE, Safari, Chrome and Firefox.

A real reload (reload button or force-reload shortcut) usually flushes the cache and so does a browser cache flush - this is why it's a weaker method than ETag based tracking, but for normal operation (in-page link clicking, etc.) this works just fine. This cache is also kept between browser restarts.

Pretty evil, but the real deal comes when you combine user tracking methods, like Evercookie does: [http://samy.pl/evercookie/](http://samy.pl/evercookie/) - though it does not use this redirect technique.

Oh, I almost forgot: it's unethical to track users without letting them know ;)
