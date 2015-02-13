---
layout: post
title: "The illusion of private browsing"
description: "You are still being tracked in incognito mode..."
category: articles
tags: [privacy, security]
modified: 2015-01-22
image:
  feature: wire-84483_1280.jpg
comments: true
share: true
---

# Have you tried browsing in incognito mode? Did you feel safe?
![](https://cdn.ochronus.com/images/incognito-mode.png)
Did you read the bold part? Well it's fair enough but there are some details missing from that. 

## Any searches performed while signed into a Google account will be saved as part of the account's web history - even in incognito mode.
Come on, did you really think that a browser backed by a company who's making a living of ads really going to let you off the grid? Well, actually there's a way, you can _temporarily_ [pause recording](https://support.google.com/accounts/answer/465?rd=1).

## If you use Chrome on Windows in incognito mode to stream media files which are then handled by external apps, usually Windows Media Player then their history is stored in Internet Explorer.
It's of course not Chrome's fault yet its a bit troubling. 

## So called 'supercookies' can still track you.
>A security feature of modern web browsers called "HTTP Strict Transport Security" (HSTS) allows a website to indicate that it should always be accessed using a secure connection. If you visit a site that has HSTS enabled, your web browser will remember this flag and ensure the connection is secure any time you visit the website in the future. Subsequent visits to the site without using a secure connection get automatically redirected by the web browser to the secure variant of the web address, beginning https:// . 
This automatic redirecting protects your access to the site from being> intercepted but could also be abused by a malicious site to store a unique number to track your web browser. A number can be encoded as a series of bits (true and false values) and stored by accessing a set of web addresses. Each web address responds with HSTS enabled or disabled depending on the address. Once the number is stored it could be read by other sites in the future. Reading the number just requires testing if requests for the same web addresses are redirected or not.

[demo & more info](http://www.radicalresearch.co.uk/lab/hstssupercookies)

## There's a whole business segment out there to deliver you personalized ads.
[Oh, using Facebook?](https://www.eff.org/deeplinks/2013/04/disconcerting-details-how-facebook-teams-data-brokers-show-you-targeted-ads)  
Google is not much better but at least you can [opt out.](http://lifehacker.com/5171050/opt-out-of-googles-targeted-ads)  
These ads [follow you](http://techcrunch.com/2010/03/25/google-ads-follow/) through the web.

## Fun fact: this data can be requested by authorities
[Yes, really](https://www.google.com/transparencyreport/userdatarequests/)

## Ok, I get it, what can I do?
It's not that easy but there are a few good security measures.  
Installing a trusted extension like [Privacy Badger](https://www.eff.org/privacybadger) might be better for your privacy than incognito mode. 
You can also use an adblocker like [µBlock ](https://github.com/gorhill/uBlock) or [Adblock Plus](https://adblockplus.org/).  
Use a search engine which respects your privacy, like [DuckDuckGo](https://duckduckgo.com/).
If you really care, use a [private VPN](http://lifehacker.com/5935863/five-best-vpn-service-providers) but I'd say this is a bit of overkill. 

In the end it's all about being conscious online. You make your choices about what level of privacy you want, the important thing is to have a clear picture.

![](https://cdn.ochronus.com/images/you-cant-see-me-i-am-a-flower.jpg)