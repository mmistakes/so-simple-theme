---
layout: post
title: "Facebook enforces HTTPS - developer thoughts"
excerpt: "\"We've enforced HTTPS for all new API applications. Why? Just because we can.\" &copy; Facebook"
categories: blog
tags: [facebook, https, development]
image:
  feature: facebook-https.png
---

> This blog post is a cry from the heart. I don't know why, but there are more and more people who don't event try to think before doing anything.

Sometime ago Facebook introduced new requirements for API applications. They wants you to use only HTTPS as a transfer protocol to protect sensitive data from in-secure trasfer. I'm happy with it, but as usual they did it through the ass.

Most of applications I have developed are deployed to AWS or almost the same providers and uses next infrastructure schema:

![Application Infrastructure](/images/application-infrastructure.svg)

So, I handle secured connection via Load Balancer and the application don't even knows about existing of https connetion. It just works.

But locally developers don't has LB and it's okay to communicate with the application by HTTP protocol locally (while developing it).

Facebook enforces HTTPS for applications and don't allows to turn it off even if the application not published for users. Okay, likely you won't unpublish your application while implementing new features of Facebook integration. Another option is development applications: Facebook gives a feature to make some kind of 'development' version of existing application with different API keys and secrets. But even in DEVELOPMENT application you still can't disable HTTPS. So you can't check Facebook login without HTTPS enabled even locally and in development mode. What the heck Facebook you're doing?

I know that I can make self-signed certificate or use free certificate by [Let's Encrypt](https://letsencrypt.org/) but why I should mess with it if I can resolve it on infrastructure layer? With this enforcement developers needs to "implement" local "secured" environment. Seriously?

🔥 Facebook burn in Hell! 🔥
