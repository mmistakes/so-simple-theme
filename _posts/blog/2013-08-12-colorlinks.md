---
layout: post
title: 解决了LaTeX_CLASS:article 中colorlinks的问题
modified:
categories: blog,  emacs, latex, org-mode
excerpt:
tags: [emacs, latex]
image:
description: 困扰许久的问题终于解决了,解决了LaTeX_CLASS:article 中colorlinks的问题
feature:
date: 2013-08-12 Mon 14:56
---

困扰许久的问题终于解决了。

### 希望orgmode生成tex文件的时候能够更改hyperref的显示形式

所以多方找如何能够自动更改article的，就是找不到如何改模板能自动将：
usepackage{hyperref}变为usepackage[colorlinks=true]{hyperref}，未
得解。

### 解决方案：

后来突然查org-mode的说明：

http://orgmode.org/worg/org-contrib/babel/examples/article-class.html

发现本来就包含#+LaTeX_CLASS_OPTIONS: [colorlinks]这样就能够直接将
这个options加入tex文件中，一切轻而易举的解决了。

这下可以生成tex文件，用xelatex编译包含xeCJK包的tex文件了，中文再
也不是问题。
