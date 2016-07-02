---
layout: post
title: Draft App Action
excerpt: "Draft 엡을 이용한 자동화방법"
categories: blog
tags: [Draft,Action,Automation]
image:
  feature: so-simple-sample-image-5.jpg
  credit: WeGraphics
  creditlink: http://wegraphics.net/downloads/free-ultimate-blurred-background-pack/
comments: true
share: true
---


### 시작하기에 앞서

iOS와 연계한 Mac의 자동화 혹은 개별 앱들의 자동화에 대해 얘기를 하기 위해서는 URL 제어, 소위 URL Schemes, 에 대한 얘기를 하지 않고서는 자동화에 대한 논의가 무의미합니다. 최근에 Mac/iOS 자동화에 대해 얘기하게 되면 늘 언급되는 앱 혹은 웹서비스 등을 보자면 iOS용의 [Drafts](http://agiletortoise.com/drafts/), [Editorial](http://es.thefreedictionary.com/editorial), [Launch Center Pro](http://contrast.co/launch-center-pro/) 와 Mac용의 [Alfred 2](https://www.alfredapp.com/), Hazel, [TextExpander](https://smilesoftware.com/TextExpander), [Keyboard Maestro](https://www.keyboardmaestro.com/main/) 및 웹서비스인 [IFTTT](https://ifttt.com/) 등이 자동화의 중심에 서있는 앱들입니다. Mac/iOS를 사용하면서 한번쯤은 들어보았던지, 아니면 몇몇 앱들에는 광팬들도 많이 있을거라 생각합니다. 

얼마전 블로그에서도 아이폰으로 맥을 원격조정하는 방법에 대해 3회에 걸쳐 기술한 적이 있는데, 자동화를 생각할 때 가장 중요한 것은 뭐니뭐니해도 다른 앱과의 상호 소통방식이라 할 수 있을 것입니다.

소통을 위해 현재 가장 많이 사용되는 일반적인 방법이 -앞으로 몇회가 될지 모르겠지만- URL을 통한 소통방식입니다.(이하 URL Schemes 로 명명하겠습니다. 솔직히 한글로 옮기기에 적당한 어휘가 떠오르지 않습니다.) URL Schemes은 웹에서 익숙했던 용어인데 앞으로 앱간의 소통을 위해서도 사용될 것이며, 더 나아가서는 소통을 확장시키고 타 앱의 호출을 원할히 하기 위해 추가적으로 x-callback-url 도 함께 사용할 예정입니다.

미국에서는 꽤 오래전부터 이러한 노력들이 이루어진 반면, 상대적으로 Mac의 보급이 늦은 우리나라의 경우에는 아직은 걸음마 단계인것 같습니다. 앞으로는 더욱 많은 개발자들에 의해 AppleScript를 이용한 자동화 툴들도 많이 나왔으면 하는 바램입니다. 잠깐 글이 옆으로 흘렀는데, 다시 돌아와서 이 글에서는 몇회에 걸쳐 이러한 프로토콜 사용 방법을 설명하기 위해 Drafts 라는 iOS용 앱을 가지고 설명을 하면서, 그외 각종 팁과 추가적인 접근 방법들에 대해서도 원문에 근거하여 설명하도록 하겠습니다.  [원문보기](http://www.macstories.net/tutorials/guide-url-scheme-ios-drafts)

### 목차

#### 1편

- Drafts 기초
- Drafts URL Schemes
- 다양한 태그들
- Drafts 를 더욱 유용하게 만들기

#### 2편

- Dropbox 액션
- Evernote 액션
- Email 액션
- Message 액션
- URL 액션 : 모든것을 한자리에 모아놓은 가교역할
- 세개 혹은 그 이상 액션을 순차적으로 연결하기
- draft  세분화
- 긴 연속된 액션을 하나의 실타래로 고려하기
- “allowEmpty” 매개변수 사용하기
- 결론

### Drafts 기초

Drafts를 이용한 iOS앱의 자동화 방식은 상당히 유용한 편입니다. App.net, Google+, Facebook 포스트, 캘린더 이벤트 및 블로그 포스트 까지 상당히 많은 앱간에 Drafts를 이용할 경우 자동화가 가능해 집니다..

 
실제 이러한 모든 과정들은 액션으로 실행이 가능합니다. 액션들의 모음인 액션리스트는 아이콘 제일 우측의 나눔버튼(share icon)을 통해 접근할 수 있으며, 현재 등록된 모든 액션 리스트 뿐 아니라, 사용자가 만든 액션까지도 보여집니다. 이러한 액션은 탭과 동시에 실행이 되며 Drafts 화면에 입력된 내용을 복사, 이동, 및 기타 사용자가 원하는 활용 용도로 사용될 수 있고 드랍박스, 에버노트, 이메일, 메시지, 혹은 다른 앱들로 수행할 명령을 전달하는 용도로도 사용됩니다.

다시말하면 Drafts를 단순하게 접근하면, 노트용 앱 수준으로 볼 수 있지만, 크게 보면 텍스트 하나하나를 명령어로 둔갑시킬 수 있는 특별한 기능이 내장되어 있다고도 볼 수 있는 부분입니다.

아래의 URL Schemes은 Drafts로 작성된 텍스트를 App.net과 Twitter에 자동적으로 동시에 글을 포스팅하는 일례입니다.

> drafts://x-callback-url/import_action?type=URL&name=crossPost&url=drafts%3A%2F%2Fx-callback-url%2Fcreate%3Ftext%3D%5B%5Bdraft%5D%5D%26action%3D%7B%7BPost%20to%20App.net%7D%7D%26x-success%3D%7B%7Bdrafts%3A%2F%2Fx-callback-url%2Fcreate%3Ftext%3D%5B%5Bdraft%5D%5D%26action%3DTweet%253A%2520ajguyot%7D%7D

다만, 액션과 관련하여 숙지해야 할 중요한 사항은 여러개의 액션의 조합은 이미 언급한데로 자동적으로 처리를 의미하는 거지 동시에 를 의미하는건 아닙니다. 이말은 다시말해 순차적으로 라는 의미로 이해를 하셔도 됩니다. 자세한 사항은 계속되는 절에서 예문과 함께 제시되겠지만, 미리 숙지해야 할 것은 액션의 조합은 순차적으로 실행시킬 업무의 연속이다 라고 이해하고 있으면 좋을 듯 합니다. 이말에는 선행의 액션에서 오류가 발생하면 후행의 액션은 절대로 수행되지 못한다 라는 것을 암시하고 있는 말입니다. 따라서, 액션을 작성하실때는 개별 액션을 먼저 작성해서 수행여부를 확인하신 후에 액션을 합쳐야지만, 사용이 가능함을 의미하는 말이기도 합니다. 아무튼 더욱 자세한 사항은 뒤편에서 얘기하겠습니다.

그리고 이러한 액션의 확장성은 이미 보셨을 수도 있는 x-callback-url 과 더불어 아주 많은 업무를 수행할 수 있습니다. 혹시라도 x-callback-url에 대해 궁금하신분 들은 이글을 읽기전에 먼저 여기를 방문하고 오셔도 좋을 듯 합니다.

Drafts의 액션 추가는 Settings > Custom Actions에서 할 수 있으며, 현재는 Email Actions, Message Actions, Dropbox Actions, Google Drive Actions, Evernote Actions, URL Actions 이 있고, 액션의 작성은 태그( [[action name]] )의 조합으로 대부분 가능하지만, 각각의 액션마다 특징이 있어 입력방식은 액션마다 상이합니다. 자세한 스트립에 대한 내용을 확인하기 위해서는 Actions > Tag Help 를 탭하면 사용가능한 태그 목록이 나옵니다.
  
그외 사용자가 등록한 Actions을 다운받기 위해서는 Visit the Action Directory를 눌러 Drafts를 선택하면 사용자 등록 액션이 나타나며, 설치를 원하는 액션에서 install버튼을 누르면 앱에 자동으로 설치가 이루어집니다.

URL Scheme은 그 작성 형태가 웹사이트 URL 구성형태와 매우 흡사합니다. 즉 모든 웹사이트가 자신만의 도메인명을 가지고 있듯이 iOS 앱들또한 자신만의 도메인명에 해당하는 워크플로우명을 가지고 있고, 자신만의 액션들이 있습니다. 다시말해 웹사이트 도메인명은 “http://yourwebsite.com”의 형태로 사용되는 반면 iOS 앱의 URL Scheme은 yourapp:// 의 형태로 사용되며, 웹사이트에서 지정된 사이트로 가기위해 “http://yourwebsite.com/yourspecialsitename” 하듯이 URL Scheme도 yourapp://yourspecialaction?의 형태로 작성됩니다.

자세한 사항은 다음장의 Drafts URL Scheme를 참고하시면 됩니다.

### Drafts URL Scheme

액션을 쉽고 빠르게 연결하기 위해서는 URL에 대한 체계를 먼저 이해하는게 중요합니다. Safari for iOS 의 주소창에 drafts://라고 입력 (만약 Safari가 아닌 Google Chrome을 사용한다면 Safari에서처럼 바로 엔터를 치지말고 입력후에 나타나는 Omni-bar 하부의 문서열기 옵션을 눌러줘야 합니다. 그렇지 않고 그냥 엔터를 칠경우 그냥 drafts:// 에 대한 검색을 하게 됩니다.) 하고 엔터키를 치면 웹페이지에서는 어떤 변화도 없이 단순히 Drafts 앱이 실행될 것입니다.

  

이제 Drafts의 실행방법을 알았다면, 다음 단계인 액션을 수행시키는 단계입니다. Drafts는 create라는 단일 액션을 가지고 있습니다. (여기에 대한 자세한 내용은 여기를 읽어보시기 바랍니다.) 따라서 이러한 액션을 URL 형식으로 적용해야하는데, 여기서 알아야 할 내용이 있습니다. 바로 x-callback-url 입니다.

x-callback-url은 Greg Pierce에 의해 만들어진 URL 표기법으로 샌드박스 정책으로 앱간 접근이 제한되어 있는 상황에서 그나마 앱간 자료의 전달 및 공유를 자유롭게 할 수 있도록 해주는 매우 유용한 명기법입니다. 현재 x-callback-url 을 사용할 수 있는 앱들이 점차로 늘어나고 있는 실정이며, 사용가능한 앱들의 확인은 여기를 방문하시면 됩니다.

x-callback-url 사용법은 매우 단순하여 성기의 drafts:// 에 x-callback-url 만 추가하면 됩니다: drafts://x-callback-url/. 따라서 Drafts로 어떠한 액션을 수행하기 위해서는 다음과 같이 표기합니다: drafts://x-callback-url/create?.

참고로 웹사이트 URL과 마찬가지로 액션 URL도 percent-encoded를 사용해야합니다. 즉 공백은 %20을 사용해야 한다는 의미입니다. 예를들어 Drafts앱에 Hello World를 나타내는 액션을 표현하고자 한다면, drafts://x-callback-url/create?text=Hello%20World라고 입력하면 됩니다. Safari에서 실행해보면 상당히 기분좋은 액션실행결과를 보게 될 것입니다.

  

다시금 위의 액션을 살펴보겠습니다. 이유는 실제 액션이 어떤 단계로 작동하는지를 이해해야만 긴문장의 액션 뿐만아니라, 다중 액션도 사용법을 확실히 이해할 수 있기 때문입니다. 

- drafts:// : iOS에게 Drafts를 호출하도록 합니다. 
- x-callback-url : Drafts에게 x-callback 매개변수를 사용할수 있도록 해줍니다. 
- create? : Drafts에게 새로운 draft를 하나 만들도록 합니다. 
- text=Hello%20World : draft에 “Hello World” 를 보이도록 합니다.

이번에는 더 나아가서 “Hello World”를 연속해서 twitter에 올리도록 하는 액션을 만들어 보겠습니다. Drafts 앱에서 트윗을 할 거면, 단순히 설정버튼을 눌러 액션 리스트 중에 트윗리스트를 선택하면 되지만, 액션으로 처리하기 위해서는 &action= 을 포함해야 합니다. 그리고는 올리는사람의 트윗명을 포함하는 Tweet: username 액션을 추가합니다. - 여기서 username은 트위터 사용자 이름입니다. 저의 경우 트윗네임이 hunikim이므로 username에는 hunikim을 입력합니다. - 여기에 추가로 콜론(:)에 해당하는 퍼센트인코드값이 %3A이므로 전체적인 입력은 다음과 같습니다. drafts://x-callback-url/create?text=Hello%20World&action=Tweet%3A%20hunikim

앞서도 기초단계에서 얘길 했지만 다시 한번더 얘기하자면, 액션은 동시에 두개의 액션을 실행시킬수 없고 같은 draft에서 다중 액션을 실행시킬수도 없습니다. 다중액션을 실행시키기 위해서는 일단 액션을 실행시킨 후에 x-callback 매개변수를 불러서 다음 액션을 실행시켜야 합니다.

x-callback 매개변수는 4가지가 있습니다: x-source, x-success, x-error, x-cancel. 변수에 대한 더욱 자세한 사항은 여기를 참조하시기 바랍니다. 

- x-success : 액션수행후에 소스앱으로 되돌아간다든지 할 경우에 사용되는 변수입니다. 언급이 없을 경우는 수행된 앱에 머물게 됩니다. 
- x-source : 액션을 수행할 앱을 부르는 변수입니다. 만약 다른 앱을 통해 수행할 액션이 있을 경우 사용하게 됩니다. 
- x-error : 수행할 앱에서 에러가 발생할 경우 수행할 URL을 지칭합니다. 
- x-cancel : 수행할 앱을 사용자가 취소하엿을 경우 수행할 URL을 지칭합니다.

이어서“Hello World”를 App.net에 포스팅하는 액션을 x-success의 액션으로 추가해보도록 하겠습니다. 추가 액션은 다음과 같습니다.

~~~
drafts://x-callback-url/create?text=Hello%20World&action=Post%20to%20App.net
~~~

액션 추가를 위해 한가지 주의해야 할 사항은 다음과 같습니다.
yourapp://x-callback-url/액션1&x-success={{액션2}}&x-success={{{{액션3}}}}…

즉, **두번째 액션부터는 위에서 보듯이 액션을 첨부해 줄때마다 {{}} 를 계속 더붙여줘야 한다는 것입니다.**

그런데 상기 액션을 보면 알겠지만, 퍼센트-인코드 문자가 포함된 내용을 해석 혹은 읽기가 상당히 어려운걸 느끼실겁니다. 또 코드 자체를 잘몰라 입력에 어려움을 겪을 수도 있고요. 그래서 Drafts 앱은 간편하게 퍼센트-인코드를 자동으로 입력하게 하는 방법이 있는데 그방법도 액션추가와 동일한 {{}} 입니다. 따라서 상기의 두가지 액션을 덧붙이고서 자동 퍼센트-인코드 입력을 하도록 액션코드를 입력하면 다음과 같습니다.

> drafts://x-callback-url/create?text={{Hello World}}&action={{Tweet: hunikim}}&x-success={{drafts://x-callback-url/create?text=Hello%20World&action=Post%20to%20App.net}} 혹은 drafts://x-callback-url/create?text={{Hello World}}&action={{Tweet: hunikim}}&x-success={{drafts://x-callback-url/create?text={{Hello World}}&action={{Post to App.net}}}}

### 태그(Tags)

Drafts에는 입력의 간편화와 효율적인 URL 관리를 위해 몇가지 태그들을 지원합니다.

* [[draft]] : 입력했던 내용들(draft) 전체를 대신합니다. 
* [[title]] : draft 내용중 첫줄의 내용을 대신합니다. 
* [[body]] : draft 내용중 첫줄을 제외한 모든 내용을 대신합니다. 
* [[clipboard]] : iOS 시스템 메모리에 저장된 내용을 대신합니다. 
* [[line|n]] : draft 내용중 n 줄에 해당하는 내용을 대신합니다. 
* [[line|n..]] : draft 내용중 n 줄 이전의 내용을 제외한 나머지 내용을 대신합니다. 
* [[line|..n]] : draft 내용중 처음부터 n 줄까지의 내용을 대신합니다. 
* [[line|a..b]] : draft 내용중 a줄부터 b줄 까지의 내용을 대신합니다. 
* [[Selection]] : draft 내용중 마지막에 선택된 내용물을 대신하되, 선택된 내용이 없다면 전체 내용을 대신합니다.

앞줄에서 언급된 Hello World 대신에 draft에 입력한 내용을 트위하기 위해서는 액션코드를 다음과 같이 수정합니다.

drafts://x-callback-url/create?text=[[draft]]&action={{Tweet: hunikim}}

마찬가지로 [[draft]]에 작성자의 요구에 맞추어 적당한 태그를 사용할 수 있습니다. 이러한 URL 액션상용의 확장성으로 인해 많은 사람들이 Drafts 의 매력에 빠져있는 것 같습니다.

### Drafts 를 더욱 유용하게 만들기

상기의 내용에서와 같이 Draft 액션 만드는 과정이 어느정도 숙지되고 나면 다중액션에 대한 자신감과 Drafts를 유용하게 사용할 수 있는 각자의 최선의 방법들을 발견하게 될 것입니다.

만약 상기의 예와같은 다중액션에 대한 일을 직접한다고 하면 얼마나 많은 잔손이 가야할지를 찬찬히 생각해본다면, URL 액션의 효과가 얼마나 클지를 알수있습니다.

더 많은 액션과 방법들을 추가적으로 공부하고자 한다면, 여기를 방문해 볼것을 추천합니다. 다양한 앱리뷰 및 앱활용에 대해, 특히 액션관련한 다양한 예제들을 포함하고 있어 Drafts 활용도를 더욱 높여줄 것이라 생각합니다.

또한 더 나아가 x-callback-url 매개변수(x-success, x-cancel, x-source, x-error) 등의 활용에 대해서도 더욱 구체적을 배울수 있는 예제들이 많이 있어 앱을 활용하는데 있어 매우 유용합니다.