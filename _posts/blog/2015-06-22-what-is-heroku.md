---
layout: post
title: Heroku
excerpt: Heroku가 무엇인가?
categories: blog
tags: [Heroku, Rails]
image:
  feature: so-simple-sample-image-5.jpg
  credit: WeGraphics
  creditlink: http://wegraphics.net/downloads/free-ultimate-blurred-background-pack/
comments: true
share: true
---


### Heroku

처음 허로쿠라는 말을 들었을때는 우리가 일반적으로 사용하는 말중에서 가짜라는 의미의 `후루꾸`라는 말이 떠올라 웃었던것 같습니다. 하지만, 그런의미인지 어떤지 기능상으로는 가상의 호스트에서 앱을 실행해볼수 있다고하니 전혀 틀린말은 아닌것 같습니다.

천천히 Heroku를 어떻게 프로그래밍언어인 Ruby와 접목시켜 나가는지 설명하겠습니다.

### Rails 설치
* [Rails](http://rubyonrails.org/)를 시스템에 설치합니다.[^1] 
* `$ rails new 프로젝트명` 로 새로운 프로젝트를 생성합니다. 물론 커맨드상에서 수행합니다.

#### 쇼핑몰 사이트 작성시 작업절차

* $ rails generate controller Pages 페이지이름1 페이지이름2 // 페이지 이름을 각자의 웹사이트 구상 시나리오에 맞추어 생성합니다.

* $ rails generate scaffold Listing name:string description:text price:decimal // 상품에 대한 데이타베이스 성격을 규정합니다. 

* $ rake db:migrate // DB로써 생성시킵니다.

* /config/routes.rb 에 root 'listings#index' 를 추가합니다. // 메인화면에 DB자료가 보이도록 설정하는 과정입니다.

### Bootstrap 설치
화면 디자인을 화려하게 변경시키기 위해 [bootstrap](https://github.com/twbs/bootstrap-sass) gem을 방문하여 설치합니다. 다만, 버전에 따라 조금씩 설치내용이 달라짐으로 설치시 사용법을 자세히 확인할 필요가 있습니다.

* /Gemfile 에 gem 'bootstrap-sass', '~> 3.0.3.0' 과 gem 'sass-rails', '~> 4.0.0'을 추가한다. 물론 설치시점에 따라 버전이 달라지므로 버전은 달리 적용되어야 합니다. 물론 이미 추가 되어 있으면 중복해서 설치할 필요없이 없는 내용만 추가하면 됩니다.

* $ bundle install 

* /app/assets/stylesheets/custom.css.scss 파일을 생성한후 **@import "bootstrap-sprockets";** 및 **@import "bootstrap";**을 추가합니다.

* /app/assets/javascripts/application.js 파일에 기존의 //= require jquery_ujs 밑에 **//= require bootstrap**라인을 추가합니다.

> 반드시 버전의 변경에 따른 gem 파일의 설치방법이 변경되니 사용설명서에 맞추어 변경하시면 됩니다.

* [Bootstrap](http://getbootstrap.com/)사이트를 통해 필요한 각종 화면구성요소들을 복사하여 /app/views/layouts/application.html.erb 및 /app/views/listings/_form.html.erb 그리고 _edit.html.erb, index.html.erb, show.html.erb, new.html.erb 등등을 수정합니다. 여기 제시된 파일명은 각자의 페이지 구성요소 및 내용에 따라 달라질수 있으니 그점 유의 바랍니다.

### Paperclip & ImageMagick 설치
이미지 관리를 위해 [paperclip](https://github.com/thoughtbot/paperclip)과 [ImageMagick](http://www.imagemagick.org/)을 설치합니다.
* paperclip 설치를 위해 /Gemfile 에 gem 'paperclip', '~> 3.0' 을 추가합니다. 설치시기의 버전을 확인하여 설치바람.
* $ bundle install // paperclip을 설치합니다.
* imagemagick 사이트에서 패키지를 받아 설치합니다.
* $ convert 명령을 입력하여 설치가 잘되었는 확인합니다. (만약 convert 명령을 인식하지 못할 경우 $ brew install imagemagick 을 실행후 convert 명령을 재 입력합니다.)




[^1]: <http://installrails.com> 