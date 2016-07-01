---
layout: post
title: Ruby on Rails를 사용하기
excerpt: Ruby on Rails를 이용한 블로그관리
categories: blog
tags: [Ruby, Rails, Git]
image:
  feature: so-simple-sample-image-5.jpg
  credit: WeGraphics
  creditlink: http://wegraphics.net/downloads/free-ultimate-blurred-background-pack/
comments: true
share: true
---

### [iTerm 2](https://www.iterm2.com/) 설치
맥의 기본 앱인 터미널을 사용해도 되지만 다양한 테마와 몇가지 부가기능들이 갖추어진 iterm 을 이용하기 위해서는 iTerm 2를 설치하여 사용하는것이 유용합니다.

### [Sublime Text 3](http://www.sublimetext.com/3) 설치
서블라임 텍스트 2를 설치할 수 도 있었지만, 추가 프러그인 중 SidebarEnhancements 의 설치가 서블라임 텍스트 3에만 가능하였기에 3을 설치하였습니다.

추가로 설치한 플러그 인은

[Package Control](https://packagecontrol.io/), [Emmet](http://emmet.io/), [SidebarEnhancements](https://github.com/titoBouzout/SideBarEnhancements) 만 우선 설치하였는데 그 외에도 필요시 추가 설치예정입니다.

#### Terminal 과 서블라임 연결

참고로, Terminal 과 서블라임을 연결하기 위해서는 다음의 명령어를 입력합니다.

* Sublime Text 2 일 경우

<div class="notice">
ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
</div>

* Sublime Text 3 일 경우

<div class="notice">
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
</div>

ln 명령어는 바로가기 아이콘을 만드는 명령어로서 Contents/SharedSupport/bin 폴더의 subl 파일의 바로가기 아이콘을 usr/local/bin 폴더에 subl 이라는 이름으로 만들라는 내용입니다.

하지만 간혹 대상 폴더(usr/local/bin)가 없을 경우 바로가기 아이콘의 생성이 불가능할 경우가 있습니다. 이럴경우에는 직접 폴더를 생성해주면 상기의 명령어가 작동하게 됩니다. 직접 수동으로 폴더를 만들기 위해서는 자신의 맥컴퓨터 최상위 디렉토리에서 숨겨진 파일 보기 명령을 실행한 후 `.usr` 폴더내에 local 폴더와 그 하위에 bin 폴더를 생성시키면 됩니다. 

그렇지않고 엔터를 쳤는데, 아무런 메세지도 나오지 않는다면 바로가기 아이콘이 잘 만들어 졌음을 의미합니다.

그런다음 터미널에서 `subl .` 명령어를 입력하고 엔터를 쳤을때 서블라임 텍스트가 자동으로 실행되면 서블라임의 설정이 마무리 되었습니다.

#### 서블라임 텍스트 추가 플러그 인 설치

서블라임 텍스트는 에디터이면서 인터프리터 기능까지 갖추고 있어 파이썬과 같은 언어는 바로 실행이 가능한 프로그래머 들에게는 상당히 유용한 프로그램입니다. 

특히 유용한 플러그 인을 설치함으로써 Vi 에디터 혹은 Emac 에디터로서의 역할도 수행할 수 있어 그 확장성이 상당히 뛰어나다고 말할 수 있습니다. 

이미 위에서 언급했듯이 플러그인을 설치하기 위한 유용한 플러그인이 [Package Control](https://packagecontrol.io/)입니다. 

* Sublime Text 3의 경우

<div class="notice">
import urllib.request,os,hashlib; h = 'eb2297e1a458f27d836c04bb0cbaf282' + 'd0e7a3098092775ccb37ca9d6b2e4b7d'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
</div>

* Sublime Text 2의 경우

<div class="notice">
import urllib2,os,hashlib; h = 'eb2297e1a458f27d836c04bb0cbaf282' + 'd0e7a3098092775ccb37ca9d6b2e4b7d'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); os.makedirs( ipp ) if not os.path.exists(ipp) else None; urllib2.install_opener( urllib2.build_opener( urllib2.ProxyHandler()) ); by = urllib2.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); open( os.path.join( ipp, pf), 'wb' ).write(by) if dh == h else None; print('Error validating download (got %s instead of %s), please try manual install' % (dh, h) if dh != h else 'Please restart Sublime Text to finish installation')
</div>

상기의 명령어를 서블라임텍스트상에서 명령어 입력 단축키(^+`)를 이용하여 붙여넣은 후 엔터를 입력하면 설치가 이루어집니다.

일단 설치가 이루어진 후에는 패키지 설치를 위한 단축키(Command+Shift+p)를 입력하여 간단히 install을 입력한 후 `Install Package` 찾아서 엔터를 친 후에 Emmet 혹은 기타 자신이 설치하고자 하는 패키지를 설치하면 됩니다.

설치와 관련해서는 인터넷상에 올라온 관련자료를 참고하셔도 좋을듯 합니다.

### Homebrew 설치
Ruby 최신버전을 설치하기 위해 Homebrew 를 먼저 설치하였습니다.

<div class="notice">
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
</div>

### Ruby 설치

`$ Ruby -v` 명령을 통해 현재 설치되어 있는 버전을 확인합니다.

저의 경우에는 ruby 2.0.0 으로 나타나서 최신버전을 설치하기 위해 

<div class="notice">
brew install ruby
</div>
 
로 설치하였습니다.

### Rails 설치

`$ Rails --version ` 명령으로 확인결과 현재 rails가 설치되어 있지 않은 관계로 

<div class="notice">
$ sudo gem install rails
</div>

명령으로 rails 설치를 시도하였습니다. 하지만 설치도중 에러발생과 함께 설치가 중단되었는데 확인 결과 터미널 상에서 `xcode-sleect --install` 명령을 우선 실행해야 했습니다. 이 명령은 xcode 에 추가 플러그인을 설치하는 명령으로서 실행과 동시에 자동으로 xcode에 추가 플러그인이 설치됩니다. 

설치후에 다시 상기 명령 `sudo gem install rails`을 실행합니다.

추가 설치까지 꽤 많은 시간이 경과한 후에야 비로소 rails 설치가 마무리 됩니다.

### Git 설치

[여기](http://git-scm.com/download/mac)에서 인스톨러를 내려받아 설치할 수 있습니다.(Mac 의 경우에 한하여)

설치가 마무리 되면 Github에 SSH키를 추가함으로써 반복적으로 github로의 파일 전송시 요구되는 이름과 비밀번호 입력을 피할 수 있습니다. 그렇진 않으면 `$ git push` 명령시 이름과 패스워드를 반복적으로 입력해야 하는데 여간 귀찮은게 아닙니다.

SSH키 추가는  [SSH키 생상 도움말 github 사이트](https://help.github.com/articles/generating-ssh-keys/)를 방문하여 절차에 따라 진행하면 됩니다. 혹시 번역본을 보실 분들은 여기 에서 확인하시면 됩니다.

### 수고하셨습니다.
지금껏 Ruby on Rails를 사용하기 위해 필요한 프로그램 설치방법과 Github와의 SSH키 설치방법까지를 확인하였습니다. 

