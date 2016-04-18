---
layout: post
title: (Reprint)knitr Support in Emacs (via ESS)
modified:
categories: blog
excerpt: (Reprint)knitr Support in Emacs (via ESS) 
tags: [R, Emacs, knitr]
image:
feature:
date: 2013-07-19 Fri 10:21
---

## (Reprint)knitr Support in Emacs (via ESS)

[http://sjp.co.nz/posts/emacs-ess-knitr/](The original blog by Simon)

Note: The latest version of ESS now includes support for knitr. This script is no longer necessary.

During my recent switch from vim to Emacs I discovered what a wonderful tool ESS is. It was fantastic for writing Rnw documents using Sweave, but seeing as I'm currently attempting another switch, from Sweave to knitr, I wanted support for that.

After a quick look at the ESS source code, I was able to write a quick script that gives ESS support for knitr.

### Installation

+ Download the Emacs lisp script below.
+ Store it in a useful location, I stored it in the following path: ~/.emacs.d/ess-knitr/ess-knitr.el.
+ Import the script in your .emacs file. My configuration is the following:

{% highlight lisp %}
;; Add support for knit and purl
(add-to-list 'load-path "~/.emacs.d/ess-knitr/")
(require 'ess-knitr)
{% endhighlight %}

Note: This snippet should be included after the code that loads ESS.

### Usage
+ M-n r "knit" an Rnw document.
+ M-n u "purl" an Rnw document.

### Download
[http://sjp.co.nz/files/ess-knitr.el](*knitr support in ESS*)
