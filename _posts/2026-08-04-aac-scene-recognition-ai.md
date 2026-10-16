---
layout: post
title: "스마트 글래스로 상황을 인식해 AAC 카드를 추천하다: AAC-Scene-Recognition-AI"
categories: [project, aac-scene-recognition-ai]
---

Meta Glass로 촬영한 이미지를 분석해 사용자가 처한 상황(장면)을 인식하고, 알맞은 AAC(보완대체의사소통) 카드를 추천하는 프로젝트입니다.

### What it does
- OpenCLIP 기반 baseline 모델로 이미지를 장면 카테고리로 분류
- FastAPI 백엔드에서 이미지 예측 API 제공, Swagger로 테스트 가능
- 인식 결과에 맞는 AAC 카드를 추천해 의사소통을 보조

### Scene categories
병원 접수처 · 약국 · 카페 · 식당 · 편의점 계산대 · 버스 입구 · 지하철 개찰구 (총 7종)

### Stack
- **Model**: OpenCLIP → Meta Glass 환경에 맞춘 CLIP 파인튜닝
- **Backend**: FastAPI
- **Docs**: Swagger

### Status
Baseline CLIP + FastAPI 서버 구축에 이어 Meta Glass 환경에 맞춘 CLIP 파인튜닝까지 마치고 프로젝트를 완료했습니다.

### Repo
<https://github.com/gaeun-k/AAC-Scene-Recognition-AI>
