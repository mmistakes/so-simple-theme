
---
layout: post
title: editorial을 이용한 블로깅
excerpt: editorial workflow 사용방법
date: 2017-08-03 23:10:49
tags: editorial, working-copy
categories: blog
image:
  feature: so-simple-sample-image-5.jpg
  credit: WeGraphics
  creditlink: http://wegraphics.net/downloads/free-ultimate-blurred-background-pack/
comments: true
share: true
---

### Editorial 앱에 관하여

[Editorial](http://omz-software.com/editorial/)은 iPhone 혹은 iPad에서 자동화 기능, 소위 워크플로우라고 지칭하는, 을 통해서 타 앱간에 자료를 공유하거나 전달할 수 있는 막강한 기능을 가진 iOS용 문서편집기 중의 하나이다.

특히, [마크다운](https://ko.wikipedia.org/wiki/%EB%A7%88%ED%81%AC%EB%8B%A4%EC%9A%B4) 문법의 지원과 [드롭박스](https://www.dropbox.com/) 와의 싱크 및 [x-callback-url](http://x-callback-url.com/) 을 지원한다.

### Editorial 을 이용한 Jekyll 블로깅

에디토리얼을 사용하는 이유는 단순히 마크다운 문법을 지원하는 iOS 앱들 중 하나이기 때문만은 아닐 것이다.

에디토리얼이 가진 가장 큰 장점은 Workflow라는 독특한 자동화 기능을 가졌기 때문일 것이다. 워크플로우를 이용해서 파이선 코드를 사용한다든지, 아니면 기존에 만들어져 있는 자동화 명령을 통해 나만의 자동화기능을 만들게 되는데, [Drafts 4](http://agiletortoise.com/drafts/) 만큼이나 막강하다 할 수 있다.

하지만, 깃허브에 자료를 업로드 혹은 다운로드 하기 위해서 SSH 서브 기능을 사용하기 위해서는 에디토리얼 만으로는 힘들고, [Github](https://github.com/)를 컨트롤 할 수 있는 iOS용 앱이 별도로 필요하다. 

여기서는 x-callback-url을 지원하면서, 에디토리얼을 개발한 개발자가 만든 [Working Copy](https://workingcopyapp.com/) 앱을 이용하였다.

물론 에디토리얼 뿐만아니라 워킹카피 또한 유료앱이라, 제법 비용이 들어가겠지만, iPad에서의 블로깅의 참맛을 느끼고 나면 정말 아깝지 않을 투자가 될 것이라 확신한다.

### 신세계로 들어가기

이제 본격적으로 에디토리얼을 통한 블로그 작성을 해보도록 하겠다. 마크다운 문법에 따라 블로그를 작성한다. [TextExpander](https://smilesoftware.com/TextExpander)를 지원하기 때문에 편리하게 작성할 수 있다.

특히, yaml 헤더 없이 작성하고, 헤더는 워크플로우를 통해 삽입토록 한다.

### 문서작성

문서작성에는 두가지 경우가 있을 수 있다.

> 첫째는 신규로 작성하는 방법과  
> 둘째는 이미 깃허브에 등록된 파일을 편집하는 방법이다.

#### 새문서작성

지킬 블로그를 작성할 때에는 반드시 두가지 사항에 대하여 준수해야 한다.

첫째, 아래의 예와 같이 블로그 문서내 yaml 헤더를 포함시켜야 한다.

{% highlight yaml %}
- - -
layout:
title:
date:
categories:
tags:
- - -
{% endhighlight %}

둘째, 파일명을 `2017-08-12-how to make a new documents.md` 와 같이 `날짜+파일명.md` 형식으로 만들어야 한다.

하지만 상기의 두가지 준수사항을 자동화 워크플로우를 통해 자동 생성되도록 하겠다.


