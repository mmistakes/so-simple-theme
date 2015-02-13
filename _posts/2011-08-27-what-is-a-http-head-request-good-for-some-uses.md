---
layout: post
title: "What Is a HTTP HEAD Request Good for? Some Uses"
description: "Let’s meet HTTP GET's little brother"
permalink: "http-head-request-good-uses"
featured_image: /images/http-request.png
category: posts
---
## Let’s meet HTTP GET ‘s little brother  

According to Wikipedia:

Asks for the response identical to the one that would correspond to a GET request, but without the response body. This is useful for retrieving meta-information written in response headers, without having to transport the entire content.

This means that we have a faster way of checking the headers and some server info for a given resource on the server. So the first trivial way of using a HTTP HEAD request is checking if a given url is serviceable, a given file exists, etc.. This can be used for example for creating a faster link verification service.

Also HEAD returns the full headers, so we can do a LastModified/ContentLength check to decide if we want to re-download a given resource.

There’s another simple use of HEAD: you can log js based content appearances. For example you have an ad service which is js based and you’d like to log the number of appearances. You could naively count the number of downloads in the web server’s access log to that specific js but that has some false positives so you’d better move the ‘I’m shown’ logic to the ad itself. The classic way is counting the number of image accesses or adding a special 1-pixel image, but there’s also a simpler way: just have the js code make a HEAD request to the server. You can then configure the server to log those HEAD requests separately and voila - you have your ad display stats with near zero resource usage (at least in regards of serving content) on your server.

These are just some basic ideas, I feel that HTTP HEAD is unfairly forgotten.