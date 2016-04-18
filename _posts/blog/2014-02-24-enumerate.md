---
layout: post
title: itemize,enumerate,description 用法【LaTeX 使用】
modified:
categories: blog
excerpt: itemize和enumerate还有description 是LaTeX里列举的三种样式，分别讲一些使用技巧。
tags: [latex, emacs]
image:
feature:
date: 2014-02-24 Mon 23:26
---

## itemize和enumerate还有description 是LaTeX里列举的三种样式，分别讲一些使用技巧。

### itemize（意为分条目）：

{% highlight tex %}
\begin{itemize}
\item[*] a
\item[*] b
\end{itemize}
{% endhighlight %}


这样出来的形式为
  * a
  * b
item的方括号里的内容是为定制前面的符号，可以不要（连同括号），那么前面的符号就是默认的黑点，也可以换为其他的符号，如-，+，等

### enumerate（意为编号）：

{% highlight tex %}
\begin{enumerate}[1)]
\item a
\item b
\end{enumerate}
{% endhighlight %}

这样出来的形式为：

  1） a

  2） b

方括号里的内容是定制前面的编号的形式，可以不加，默认就是简单的数字，也可以换成[step 1],[(i)]等，LaTeX可以自动识别。但是要注意，使用了方括号，必须在前面加\usepackage{enumerate}.

### description（意为描述）：

{% highlight tex %}
\begin{description}
\item[item a] a
\item[item b] b
\end{description}

{% endhighlight %}

出来的形式为：

=item a= a

=item b= b

方括号的词会作为一个描述出现在item的前面。
