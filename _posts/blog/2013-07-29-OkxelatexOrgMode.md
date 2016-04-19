---
layout: post
title: "Perfect for Org-Mode export to Pdf"
modified:
categories: blog
excerpt: Perfect for Org-Mode export to Pdf
tags: [emacs]
image:
feature:
date: 2013-07-29 Mon 15:47
---

*累啊，倒腾好久终于在要去西藏的第一天搞定了*

之前做了很多很多的修改，orgmode的pdf导出就是搞不定，还还得我把.emacs文件搞坏了一次，没备份真是悲剧，吸取经验教训开始备份emacs文件啦。

其实就是texwill安装之后xelatex就可以用了，因为只有在这个模式下才能用xeCJK包把所有位置的中文都正确显示出来。

导出顺序：
1. 写org文档，头部按照下文所示；
2. 将org文档导出为tex文件；
3. 打开tex文件，用xelatex编译两遍，可能是由于参考文献问题。
4. 不出问题的话应该能正常生成pdf了。

PS： 我的xelatex编译tex文件总有个warning: Couldn't open font mapfile "kanjix.map". 但是不影响。还有个重要问题，.emacs中记得设置prefer coding system为utf-8，好像是由于xelatex不能编译非utf-8文件，也有可能是由于tex文件中的inputenc的函数包中使用了utf-8。不管了。

以下是一个org文件：

{% highlight js %}

#+TITLE: 第一篇直接xelatex编译文章
#+AUTHOR: 朱晓瑞
#+DATE: <2013-07-18 Thu>
#+OPTIONS: H:4 toc:t
#+LaTeX_CLASS: article
#+LATEX_HEADER: \usepackage{xeCJK}
#+LATEX_HEADER: \usepackage{geometry}
#+LATEX_HEADER: \geometry{left=3cm,right=2.5cm,top=2.5cm,bottom=2.5cm}
#+LATEX_HEADER: \setCJKmainfont{SimSun}
#+LATEX_HEADER: \usepackage{indentfirst}
 * 试一试
This is my paper. 中文支持吗？
 ** 再试试
什么都试一下呗
+ 有什么爬山的
+ 不管了
 * 终归成功了
1. 我勒个去
2. 真是不容易啊
| 重点 | 感悟 |
| 第一点 | 注意 |
| 第二点 | 注意   |

\theta*\alpha=\beta 和中文 latex

{% endhighlight %}

* 从上述这个文件C-c C-e调出org控制台之后依次点击"l-l"(这是在org8.0.1下)就可以生成tex文件。如下：

{% highlight latex %}
% Created 2013-07-29 Mon 15:33
\documentclass[11pt]{article}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{fixltx2e}
\usepackage{graphicx}
\usepackage{longtable}
\usepackage{float}
\usepackage{wrapfig}
\usepackage[normalem]{ulem}
\usepackage{textcomp}
\usepackage{marvosym}
\usepackage{wasysym}
\usepackage{latexsym}
\usepackage{amssymb}
\usepackage{amstext}
\usepackage{hyperref}
\tolerance=1000
\usepackage{xeCJK}
\usepackage{geometry}
\geometry{left=3cm,right=2.5cm,top=2.5cm,bottom=2.5cm}
\setCJKmainfont{SimSun}
\usepackage{indentfirst}
\author{朱晓瑞}
\date{2013-07-18}
\title{第一篇直接xelatex编译文章}
\hypersetup{
  pdfkeywords={},
  pdfsubject={},
  pdfcreator={Emacs 24.3.1 (Org mode 8.0.6)}}
\begin{document}

\maketitle
\tableofcontents

\section{试一试}
\label{sec-1}
This is my paper. 中文支持吗？
\subsection{再试试}
\label{sec-1-1}
什么都试一下呗
\begin{itemize}
\item 有什么爬山的
\item 不管了
\end{itemize}

\section{终归成功了}
\label{sec-2}
\begin{enumerate}
\item 我勒个去
\item 真是不容易啊
\end{enumerate}
\begin{center}
\begin{tabular}{ll}
重点 & 感悟\\
第一点 & 注意\\
第二点 & 注意\\
\end{tabular}
\end{center}

$\theta$*$\alpha$=$\beta$ 和中文 \latex
% Emacs 24.3.1 (Org mode 8.0.6)
\end{document}
{% endhighlight %}

* 一切OK，踏踏实实去西藏去了。
