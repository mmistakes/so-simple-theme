---
layout: post
title: Markdown Rule
excerpt: "Jekyll에서 사용가능한 Markdown 기법"
categories: blog
tags: [markdown,Blog,Jekyll]
image:
  feature: so-simple-sample-image-6.jpg
  credit: WeGraphics
  creditlink: http://wegraphics.net/downloads/free-ultimate-blurred-background-pack/
comments: true
share: true
---

### 왜 마크다운 문법인가?

마크다운 문법은 블로그 작성자들에게는 무척이나 편리한 글쓰기 도구이다. 하지만, 자주 사용하는 사람들에게는 익숙한 문범이 아주 가끔 사용하는 사람들에게는 기억해야하는 또다른 숙제이기도 하다.

특히 지금의 나처럼 1년이 넘도록 마크다운 문법을 접하지 못한 상태에서 갑작스레 마크다운 문법을 사용할려고 하니, 또다른 멘붕상태에 빠지고, 한편으론 지금의 홈페이지 표현 기법을 약간 새롭게 바꿔야 겠다는 욕심에 CSS까지 배워야겠다는 도전정신까지 생겨나게 하는 계륵같은 존재같다.

### Title

Title 에 관한 문법사항이다.

# # Heading 1

## ## Heading 2

### ### Heading 3

#### #### Heading 4

##### ##### Heading 5

###### ###### Heading 6

### Body text

`**This is strong**`
**This is strong**

`*This is italic*`
*This is emphasized*

`<cite>(That’s a citation)</cite>`
<cite>(That’s a citation)</cite>

`<u>Underline</u>`
<u>Underline</u>

`H<sub>2</sub>O`
H<sub>2</sub>O

`m<sup>3</sup>/sec`
m<sup>3</sup>/sec

`도움말 표현: <abbr title="단어에 해당하는 도움말 내용 기입">단어<abbr>`
<abbr title="cascading stylesheets">CSS<abbr>

`![Image name]({{ site.url }}/images/filename.jpg){: .pull-right/center/left}`

#### For Example

![Smithsonian Image]({{ site.url }}/images/3953273590_704e3899d5_m.jpg)
{: .pull-right}

*This is emphasized*. Donec faucibus. Nunc iaculis suscipit dui. 53 = 125. Water is H<sub>2</sub>O. Nam sit amet sem. Aliquam libero nisi, imperdiet at, tincidunt nec, gravida vehicula, nisl. The New York Times <cite>(That’s a citation)</cite>. <u>Underline</u>. Maecenas ornare tortor. Donec sed tellus eget sapien fringilla nonummy. Mauris a ante. Suspendisse quam sem, consequat at, commodo vitae, feugiat in, nunc. Morbi imperdiet augue quis tellus.

HTML and <abbr title="cascading stylesheets">CSS<abbr> are our tools. Mauris a ante. Suspendisse quam sem, consequat at, commodo vitae, feugiat in, nunc. Morbi imperdiet augue quis tellus. Praesent mattis, massa quis luctus fermentum, turpis mi volutpat justo, eu volutpat enim diam eget metus.

### 블록인용(Blockquotes)

> Lorem ipsum dolor sit amet, test link adipiscing elit. Nullam dignissim convallis est. Quisque aliquam.

### 개요 형식

#### 숫자형

1. Item one
   1. sub item one
   2. sub item two
   3. sub item three
2. Item two

#### 불릿형

* Item one
* Item two
* Item three

### 표 작성

| Header1 | Header2 | Header3 |
|:--------|:-------:|--------:|
| cell1   | cell2   | cell3   |
| cell4   | cell5   | cell6   |
|----
| cell1   | cell2   | cell3   |
| cell4   | cell5   | cell6   |
|=====
| Foot1   | Foot2   | Foot3   |
{: .table}

### 코드형식

#### 스타일에 맞춘 코드 형식

{% highlight css %}
#container {
  float: left;
  margin: 0 -240px 0 0;
  width: 100%;
}
{% endhighlight %}

#### 스타일적용이 없는 코드형식

    <div id="awesome">
        <p>This is great isn't it?</p>
    </div>

### Buttons

버튼 클래스 (`.btn` class) 를 이용한 링크설정

`<div markdown="0"><a href="http://mademistakes.com" class="btn">This is a button</a></div>`

<div markdown="0"><a href="http://mademistakes.com" class="btn">This is a button</a></div>

