---
layout: post
title: "엄마의 손맛을 기록하다: Moms-touch (바이브코딩 프로젝트)"
categories: [project, moms-touch]
---

말이나 글로만 전해지던 엄마·할머니의 손맛 레시피를, AI로 구조화해 기록하고 공유하는 모바일 앱입니다. AI 도구와 함께 빠르게 만들어본 바이브코딩 프로젝트입니다.

### What it does
- 음성으로 레시피를 녹음하면 Google STT로 텍스트 변환 후 GPT-4o-mini가 구조화된 레시피로 정리
- 지역 기반 지도에서 레시피 탐색, 취향(지역·난이도) 기반 맞춤 추천
- 요리 단계별 음성 안내(TTS)로 손이 바쁠 때도 편하게 따라하기
- 좋아요·프로필 통계 등 소셜 기능

### Stack
- **Frontend**: React Native(Expo) + TypeScript, React Navigation
- **Backend**: FastAPI, PostgreSQL 16
- **AI/Audio**: OpenAI GPT-4o-mini, Google Cloud Speech-to-Text/Text-to-Speech, ffmpeg

### Repo
<https://github.com/gaeun-k/Moms-touch>
