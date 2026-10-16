---
layout: post
title: "터널 균열을 탐지하고 폭·등급까지 정량화하기: tunnel-crack-detection"
categories: [project, tunnel-crack-detection]
---

뉴럴디 인턴십에서 진행한 프로젝트. 터널 내부 사진에서 균열(crack)을 탐지·분할하고, 폭·등급을 자동으로 정량화하는 2단계 캐스케이드 파이프라인입니다.

### 파이프라인 흐름
1. **Stage1 — ROI 스크리닝**: 큰 타일로 분할해 YOLO-seg 학습용으로 export하고 학습 (`tile_export.py`, `train.py`). 학습 없이 쓸 수 있는 Frangi/Hessian 능선 필터 기반 후보 탐지도 함께 구현 — 다만 얇은 선형 구조 전반에 반응하는 한계가 있음
2. **Stage2 — 정밀 분할**: 폴리곤 라벨 → 타일 단위 마스크 데이터셋 생성 후, 공개 pretrained U-Net 계열 모델로 아키텍처를 먼저 검증
3. **후처리 정량화**: 오버랩 타일링 + 페더링 스티칭, 형태 필터링, skeleton 기반 폭 계산, 실측 기준 등급 판정
4. **합성 데이터**: 절차적 생성(procedural)과, 실제 균열 패치를 배경에 자연스럽게 합성하는 copy-paste 방식(regrain, 불규칙 마스크, feather 블렌딩) 두 가지를 구현

### 진행 상황 / 한계
- 실제 GPU 학습(Stage1 YOLO, Stage2 U-Net)은 인턴 환경에 GPU가 없어 아직 진행하지 못했고, 코드와 방법론 제시 단계까지 완료했습니다.
- 공개 pretrained U-Net을 자체 데이터에 돌려본 결과 아키텍처 자체는 유효했지만, 문서화·벤치마크가 없는 개인 업로드 모델을 썼다는 점 자체가 한계로 드러나 — 이후 nnU-Net+OmniCrack30k 같은 검증된 벤치마크 모델로 교체를 검토해야 합니다.
- 합성 데이터는 "실제 균열 픽셀을 옮겨 붙이는" copy-paste 방식이 절차적 생성보다 훨씬 자연스럽다는 것을 반복 검증했습니다 (대비 원본 유지, regrain, 불규칙 마스크, 구조물 근처 배치, tight crop이 핵심).

### Stack
Python, OpenCV, scikit-image(frangi, skeletonize), PyTorch, PyMuPDF(실측 도면 PDF 대조용), (GPU 확보 시) ultralytics, segmentation-models-pytorch

### Note
실제 학습 데이터·이미지·모델 가중치는 비공개이며, 코드만 공개되어 있습니다.

### Repo
<https://github.com/gaeun-k/cv_intern/tree/main/tunnel-crack-detection>
