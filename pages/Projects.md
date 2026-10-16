---
layout: page
title: Projects
permalink: /projects/
---

## Neural-D 인턴십
전주·시설물 점검 관련 컴퓨터비전 프로젝트 7건을 진행했습니다. 코드는 [gaeun-k/cv_intern](https://github.com/gaeun-k/cv_intern)에 정리되어 있습니다 (실제 학습 데이터·이미지는 비공개, 방법론·코드만 공개).

### 완철·애자 기울기 자동 진단
전주 점검 사진에서 완철과 애자의 기울기를 자동으로 측정하고, 정상/의심 여부를 판정하는 파이프라인. 세그멘테이션 → 탐지 모델 → 판정 로직 → keypoint 실험 → 도구화까지 약 2주간 진행했습니다.

- **Tech**: SAM(세그멘테이션), 회전 바운딩 박스(OBB) 탐지, Keypoint 모델, PyTorch
- **Features**: 완철/전주/주변 애자 각도 기반 동적 기준선 산출, 사람이 매긴 정답 데이터 기반 판정 로직 보정, 정상/의심 표시 뷰어 도구

{% for post in site.posts %}
  {% if post.categories contains "crossarm-insulator-tilt" %}
- **포스팅**: [{{ post.title }}]({{ post.url }})
  {% endif %}
{% endfor %}

### 시설물 불량 진단
전주 설비(너트 체결부·전선·커버) 3종의 불량을 YOLO(탐지) + EfficientNet-B0(분류) 2단계 파이프라인으로 진단하는 프로젝트 3개.

- **Tech**: YOLOv5/ultralytics, EfficientNet-B0 fine-tuning, PyTorch
- **Features**: 데이터 비율·증강 조합별 실험, 탐지+분류 2단계 구성, 오류 분석·시각화

{% for post in site.posts %}
  {% if post.categories contains "facility-defect-diagnosis" %}
- **포스팅**: [{{ post.title }}]({{ post.url }})
  {% endif %}
{% endfor %}

### 기타 프로젝트
{% for post in site.posts %}
  {% if post.categories contains "road-privacy-masking" or post.categories contains "tunnel-crack-detection" or post.categories contains "crack-segmentation" or post.categories contains "pole-monitoring-viewer" or post.categories contains "pole-gps-image-curation" %}
- [{{ post.title }}]({{ post.url }})
  {% endif %}
{% endfor %}

---

## AI-Travel-Recommendation
감정 기반 여행지 추천 시스템. 다국어 CLIP을 파인튜닝해 사용자의 감정과 여행지 이미지 사이의 의미적 관계를 학습했습니다.

- **Tech**: CLIP(ViT-B/32) 파인튜닝, Multilingual DistilBERT, FAISS 벡터 검색, Supervised Contrastive Learning
- **Features**: 장면 분류(13종) + 감정 정렬 듀얼 헤드 구조, 텍스트↔이미지 / 이미지↔이미지 검색
- **Repo**: <https://github.com/gaeun-k/AI-Travel-Recommendation>

{% for post in site.posts %}
  {% if post.categories contains "ai-travel-recommendation" %}
- **포스팅**: [{{ post.title }}]({{ post.url }})
  {% endif %}
{% endfor %}

---

## AAC-Scene-Recognition-AI
스마트 글래스(Meta Glass)로 촬영한 이미지를 분석해 현재 상황(장면)을 인식하고, 알맞은 AAC(보완대체의사소통) 카드를 추천하는 시스템입니다.

- **Tech**: Meta Glass 환경에 맞춘 CLIP 파인튜닝 기반 장면 분류, FastAPI 백엔드
- **Features**: 병원 접수처·약국·카페·식당·편의점 계산대, 버스/지하철 입구 등 7종 장면 분류, Swagger API 문서
- **Repo**: <https://github.com/gaeun-k/AAC-Scene-Recognition-AI>

{% for post in site.posts %}
  {% if post.categories contains "aac-scene-recognition-ai" %}
- **포스팅**: [{{ post.title }}]({{ post.url }})
  {% endif %}
{% endfor %}

---

## Face2Voice
텍스트와 얼굴 이미지를 입력하면 **얼굴 정체성을 반영한 음성**을 합성하는 Flask 데모입니다.

- **Tech**: PyTorch, Flask, facenet_pytorch, SV2TTS 스타일 파이프라인, ShuffleNetV2 (Lip2Speech 기반)
- **Repo**: <https://github.com/gaeun-k/Face2Voice>
- **포스팅**: [/face2voice/](/face2voice/)

---

## Moms-touch *(바이브코딩 프로젝트)*
말이나 글로만 전해지던 엄마·할머니의 손맛 레시피를 AI로 구조화해 기록하고 공유하는 모바일 앱입니다.

- **Tech**: React Native(Expo) + TypeScript, FastAPI, PostgreSQL, GPT-4o-mini, Google STT/TTS
- **Features**: 음성→레시피 변환, 지역 기반 레시피 지도, 맞춤 추천(지역·난이도), 단계별 음성 안내, 좋아요/프로필
- **Repo**: <https://github.com/gaeun-k/Moms-touch>

{% for post in site.posts %}
  {% if post.categories contains "moms-touch" %}
- **포스팅**: [{{ post.title }}]({{ post.url }})
  {% endif %}
{% endfor %}
