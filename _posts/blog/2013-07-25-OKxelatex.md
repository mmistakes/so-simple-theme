---
layout: post
title: "XeLaTeX第一次设置成功了"
modified:
categories: blog
excerpt: xelatex设置成功了，其实只有一个好处，xeCJK包能够使用了，为的就是写中文tex，其实现在基本不写中文了，一天到晚英文整也挺好。
tags: [emacs, latex]
image:
feature:
date: 2013-07-25 Thu 01:33
---

*终于把Xelatex设置成功了*

瞎倒腾终于把xelatex设置成功了，其实只有一个好处，xeCJK包能够使用了，为的就是写中文tex，其实现在基本不写中文了，一天到晚英文整也挺好。之前用的是latex下的CJK包，这个包有个问题，标题不能写中文，反正我是不会，正文中有中文的话可以用：

{% highlight latex %}
\begin{CJK*}{GBK}{song} 
\end{CJK*}
{% endhighlight %}

来括起来也倒是能够正常实现，不过每次做footnotes都得整一堆这样的代码看着就麻烦，更重要的是我现在完全都是在org mode下写文档，导出成tex时候这样的代码很难正确转化，容易出问题，终归还是得走上xelatex。

着实也是为了orgmode下面回头要是把所有文档导出成pdf的话我不能一句句的去加， 所以装了texlive,差不多能编译了，测试如下：

{% highlight latex %}
\documentclass{article}
\usepackage{xeCJK}
\usepackage{hyperref}
\setCJKmainfont{SimSun}
\title{中文第一篇xelatex}
\author{朱晓瑞}
\begin{document}
\maketitle
\tableofcontents
\section{第一章}
好好写写
\subsection{第一节}
中文
\end{document}

{% endhighlight %}

网上的模板如下：

{% highlight latex %}
\documentclass[11pt,a4paper]{article}
\usepackage{fontspec,xltxtra,xunicode}
\usepackage[slantfont,boldfont]{xeCJK}
\setCJKmainfont[BoldFont=Adobe Heiti Std,ItalicFont=Adobe Kaiti Std]{Adobe Song Std}
\setCJKsansfont{Adobe Heiti Std}
\setCJKmonofont{Adobe Fangsong Std}
\setCJKfamilyfont{song}{Adobe Song Std}
\setCJKfamilyfont{hei}{Adobe Heiti Std}
\setCJKfamilyfont{fangsong}{Adobe Fangsong Std}
\setCJKfamilyfont{kai}{Adobe Kaiti Std}
\title{\LaTeX中文博客模板}
\author{wangl393}
\date{\today}
\begin{document}
\maketitle
{默认效果 宋体}\\
 {\bfseries 粗体效果 设置成黑体}\\
 {\itshape 斜体效果 设置成楷体}\\
 \CJKfamily{kai}  CJKfamily为楷体效果\\
\CJKfamily{fangsong}  CJKfamily为仿宋效果\\
\CJKfamily{hei}  CJKfamily为黑体效果\\
\end{document}

{% endhighlight %}

### 存在问题：
1. xelatex编译总有个错误:** WARNING ** Couldn't open font map file "kanjix.map".仍未解决但是能够编译pdf。
2. emacs中tex模式下latex编译选项被我弄丢了，请问应该如何设置？
3. 接下来就是配置orgmode下面的xelatex导出了，模板设置，还有难看的目录红色边框问题解决之后就不弄了，虽然要利其器，但是重点不在这里。应该熟练的是R和SAS。
