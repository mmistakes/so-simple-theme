---
layout: post
title: Minimal Mistakes Jekyll Theme 에 관하여
excerpt: "Minimal Mistakes Theme에 관한 번역"
categories: blog
tags: [Minimal Mistakes,Jekyll,Jekyll]
image:
  feature: minimal-mistakes-jekyll-theme.jpg
  credit: HoonKim
  creditlink: 
comments: true
share: true
---

* Table of Contents
{:toc}

## Minimal Mistakes 지킬 테마에 대해여

미니멀 미스테이크(이하 '미니멀' 이라함)는 Michael Rose에 의해 개발된 지킬용 테마이다. 일반적으로 테마라고 하면 블로그를 작성할때의 화면구성 방식을 설명할 때 사용하는 용어로서, 단일화면 혹은 복합화면, 사진스크랩화면 등 다양한 화면구성 기법을 통칭하는 용어이다.

Jekyll은 Heroku와 더불어 화면의 구성 및 출력을 간편하게 하는 툴로서 Ruby와 함께 사용되는 인터넷 블로그의 한 종류로 이해하면 편하다.

Minimal Mistakes은 이러한 지킬로 구성된 화면테마중에서 단연 돋보이는 테마로서 현재 [깃허브](http://github.com)내에서 최상의 별점을 받고 있고, 그 외에도 본 홈페이지의 테마이기도 한 so-simple-theme도 그의 작품이다.

어째거나, 2017년에 들어서서 지속적으로 업데이트가 되고 있고, 깃허브내의 Jekyll 테마 중에서 단연 으뜸으로 별점을 많이 받고 있는 테마이다.

본 내용은 https://mmistakes.github.io 의 설치가이드를 위주로 설치하기 쉽도록 편집해서 제시하였다.

## 빠른 설치 방법

Minimal Mistakes은 [Jekyll theme gem](https://jekyllrb.com/docs/themes/) 으로 만들어졌으며, 깃허브와 100%로 호환성을 가지고 있다.

### 테마 설치

설치에는 크게 3가지 정도의 방법이 있다:

>* `Gemfile 과 _config.yml`을 이용하는 방법
>* 깃허브의 `Fork` 를 이용하는방법
>* 마지막으로 직접 테마를 컴퓨터에 복사하는 방법

#### Gemfile & _config.yml 이용법

Jekyll을 이용하여 새로운 사이트를 만들면, 폴더에 내용이 없는 Gemfile과 _config.yml 이 생성된다. 각각의 파일에 다음의 내용을 삽입한다.

`Gemfile`에는 다음을 삽입한다.

{% highlight ruby %}
gem "minimal-mistakes-jekyll"
{% endhighlight %}


`_config.yml`에는 다음을 삽입한다.

{% highlight ruby %}
theme: minimal-mistakes-jekyll
{% endhighlight %}

그리고 설치를 위해 bundler를 실행시킨다.

{% highlight ruby %}
bundle install
{% endhighlight %}

