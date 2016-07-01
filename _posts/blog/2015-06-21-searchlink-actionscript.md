---
layout: post
title: SearchLink
excerpt: 서치링크 기능에 대한 고찰
categories: blog
tags: [betterpstra, SearchLink, Auto]
image:
  feature: so-simple-sample-image-5.jpg
  credit: WeGraphics
  creditlink: http://wegraphics.net/downloads/free-ultimate-blurred-background-pack/
comments: true
share: true
---


블로그를 관리하다보면 가장 많은 손길이 가는게 링크관리라는 것을 누구나 알게 됩니다. 그러한 링크관리를 간단히 하기 위해 마크다운 문법을 도입해서 사용을 하더라도 필요한 웹사이트를 검색하고 복사해서 붙여넣기 하는 일련의 작업들은 블로깅의 가장 큰 독소요소가 아니었나 싶습니다.

오늘 소개할려는 기능은 이러한 링크를 구글, 앱스토어, 아이튠즈, 혹은 브라우저내 히스토리 등 다양한 곳에서 자동으로 링크주소를 가져와서 텍스트상에 표현해 주는 방법입니다.

물론 이러한 기능을 사용하기 위해서는 몇가지 파일과 사용법에 대해서 숙지를 하여야 하지만, 글쓰는 이로 하여금 검색은 물론, 복사 및 붙여넣기까지 필요치 않도록 해주는 너무도 고마운 기능입니다.

그럼 그 고마운 기능속으로 함께 들어가 보시겠습니다. 

### SearchLink

제가 오늘 소개시켜드릴 내용은 [SearchLink](http://brettterpstra.com/projects/searchlink/)에 대한 내용입니다.   
  
> SearchLink는 http://brettterpstra.com/ 에 소개된 내용으로 중요기능으로는 텍스트 상에서 인터넷 검색을 통해 검색어의 링크주소를 자동으로 가져와서 마크다운 문법에 맞도록 표현해 주는 스크립트입니다.
  
몇마디 글보다 사용법에 대한 간략한 아래의 영상을 보면 더욱 이해가 빠를 것입니다.

![](http://brettterpstra.com/uploads/2014/04/searchlink_referencelink@2x.gif)

### 활용법

일반적으로 마크다운에서 링크를 활용하는 방법은 크게 두가지 방법이 있습니다. 직접링크 방법 및 간접링크 방법으로 나눌 수 있는데, 직접링크 방법은 `[링크텍스트](링크url)`형태로 작성되는 방법으로 링크텍스트의 링크주소를 바로 확인가능하지만, 텍스트 링크로 인하여 블로깅이 방해받을 수 있는 단점이 있는 반면 링크텍스트와 링크주소가 한자리에 있으므로 해서 링크주소의 무결성을 보장할 수 있는 장점이 있습니다. 

반면에 간접링크 방법은 [링크텍스트]\[^1\], [^1]: <링크url>의 형태로 각주작업용 블로깅에는 유리하나 링크텍스트와 링크주소가 각주의 형태로 작성이 되므로 인해 사용자 편리성은 조금 떨어지는 단점을 가지고 있습니다.

SearchLink 이용시 두가지 방법으로 모두 작성이 가능합니다만, 직접링크 방법이 간접링크 방법에 비해 훨씬 간편합니다.

### 프로그램 다운로드

SearchLink 는 현재 2.2 버전까지 나와 있으며 [Download SearchLink v2.2.0](http://cdn3.brettterpstra.com/downloads/SearchLink2.2.0.zip)를 통해 무료로 받아서 사용할 수 있으며, 감사의 의미로 [기부](http://brettterpstra.com/donate/?ppid=A9KK2MTU7QSJU&submit=)를 하셔도 괜찮습니다.

### 프로그램 설치

다운받은 프로그램은 시스템 서비스에 등록하여 사용하면 됩니다. 먼저 다운받은 Zip 파일을 압축해제 하면 3개의 파일이 생성됩니다. 이 파일들을 **~/Library/Services** 폴더에 모두 복사합니다. 그러면 별도의 설정없이 검색을 원하는 텍스트를 선택한 후 우측버튼을 클리해서 _Services > SearchLink_를 클릭하시면 바로 사용이 가능합니다.

만약 단축키로 등록을 윈하면 시스템 환경설정 > 키보드 > 단축키 > 서비스 항목 중에서 _SearchLink_를 찾아서 단축키를 등록시켜 주시면 됩니다.   
  
그러면 우측버튼을 눌러 찾는 과정없이 텍스트 입력 후 단축키를 입력하면 바로 프로그램이 실행됩니다. 저의 경우에는 **⌃⌥⇧⌘S**에 등록하여 사용하고 있습니다.

### 프로그램 사용

프로그램의 사용법은 너무도 간단하다. 블로그 작성 텍스트 창에서 검색어를 입력해서 SearchLink를 실행시키면 [검색어]\(검색어 링크\) 의 형태로 변환되어 작성됩니다. 

> 여기서 간과해서는 안되는 중요한 사항이 검색된 링크주소는 구글에서 가장먼저 제공되는 주소라는 점입니다.
>
> Marked => [Marked]\(https://github.com/chjj/marked\)
>
> 만약 **검색어**를 선택 후 SearchLink를 실행시키면 **[검색어]\(검색어 링크\)** 형태로 변환되어 작성이 됩니다.
>
> Back to the Mac => [Back to the Mac]\(http://macnews.tistory.com/\)
>
> [검색어 타이틀]\(검색어\) 형태로 입력하면 [검색어 타이틀]\(검색어 링크\) 로 작성됩니다.
>
> [Marked 2 Application]\(Marked 2\) => [Marked 2 Application]\(http://marked2app.com/\)

가장 기본적인 내용은 상기와 같으며 여기서 찾고자 하는 검색어 작성에 있어서 몇가지 옵션이 있습니다. 

### 검색옵션

#### 1. 소프트웨어 검색 옵션

* __!mas__ : 맥앱스토어 URL 을 검색합니다.  

<div class="notice">!mas Day One => [Day One](https://itunes.apple.com/us/app/day-one/id422304217?mt=12&uo=4&at=10l4tL&ct=searchlink) </div>

* __!masd__ : 맥앱스토어에서 검색 후 해당 판매자의 URL을 제공합니다.

<div class="notice">!masd Day One => [Day One](http://dayoneapp.com/)</div>
 
* __!itu__ : 아이튠즈 앱스토어 URL을 검색합니다.   

<div class="notice">!itu Day One => [Day One](https://itunes.apple.com/us/app/day-one-journal-notes-diary/id421706526?mt=8&uo=4&at=10l4tL&ct=searchlink)</div>
  
* __!itud__ : 아이튠즈 앱스토어에서 검색 후 해당 판매자의 URL을 제공합니다.  

<div class="notice">!itud Facebook => [Facebook](http://www.facebook.com/mobile)</div>
   
* __!s__ : 구글에서 소프트웨어를 검색 후 URL를 제공합니다.  

<div class="notice">!s instapaper => [Instapaper Award-winning iPhone/iPad app for offline reading](https://www.instapaper.com/iphone)</div>
  
참고로 검색결과는 미국 스토어 검색결과이며, 한글검색은 불가합니다.  

#### 2.기본검색   
  
* __!g__ : 구글에서 가장 먼저 나타나는 URL   
  
<div class="notice">!g 백투더맥 => [백투더맥](http://macnews.tistory.com/)</div>
  
* __!b__ : [Bing](https://www.bing.com/)에서 가장 먼저 나타나는 URL

<div class="notice">!b 맥클리앙 => [맥클리앙](http://clien.net/)</div>
  
참고로 구글검색에서 오류발생시 빙 검색도 오류가 발생됩니다.

#### 3. 전문검색   
  
* __!wiki__ : [Wikipedia](https://www.wikipedia.org/) 검색결과 URL 제공

<div class="notice">!wiki 이순신 => [이순신](http://en.wikipedia.org/wiki/%EC%9D%B4%EC%88%9C%EC%8B%A0)</div>
  
* __!def__ : [Dictionary](http://dictionary.reference.com/) 검색결과 URL 제공   

<div class="notice">!def solution => [solution](http://dictionary.reference.com/browse/solution)</div>
  
* !spell : 빙검색을 이용하여 처음 제안되는 단어교정 결과를 되돌림(URL 링크 아님)

<div class="notice">!spell soluton => solution</div>
  
#### 4. 음악검색(미국 아이튠즈 결과 제공)   
* !isong : 아이튠즈 음악 링크   

<div class="notice">!isong Blurred Lines => [Blurred Lines](https://itunes.apple.com/us/album/blurred-lines-feat.-t.i.-pharrell/id667140011?i=667140173&uo=4&at=10l4tL&ct=searchlink)</div>
  
* !iart : 아이튠즈 음악가 링크   

<div class="notice">!iart Michael Jackson => [Michael Jackson](https://itunes.apple.com/us/artist/ron-white/id998791?uo=4&at=10l4tL&ct=searchlink)</div>
  
* !ialb : 아이튠즈 앨범 링크   

<div class="notice">!ialb Billie Jean => [Billie Jean](https://itunes.apple.com/us/album/essential-michael-jackson/id159292399?uo=4&at=10l4tL&ct=searchlink)</div>
  
* !ipod : 아이튠즈 Podcadt 링크   

<div class="notice">!ipod Michael Jackson => [Michael Jackson](https://itunes.apple.com/us/podcast/rthk-michael-jackson-hits/id320476495?mt=2&uo=4&at=10l4tL&ct=searchlink)</div>

이 외에도 몇가지 옵션이 있으나, 국내에서 거의 사용이 불가함으로 제외시켰습니다. 확인하고 싶으신 분들은 [원문](http://brettterpstra.com/projects/searchlink/)을 참고하세요.  
  
#### 5. 아마존   
  
* !a : 모든 카테고리 내에서 아마존 판매물품 검색 링크

<div class="notice">!a iPhone 6 => [iPhone 6](http://www.amazon.com/gp/product/B00NQGP42Y/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=B00NQGP42Y&linkCode=as2&tag=brettterpstra-20)</div>
  
#### 6. 웹페이지 검색   
  
* [사이트명]\(!검색사이트\) : 검색사이트를 검색하여 링크를 대체하면서 동시에 사이트명은 그대로 준수

<div class="notice">[MarkdownEditing](!github.com) => [MarkdownEditing](https://github.com/SublimeText-Markdown/MarkdownEditing)</div>
  
#### 7. 브라우저 히스토리 검색   
  
* !h[s/c]b[s/c]h : 사파리 혹은 구글의 북마크 및 히스토리 내 결과를 검색하여 표현

* !hsb  : 사파리 북마크만 검색토록 함

<div class="notice">!hsb brett terpstra doing</div>
 
* !hcbsh : 크롬의 북마크와 사파리의 히스토리를 검색토록 함.  

<div class="notice">!hcbsh  brett terpstra doing</div>
  
#### 8. 트위터와 ADN 사용자 검색   
  
* !@t : 트위터 사용자 이름 검색후 링크 제공   

<div class="notice">!@t back2themac => [back2themac](https://twitter.com/back2themac)</div>

#### 9. 기타 연산자   
* !! : 검색어 뒤에 붙여서 마크다운 링크 형식이 아닌 URL 형식으로 표현하고잘 할 때 사용함.     

<div class="notice">Marked 2!! => http://marked2app.com/ \n !g Marked 2 => [Marked 2](http://marked2app.com/)</div>
  
위의 ! 와 !! 사용법과 그 결과를 비교해보면 그 결과를 알수 있습니다.  

* ^ : 검색텍스트 마지막에 붙여서 사용하며 검색된 URL을 클립보드에 기억하게 합니다.     

<div class="notice">Marked 2^ => 텍스트 상에서의 변화는 전혀없는 반면 클립보드에 [Marked 2](http://marked2app.com/) 내용이 기억됨.</div>
  
* : : 간접링크 방식의 URL을 표현함( [text]: url )
  
<div class="notice">Marked 2: => [Marked 2]: http://marked2app.com/</div>

### 사용후기

지금껏 블로그를 사용하면서 "꼭 있었으면..." 하고 혼자서 생각하고 있던 기능이었는데 인터넷 검색 중에 발견하고는 큰 감동과 함께 프로그램의 중요성을 다시한번더 실감했습니다. 하지만 만든이의 홈페이지 위주의 검색 기능 등은 사용자가 원하는 내용으로 충분히 수정이 가능할 것으로 판단됩니다.  
  
좀더 개량해서 한국의 앱스토어검색 및 한글사용, 개인 홈페이지 검색 기능등의 추가 등은 남겨진 숙제인 듯 합니다. 하지만 현재의 기능만으로도 충분히 복사, 붙여넣기 작업을 줄여줄 수 있는 유용한 프로그램으로 판단되어 소개해 봅니다.

