---
layout: post
title: "감정 기반 여행지 추천 시스템: AI-Travel-Recommendation"
categories: [project, ai-travel-recommendation]
---

여행지를 키워드가 아니라 **감정과 분위기**로 찾을 수 있게 만든 크로스모달 검색 프로젝트입니다.

### What it does
- 다국어 CLIP(ViT-B/32)을 파인튜닝해 여행지 이미지와 사용자 감정 사이의 의미적 관계를 학습
- 텍스트→이미지, 이미지→이미지 양방향 검색 지원
- FAISS 기반 벡터 검색으로 대규모 데이터셋에서도 빠른 유사도 매칭

### Stack
- **Image encoder**: 사전학습 CLIP(ViT-B/32)
- **Text encoder**: Multilingual DistilBERT (768차원)
- **Head**: 13종 장면 분류 헤드 + 256차원 프로젝션 헤드 (듀얼 헤드 구조)
- **Search**: FAISS

### Approach
- 데이터 중심(data-centric) 접근: 중복 제거, 한글 NFC 정규화, 무결성 검증, LLM 기반 캡션 정제로 여행지의 '분위기'를 세밀하게 반영
- Loss: CLIP loss + Supervised Contrastive Learning + 장면 분류 Cross-Entropy 결합

### Repo
<https://github.com/gaeun-k/AI-Travel-Recommendation>
