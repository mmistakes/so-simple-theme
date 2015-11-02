---
layout: post
title: Odd ways to zeroing some x86_64 registers
date: '2014-08-15T12:20:00.000-03:00'
categories: blog
excerpt: ""
tags: [shellcode, code, assembly, hacking, reverse engineering, english]
share: true
modified: '2014-08-15T12:21:07.015-03:00'
blogger_id: tag:blogger.com,1999:blog-2541885528459487831.post-5615588454119461090
blogger_orig_url: http://www.hackingbits.com/2014/08/odd-ways-to-zeroing-some-x8664-registers.html
---
Hi there! Here are some ways (retrocompatible instructions [[1-2]](#links) and xmm) to
fill registers with zero (NULL) bytes without have any zero bytes in bytecode.

<!--more-->

Zeroing (1) %RAX at 5 bytes cost (very known indeed).

{% highlight console %}
400091:    6a 01                    pushq  $0x1
400093:    58                       pop    %rax
400094:    ff c8                    dec    %eax
{% endhighlight %}

Zeroing (1) %RDI at 6 bytes cost.

{% highlight console %}
40008b:    97                       xchg   %eax,%edi
40008c:    48 c1 c8 20              ror    $0x20,%rax
400090:    97                       xchg   %eax,%edi
{% endhighlight %}

Zeroing (1) %RDX at 3 bytes cost.

{% highlight console %}
40008b:    92                       xchg   %eax,%edx
40008c:    48 99                    cqto
{% endhighlight %}

Zeroing (2) %RDX e %RAX at 5 bytes cost.

{% highlight console %}
40008b:    92                       xchg   %eax,%edx
40008c:    48 99                    cqto
40008e:    52                       push   %rdx
40008f:    58                       pop    %rax
{% endhighlight %}

Zeroing (3) %RAX, %RDX e %RDI at 6 bytes cost (however, widely known).

{% highlight console %}
40008b:    48 31 ff                 xor    %rdi,%rdi
40008e:    48 f7 e7                 mul    %rdi
{% endhighlight %}

Zeroing (3) %RAX, %RDX e %RDI at 9 bytes cost.

{% highlight console %}
40008b:    97                       xchg   %eax,%edi
40008c:    48 c1 c8 20              ror    $0x20,%rax
400090:    f7 e7                    mul    %edi
400092:    50                       push   %rax
400093:    5f                       pop    %rdi
{% endhighlight %}

Zeroing (1) general-purpose reg %RDX and (all) YMM at 8 bytes cost.

{% highlight console %}
400090:    c5 fc 77                 vzeroall
400093:    66 48 0f 7e c2           movq   %xmm0,%rdx
{% endhighlight %}

Zeroing (1) general-purpose reg %RDX and (1) %XMM0 at 9 bytes cost.

{% highlight console %}
400090:    66 0f df c0              pandn  %xmm0,%xmm0
400094:    66 48 0f 7e c2           movq   %xmm0,%rdx
{% endhighlight %}

Zeroing (1) %RAX at 8 bytes cost.

{% highlight console %}
400090:    50                       push   %rax
400091:    5a                       pop    %rdx
400092:    48 f7 d2                 not    %rdx
400095:    48 21 d0                 and    %rdx,%rax
{% endhighlight %}

Zeroing (1) %RDX at 6 bytes cost.

{% highlight console %}
400097:    52                       push   %rdx
400098:    58                       pop    %rax
400099:    f7 d0                    not    %eax
40009b:    21 c2                    and    %eax,%edx
{% endhighlight %}

Use them at will.

## Links {#links}

[1] - [How NOP nearly became a non-NOP on AMD64](http://www.pagetable.com/?p=6)<br>
[2] - [x86oddities](https://code.google.com/p/corkami/wiki/x86oddities#nop)
