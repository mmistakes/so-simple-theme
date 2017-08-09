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

Editorial 을 이용하여 Jekyll 블로깅을 하기위해서는 [Github](https://github.com/)를 컨트롤 할 수 있는 iOS용 앱이 필요하다. 나는 x-callback-url을 지원하면서 안정적인 깃허브 컨트롤이 가능한 [Working Copy](https://workingcopyapp.com/) 앱을 사용한다.

#### 1. Editorial 을 이용한 블로깅

마크다운 문법에 따라 블로그를 작성한다. [TextExpander](https://smilesoftware.com/TextExpander)를 지원하기 때문에 편리하게 작성할 수 있다.

특히, yaml 헤더 없이 작성하고, 헤더는 워크플로우를 통해 삽입토록 한다.

#### 2. 문서작성

문서는 yaml 헤더를 포함하여 작성하는데, 주로 TextExpander를 이용해서 작성하나, Editorial로 새로운 문서를 만들때 미리 자동화를 통해 yaml 헤더스타일 문서머릿말에 출력되게끔 해서 문서를 작성하는 방법이다. 관련 자료는 [여기(New Jekyll Post)](http://www.editorial-workflows.com/workflow/5264186862993408/5qWVz-Y24kA)를 참고한다,

아니면, 현재 내가 늘 사용하듯이 헤더를 자동화 시키는 방법이다. 