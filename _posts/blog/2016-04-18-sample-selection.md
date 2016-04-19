---
layout: post
title: "The Sample Selection Model"
modified:
categories: blog
excerpt: "Sample selction is also called as incidental truncation. Simply say, it means the sample was not randomly selected from the total population. Some specific sample are neglect when research is collecting samples." 
tags: [statistics]
image:
feature:
date: 2016-04-18 Mon 13:37
comments: true
share: ture
---

##  Sample Selection Definition

Sample selction is also called as incidental truncation. Simply say, it means the sample was not randomly selected from the total population. In other words, some specific subsets of population are neglect when research is collecting samples. For example, in a survey about the relationship between income and education level, researchers may only collected information of people who have income more than poverty line due to convenience or censorship. This kind of truncation made the sample was not randomly drawed from the total population. So the estimation of relationship between independent and denpedent variable may be spurious. 

This kind of limit appears because truncation and censoring. Following paragraphs will explain them in details.

## Truncation 

When truncation happens, it means sample were drawed from a restricted part of the population on which the study focused. A truncated distribution can be treated as part of an untruncated distribution that cover some specified range.

Here is the statistical definition of density of a truncation random variable:

> **THEOREM 22.1**[Green, 2003] Density of a Truncated Random Variable

> If a continuous random variable x has pdf \\(f(x)\\) and a is a constant, then 
> \\[ f(x | x > a) = \frac{f (x)}{Prob(x > a)} \\]
>
> The proof follows from the definition of conditional probability and amounts merely to scaling the density so that it integrates to one over the range above a. Note that the truncated distribution is a conditional distribution.

The density of truncated normal distribution:

\\[ f(x|x>a)= \frac{f(x)}{1− \Phi(\alpha)} = \frac{\frac{1}{\delta} \phi (\frac{x-\mu}{\sigma}) }{1− \Phi(\alpha) \\]

![Smithsonian Image]({{ site.url }}/images/momentoftruncated.png)

The function \\( \lambda(\alpha) \\) is called the **inverse Mills ratio**. 

"Least squares regression using the observed data—for instance, OLS regression of hours on its determinants, using only data for women who are working—produces inconsistent estimates of \\( \beta \\)." (Green, 2003)

######## Continue

## Summary

> Support Vector Machine can be used to ...
>
> -- Jeremy Zhu

*Please contact before you try to reprint. Wechat account: “IamEveryone"*

![Smithsonian Image]({{ site.url }}/images/tips.JPG)

![Smithsonian Image]({{ site.url }}/images/QR.jpeg)
