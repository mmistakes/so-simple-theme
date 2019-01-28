---
layout: post
title: Facebook enforces HTTPS - developer's thoughts
excerpt: "\"We've enforced HTTPS for all new API applications. Why? Just because we can.\" &copy; Facebook"
last_modified_at: 2019-01-28 23:00:18
categories: blog
tags: [facebook, https, development]
image:
  feature: facebook-https.png
---

> This blog post is a cry from the heart. I don't know why, but there are more and more people who don't even try to think before doing anything.

Sometime ago Facebook introduced new requirements for API applications. They want you to use only HTTPS as a transfer protocol to protect sensitive data from in-secure trasfer. I'm happy about it, but as usual they half-assed it.

Most of applications I have developed are deployed to AWS or almost the same providers and use next infrastructure schema:

[![Application Infrastructure](/images/application-architecture.png)](/images/application-architecture.png)

So, I handle secured connection with Load Balancer and the application doesn't even know about existing of https connection. It just works.  
But locally developers don't have Load Balancer and it's okay to communicate with the application by HTTP protocol locally.

Facebook enforces HTTPS for applications and doesn't allow to turn it off even if the application isn't published for users. Okay, there is another option: Facebook gives ability to make some kind of 'test' version of existing application with different API keys and secrets. But even in test application you still enforced to use HTTPS. So you can't check Facebook login without HTTPS enabled. What the heck are you Facebook doing?

I know that I can make self-signed certificate or use free certificate by [Let's Encrypt](https://letsencrypt.org/) but why should I mess with it if I can resolve it on infrastructure layer? With this enforcement developers need to "implement" local "secured" environment. Seriously?

<h3 style="text-align:center">🔥 Facebook burn in Hell! 🔥</h3>

**UPD January 24, 2019:** It is possible to use HTTP protocol for applications in development mode, but only with `localhost` domain.
