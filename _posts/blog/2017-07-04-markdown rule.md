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

`# Heading 1` --> # Heading 1

`## Heading 2` --> ## Heading 2

`### Heading 3` --> ### Heading 3

`#### Heading 4` --> #### Heading 4

`##### Heading 5` --> ##### Heading 5

`###### Heading 6` --> ###### Heading 6

# Heading 1 # <-- `# Heading 1`

## Heading 2 ## <-- `## Heading 2`

### Heading 3 ### <-- `### Heading 3`

#### Heading 4 #### <-- `#### Heading 4`

##### Heading 5 ##### <-- `###### Heading 5`

###### Heading 6 ###### <-- `######## Heading 6`

### Body text

Bold:  `** XX **` --> **This is strong**
Italic: `* XX *`

![Smithsonian Image]({{ site.url }}/images/3953273590_704e3899d5_m.jpg)
{: .pull-right}

*This is emphasized*. Donec faucibus. Nunc iaculis suscipit dui. 53 = 125. Water is H<sub>2</sub>O. Nam sit amet sem. Aliquam libero nisi, imperdiet at, tincidunt nec, gravida vehicula, nisl. The New York Times <cite>(That’s a citation)</cite>. <u>Underline</u>. Maecenas ornare tortor. Donec sed tellus eget sapien fringilla nonummy. Mauris a ante. Suspendisse quam sem, consequat at, commodo vitae, feugiat in, nunc. Morbi imperdiet augue quis tellus.

HTML and <abbr title="cascading stylesheets">CSS<abbr> are our tools. Mauris a ante. Suspendisse quam sem, consequat at, commodo vitae, feugiat in, nunc. Morbi imperdiet augue quis tellus. Praesent mattis, massa quis luctus fermentum, turpis mi volutpat justo, eu volutpat enim diam eget metus.

### Blockquotes

> Lorem ipsum dolor sit amet, test link adipiscing elit. Nullam dignissim convallis est. Quisque aliquam.

### List Types

#### Ordered Lists

1. Item one
   1. sub item one
   2. sub item two
   3. sub item three
2. Item two

#### Unordered Lists

* Item one
* Item two
* Item three

### Tables

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

### Code Snippets

Syntax highlighting via Pygments and Rouge

{% highlight css %}
#container {
  float: left;
  margin: 0 -240px 0 0;
  width: 100%;
}
{% endhighlight %}

Non Pygments/Rouge code example

    <div id="awesome">
        <p>This is great isn't it?</p>
    </div>

### Buttons

Make any link standout more when applying the `.btn` class.

<div markdown="0"><a href="http://mademistakes.com" class="btn">This is a button</a></div>

