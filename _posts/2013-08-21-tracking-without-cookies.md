---
layout: post
title: "Tracking without cookies"
featured_image: /images/cookies.jpg
category: posts
description: Tracking users without cookies - yes, it's possible and it's nasty.
keywords:
- user tracking
- tracking
- security
- etag
- if-none-match
---

# Demo
This is an iframe, see the proof of concept original at [aspartame.poc.ochronus.com](http://aspartame.poc.ochronus.com/)  
Refresh the page a few times  
<iframe style="border: 1px dashed black;" border="1" height="35" width="100" scrolling="no" src="http://aspartame.poc.ochronus.com/"></iframe>  
#### Look ma, no cookies!  
If you look at your browser's developer tools (Chrome or FireBug, etc.) you can see that the site aspartame.poc.ochronus.com doesn't set any cookies.
No localstorage, etc. either.



# What?
This tracking method works fine without using any of the usual:  

* Cookies
* Javascript, LocalStorage/SessionStorage/GlobalStorage/whatever
* Flash, Java or other plugins
* Your IP address / user agent string
* Any method used by [Panopticlick](https://panopticlick.eff.org/)

Can you think of any other information that is persistent between browser restarts?  
How about **caching**?

Even if you disable cookies, turn off Javascript off and use a VPN connection, this technique will still be able to track you.

This technique is not new at all. See the relevant [wikipedia entry](http://en.wikipedia.org/wiki/HTTP_ETag#Tracking_using_ETags)
Second: it's a quite nasty tracking method. 

# How?
With ETags. 

<blockquote class="well">
    An ETag or entity tag, is part of HTTP, the protocol for the World Wide Web. It is one of several mechanisms that HTTP provides for web cache validation, and which allows a client to make conditional requests. This allows caches to be more efficient, and saves bandwidth, as a web server does not need to send a full response if the content has not changed. ETags can also be used for optimistic concurrency control,[1] as a way to help prevent simultaneous updates of a resource from overwriting each other.
</blockquote>

<blockquote class="well">   
An ETag is an opaque identifier assigned by a web server to a specific version of a resource found at a URL. If the resource content at that URL ever changes, a new and different ETag is assigned. Used in this manner ETags are similar to fingerprints, and they can be quickly compared to determine if two versions of a resource are the same or not. Comparing ETags only makes sense with respect to one URL—ETags for resources obtained from different URLs may or may not be equal, so no meaning can be inferred from their comparison.
</blockquote>

![ETag](/images/etag.png "ETag")

So basically what happens is: The server sends an _ETag_ HTTP header with the response, containing an arbitrary string (in the normal case a checksum of the resource). Compliant browsers (IE5.5+, Safari, Chrome, Opera, Firefox, etc.) send the _If-None-Match_ HTTP header with subsequent requests containing the same string the ETag header contained. The server could make an intelligent decision to serve the content from cache or say _304 Not Modified_ if the checksum didn't change.

However, this mechanism can be exploited. What if the server uses the ETag/If-None-Match headers as session Ids, for example? We could then implement some basci 'session' store keyed by this Id and use it for tracking. Of course, emptying the browser cache also deletes this Id, as deleting cookies deletes traditional sessions.

I've written a very basic Django app as a proof of concept demo (the one you saw in the iframe at the beginning of the article), see here: [Aspartame on GitHub](https://github.com/ochronus/poc-aspartame/) (Aspartame is a sugar substitute as this technique is a cookie substitute)
{% highlight python %}
from django.http import HttpResponse
from django.utils import simplejson
import uuid

BASEDIR = 'sessions'

def get_session(sid):
    session_data = None
    try:
        session_file = open("{dir}/{fname}".format(dir=BASEDIR, fname=sid), 'r')
        session_data = simplejson.loads(session_file.read())
    except:
        pass

    return session_data

def save_session(sid, session_data):
    session_file = open("{dir}/{fname}".format(dir=BASEDIR, fname=sid), 'w')
    session_file.write(simplejson.dumps(session_data))
    session_file.close()


def home(request):
    etag = None
    if 'HTTP_IF_NONE_MATCH' in request.META:
        etag = request.META['HTTP_IF_NONE_MATCH']
    else:
        etag = uuid.uuid4()

    session_data = get_session(etag)
    if not session_data:
        session_data = {}
        session_data['visits'] = 1
    else:
        session_data['visits'] += 1

    save_session(etag, session_data)
    response = HttpResponse("Visits: {vnum}".format(vnum=session_data['visits']))
    response['ETag'] = etag
    response['Cache-Control'] = 'Cache-Control:private, must-revalidate, proxy-revalidate'
    return response
{% endhighlight %}


# How can we stop this?
Well, you could use an incognito window for each request, or disable caching, but that would make your browsing experience quite painful. Cache tracking is undetectable in most of the cases and caching itself is useful (think about traffic costs on your mobile phone for example) and this is what makes this tracking technique quite hard to fight. 

