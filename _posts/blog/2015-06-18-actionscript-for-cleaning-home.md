---
layout: post
title: 바탕화면 정리용 액션스크립트
excerpt: 스크립트를 이용한 바탕화면 정리방법(런치바를 활용)
categories: blog
tags: [Actionscript, Automation, clean]
image:
  feature: so-simple-sample-image-5.jpg
  credit: WeGraphics
  creditlink: http://wegraphics.net/downloads/free-ultimate-blurred-background-pack/
comments: true
share: true
---


지금 자신의 컴퓨터로 개인 오디오방송(screencast)을 컴퓨터로 진행한다고 가정합시다. 대부분은 함께 방송을 함께하는 분들도 자리에 함께 있을 것입니다. 

또는 그런 방송뿐 아니라 자신의 컴퓨터로 프리젠테이션을 한다고 가정합시다.  프로젝터에 컴퓨터를 연결하고 관련자료를 로딩하게 되는데 지저분한 바탕화면이 보여진다고 상상해보십시요.

어쩌면 시작도 하기전에 얼굴을 붉히고, 미리 정리하지 못한 자신을 탓하면서, 좀더 멋진 쇼나 프리젠테이션을 망칠수도 있을 것입니다.

만약 위와 같은 경우가 발생했을경우, 여러분들은 어떻게 하시겠습니까?
바탕화면에 임의의 폴더를 만든 후, 널려있는 각종 자료를 폴더에 그냥 쓸어담을 것입니다. 그리곤 컴퓨터 설정을 통해 바탕화면을 변경하실것 입니다. 그런데, 바탕화면에 Geektool과 같은 화면요소들을 설정했다고 한다면 그 마저도 쉽지 않습니다. 아마도 그럴상황이 발생하면, 대부분은 자신이 나중에 후회할지라도 지금의 상황을 모면하기 위해 Geektool 설정을 지우고 화면을 깨끗이 할 것입니다.

하지만, 만약 이러한 상황들을 간단한 Applescript를 통해 간단히 변경할 수 있다면 여러분들은 어떤걸 선택하시겠습니까?

지금부터 바로 위의 상황과 같은 일련의 작업들을 수행하는 스크립트를 작성해보도록 하겠습니다.

### 일련의 작업과정

작업의 순서는 다음과 같습니다.

1. 바탕화면에 여러가지 파일들이 있는지 확인합니다.
2. 있다면(status = 1) 바탕화면에 있는 파일 혹은 폴더등을 숨깁니다.
3. 바탕화면에 적용된 Geektool 정보를 저장합니다.
4. 독화면을 자동 숨깁니다.(나의 경우 항상 숨기기를 선호함에 따라 항상 적용함)
5. TotalFinder를 실행시킵니다.(개인취향에 따라 선택가능한 옵션임)

이렇게 변경한 내용들을 스크린캐스터나 프리젠테이션이 마치고 나면 복원과정을 거쳐야 하는데 복원과정은 다음과 같습니다.

1. 숨겨진 바탕화면 파일들을 다시 보이도록 합니다.
2. 저장된 Geektool 정보를 다시 불러와서 호출합니다.
3. 독화면은 자동 숨기기 합니다.(나의 선호도임)
4. TotalFinder를 실행시킵니다.(개인취향에 따라 선택가능한 옵션임)

### 코드입력

코드를 설명하기 전에 본 내용은 [Brett Terpstra의 블로그를](http://brettterpstra.com/2012/06/06/desktop-cleanup-scripts-for-screencasting/) 참고하여 작성되었음을 미리 말씀드립니다.

저의 경우에는 LaunchBar를 통한 실행을 주로 하다보니, LaunchBar 액션에 아래의 코드를 삽입하여 처리하였습니다.

{% highlight io linenos %}
-- Script to toggle "screencast mode" (LaunchBar Action compatible)
-- Assumes you normally have your Desktop icons showing
-- and uses that boolean to determine which state to activate

-- Brett Terpstra (http://brettterpstra.com)
-- No license, all yours, modify at will

on run
    set current_state to do shell script "defaults read com.apple.finder CreateDesktop"
	if current_state = "1" then
        tell application "Finder" to set old_wallpaper to POSIX path of (desktop picture as alias)
        do shell script "echo " & old_wallpaper & " > ~/.olddesktop"
        tell application "Finder" to set desktop picture to (POSIX file "/Users/hoonkim/Wallpaper/fun_with_colors_by_vikraj-d5vk6d5-2.png")
        tell application "System Events" to set the autohide of the dock preferences to true
        tell application "GeekTool Helper" to set visible of group "Default Group" to false
        do shell script "defaults write com.apple.finder CreateDesktop 0 && killall \"Finder\""
        delay 5
        tell application "TotalFinderCrashWatcher" to launch
	else
        tell application "System Events" to set the autohide of the dock preferences to true
        tell application "GeekTool Helper" to set visible of group "Default Group" to true
        tell application "GeekTool Helper" to refresh
        set old_wallpaper to do shell script "cat ~/.olddesktop"
        tell application "Finder" to set desktop picture to (POSIX file old_wallpaper)
        do shell script "defaults write com.apple.finder CreateDesktop 1 && killall \"Finder\""
        delay 5
        tell application "TotalFinderCrashWatcher" to launch
	end if
end run
{% endhighlight %}

### 액션 삽입

액션 추가 방법은 LaunchBar를 실행시키고 설정>액션코드편집 을 선택합니다. +버튼을 눌러 사용자 정의 액션을 추가하고,

General 탭의 Action Name과 File Name 에는 Screencast mode, Required Application 에는 com.apple.finder, Text Input Title과 Abbreviation에는 scm 을 입력하고,

Scripts 탭의 Difaul Script 의 종류를 AppleScript로 선택하고 Edit 버튼을 눌러 상기의 코드를 복사하여 붙여넣기 하면 모든것이 완료됩니다.

코드 중간에 이미지 파일명을 입력하는 부분이 있는데 Screencast를 위한 각자의 배경화면 이미지에 맞추어 폴더위치 및 파일이름을 지정해야 한다는점을 잊지말도록 주의바랍니다.

![](/images/sub01/screencast.gif)