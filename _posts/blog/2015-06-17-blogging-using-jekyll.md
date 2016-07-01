---
layout: post
title: Jekyll & Github
excerpt: Jekyll과 Github를 이용한 블로그 작성방법
categories: blog
tags: [Jekyll, Github, Blog]
image:
  feature: so-simple-sample-image-5.jpg
  credit: WeGraphics
  creditlink: http://wegraphics.net/downloads/free-ultimate-blurred-background-pack/
comments: true
share: true
---


처음 [Jekyll](http://jekyllrb.com/)를 접한건 우연히 어느 블로그지기가 Jekyll를 이용해서 너무 편하게 블로그를 개편했다는 소식을 듣고서 도대체 `Jekyll`가 어떤 서비스이길래 블로그가 쉽고 재미가 있는것일까? 하는 호기심에서 파헤치기 시작했습니다.

다만, Jekyll와 github에 대한 자료는 인터넷상에 많이 있는데 반해, 이 둘의 관계가 어떻게 형성되는건가에 대한 기본적인 의문에 대하여 명쾌하게 해결해 주는 사이트가 없어 여러번의 시행착오를 거쳤는데, 오히려 그런 과정들로 인해 좀더 명확하게 이 둘의 관계를 알수 있었으나, 처음부터 자세히 관계정립을 할 필요가 있을것으로 보입니다.

### Github와 Jekyll는 왜 함께 얘기를 많이 하는가?
사실 이부분이 Jekyll와 [Github](https://github.com/)를 전혀 모르는 사람들에게는 가장 생소한 부분일 것입니다. 

이 둘의 관계를 한다디로 정리하면 다음과 같습니다.

> Jekyll는 자신의 컴퓨터 환경을 블로그 환경으로 만들어 주는 툴인 반면, Github는 인터넷을 통해 보여주는 블로그 환경이다.

사실 Github만으로도 인터넷 상에서 직접 블로그 제작 및 수정 등이 가능합니다만, 편집하고, 확인하고, 이미지를 올리는 등의 다양한 작업을 수행하기에는 다소 불편한 점이 많이 있는게 사실입니다. 아마도 그러한 불편들로 인해 다양한 관리 툴들이 만들어 졌고, Jekyll도 그래서 만들어진 툴이 아닐까 하고 생각해 봅니다. 어째거나, 결론적으로는 인터넷상에 개제하기 전에 미리 내 컴퓨터에서 확인한 후에 만족스러운 결과를 보여주기 위해 Jekyll를 이용한다고 보면 정확할 것입니다.

|:-------:|:-------:|:-------:|
| Jekyll  | <-----> | Github  |
|         |   git   |         |
|=====

아래의 일련의 절차들은 Mac OS X 을 기준으로 설명하겠습니다. 이유는 맥은 기본적을 Ruby를 지원하기 때문에 설치가 무척이나 간편하기 때문입니다. 다음에 윈도우를 이용해서 설치를 하게되면 관련 링크를 첨부토록 하겠습니다.

### Github 등록
1. [Github](https://github.com/)에 등록을 한 후에 Jekyll를 검색어로 검색을 하여 자신의 마음에 드는 사이트를 선택한 후 Fork를 시킵니다. 여기서 Fork는 복사와 같은 개념으로 생각하면 될 것입니다.  
![](/images/sub01/Shot150617-1.jpg)
2. Fork된 사이트의 이름을 자신이 등록한 이름과 동일한 이름으로 바꾸되. 뒤에 github.io를 추가합니다. 제 경우를 예를들면, 등록시 아이디가 maestro4u 이기때문에 Fork한 사이트 이름을 masetro4u.github.io 으로 바꿉니다.  제가 사용하는 테마는 [http://github.com/mmistakes/hpstr-jekyll-theme](http://github.com/mmistakes/hpstr-jekyll-theme)를 Fork하여 사용중입니다.
![](/images/sub01/Shot150617-4.jpg)
3. 인터넷상에서 자신의 블로그를 확인하기 위해 `http://maestro4u.github.io`를 입력하여 복사한 사이트가 개제가 되는지를 확인합니다.
4. 만약 확인이 되면, 자신의 컴퓨터에 동일한 환경을 만들기 위해 [Github for Mac](https://mac.github.com/)앱을 설치합니다. 설치후에 사용자 등록을 마친 상태에서 3항의 github 사이트네 우측사이드바 하단의 `Clone in Desktop` 버튼을 눌러 다운받은 앱과 연동을 시킴으로 자동으로 자신의 컴퓨터에 자료를 다운로드 하게합니다.

> 설치시 고려사항 : 블로그마다 설치를 위한 각종 방법들이 제시됨으로 반드시 설치방법을 확인하고 자신의 컴퓨터 상황등을 고려해서 설치필요.

여기까지 과정으로 인터넷상의 자료를 자신의 컴퓨터로 복사해오는 1단계 작업이 완료된 상태입니다. 2단계 작업은 자신의 컴퓨터를 인터넷 환경과 동일하게 만들어 줌으로써 컴퓨터상에서 블로깅환경이 확인이 될 수 있도록 Jekyll를 설치하는 단계입니다. 

### Jekyll 설치
Jekyll에 관한 자세한 설명은  [Jekyll](http://jekyllrb.com/)에서 확인이 가능한데, 한마디로 요약하면, `Jekyll는 심플하면서도 모바일 적응성이 높은, 웹사이트 혹은 블로그 작성 툴`이라고 대변할 수 있을것 같습니다. 사용메뉴얼은 [Jekyllrb.com](http://jekyllrb.com/) (영문) 혹은 [jekyllrb-ko.github.io](http://jekyllrb-ko.github.io/) (국문) 을 통해 습득을 하게 되면 복사한 사이트의 블로그 작성 원리에 대한 개념이 잡힐 것입니다.

1. Jekyll를 설치하기 위해서 다음의 명령어를 입력합니다.    
~ $ gem install jekyll
2. Github앱을 통해 다운받은 사이트로 이동합니다.  기본값을 적용하였다면, user/Github/ 폴더에 설치되어 있습니다.   
~ $ cd Github
~$ cd maestro4u.github.io
3. 자신의 컴퓨터에 블로그 환경을 활성화 시킵니다.  
~ $ cd jekyll build
4. 컴퓨터에서 변경사항을 웹브라우저에서 실시간으로 확인이 가능하도록 호스팅을 활성화 시킵니다.  
~ $ cd jekyll serve --watch
5. 웹브라우저 검색창에 `http://localhost:4000`를 입력하여 인터넷상에서 복사한 샘플 블로그의 화면이 나타나면 모든것이 성공적으로 이루어진 것입니다.

> 가져오는 블로그 마다 설치방법 및 과정이 다소 다를 수 있으나, 위에 언급한 사항들이 일반적인 과정입니다. 제 경우에는 상기의 3,4번 사항을 설치가이드에서 제공하는 내용에 따라  `bundle exec jekyll build` => `bundle exec jekyll serve`로 수행하였음.

### 편집 및 작성

작성 및 수정은 맥에서 제공하는 에디터 혹은 기타 유용한 에디터([TextWrangler](http://www.barebones.com/products/textwrangler/), [Sublime Text 2](http://www.sublimetext.com/2), [Atom](https://atom.io/), [MacVim](http://www.macupdate.com/app/mac/25988/macvim/download), [Emacs](http://www.gnu.org/software/emacs/) 등)을 이용하시면 됩니다. 개인적으로는 Sublime Text 2가 가장 손에 맞는것 같습니다.

#### 동기화(Sync), 업로드(push), 다운로드(pull)

신규로 작성 혹은 수정된 내용을 Github에 전송하거나, 인터넷에서 작성된 자료를 다시 자신의 컴퓨터로 다운로드 하기 위한 과정들은 모두 세가지 작업으로 이루어 집니다.

Github의 자료를 자신의 컴퓨터로 전송하는 가장 편한 방법은 Github for Mac앱을 이용하여 동기화(Sync) 및 다운로드(Pull)를 수행하는 방법입니다. 이것은 메뉴 혹은 툴바 버튼을 통해 손쉽게 이루어집니다.

다만, 직접 컴퓨터에서 작성된 자료를 Github로 전송하기 위해서는 몇가지 과정을 거쳐야 합니다. 다음은 가장 간편한 일련의 방법입니다.

> ~ $ git status //수정된 자료 상세 내용을 보여줍니다.
> 
> ~ $ git add . //git에 올릴 수정된 파일들을 모두 추가는 명령입니다. 
>
> ~ $ git commit -m "변경내용" // commit은 자신의 컴퓨터 내용을 인터넷상에 올리는 작업입니다. 변경내용에는 본인이 확인 가능하도록 간단히 변경 사유를 작성하면 됩니다.
> 
> ~ $ git push origin master // 인터넷으로 올리는 작업입니다. 엔터후에 Github 사용자명과 패스워드를 물어오는데 각자 등록할 때 사용했던 아이디랑 패스워드를 입력하면 됩니다. 간혹 여기서 오류가 발생할 경우 Github for Mac앱을 이용하여 push 처리를 하셔도 됩니다.

참고로, 상기의 과정들은 Github 에서 신규 보관소(Repository)를 작성할 때 User and Orginization 으로 작성하였을 경우를 예로 들었습니다. 그렇지 않고 Project로 생성하였을 경우에는 master 대신 gh-pages로 변경하시면 됩니다. 이것과 관련한 상세 내용은 [Github Guides](https://guides.github.com/)를 참고하시면 됩니다.

### 결론
큰 내용이 없어 보이지만, 실제 작업하면서 도움말들을 확인하고, 개인적으로 어려움을 헤쳐나가면서 난감해 했던 시간들이 꽤 많이 있었습니다. 물론 아직도 몇가지 개인적으로 해결하지 못한 부분들이 많이 있지만, 결론적으로는 Jekyll와 Github를 이용하여 블로깅을 하는 것이 의외로 편하고, 간편한 방법임을 깨닫고 바로 도메인 등록부터 포워딩까지 지르고야 말았습니다. 

블로그를 작성하면서 가장 편한점은 그냥 [Markdown](http://daringfireball.net/projects/markdown/syntax) 문법으로 작성해서 저장하면 자동적으로 html 문법으로 보여주니깐 작업의 능률이 무척이나 높아지고 편해졌다는 점입니다. 물론 이전에도 Markdown문법을 사용하였지만, 블로깅을 위해 html로 저장하고 수정하는 등 몇가지 귀찮은 작업들을 수행했으며, 특히 이미지 관리를 위해 불필요한 작업들이 너무 많아서 블로깅이 자주 중단되었었는데, 지금은 전혀 그럴필요가 없다는 점이 무척이나 좋습니다.

또한 필요시에는 본문에 직접 html 태그를 이용한 문장을 입력하여도 전혀 문제가 되지 않는다는 점도 Jekyll의 장점으로 여겨 집니다.

### 이글을 쓰면서 사용한 툴

#### 지금껏 타 블로그를 작성하기 위해 사용한 툴
* [MarsEdit](https://itunes.apple.com/us/app/marsedit-blog-editor-for-wordpress/id402376225?mt=12&uo=4&at=10l4tL&ct=searchlink)
* [Byword](https://itunes.apple.com/us/app/byword/id420212497?mt=12&uo=4&at=10l4tL&ct=searchlink)
* [iA Writer](https://itunes.apple.com/us/app/ia-writer/id439623248?mt=12&uo=4&at=10l4tL&ct=searchlink)

#### Github를 이용하면서 사용하기 시작한 툴
* Terminal 혹은 [iTerm](http://iterm.sourceforge.net/) : jekyll, git 사용을 위해
* Byword 혹은 Sublime Text 2 : 에디팅 툴
* Github for Mac