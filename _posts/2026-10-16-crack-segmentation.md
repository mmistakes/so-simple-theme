---
layout: post
title: "bbox 라벨을 픽셀 마스크로: 애자 크랙 세그멘테이션 앙상블 파이프라인"
categories: [project, crack-segmentation]
---

뉴럴디 인턴십에서 진행한 프로젝트. 애자(insulator) 크랙 결함의 YOLO bbox 라벨을 픽셀 단위 세그멘테이션 마스크로 변환하는 방법론을 검토하고 자동화 파이프라인을 만들었습니다.

### 진행 내용
1. **방식 비교**: SAM(ViT-H/ViT-B), SAM-HQ(HuggingFace 포팅 및 원저자 공식 구현), GrabCut, 밝기 percentile 임계값 등 bbox→마스크 변환 방식을 손으로 그린 GT 마스크 7장 기준으로 비교
2. **품질(QC) 기준 설계**: 마스크의 면적비·포함비·연결요소 수를 기준으로 ACCEPT/FLAG/REJECT 3단계를 자동 분류하는 기준을 설계하고 GT로 검증
3. **앙상블 파이프라인**: SAM과 밝기 임계값 두 방식을 합의(agreement)·포함비 기반으로 결합하는 4단계 규칙을 반복 개선 → **mean IoU 0.728 / Dice 0.835** 달성
4. **실패 사례 분석**: SAM-HQ로 교체했을 때 오히려 성능이 떨어지는 사례를 시각 자료로 분석

### 폴더 구성
- `scripts/ensemble_pipeline.py` — 최종 채택된 SAM + 밝기 임계값 합의 기반 앙상블 파이프라인
- `scripts/run_pipeline.py` — SAM 단독 자동 파이프라인 (패딩 크롭 → box-prompt 추론 → QC 분류)
- `scripts/qc_metrics.py` — 마스크 품질(QC) 티어링 모듈
- `report.html` — 방식 비교/QC 기준/파이프라인/검증 결과를 정리한 전체 리포트

### Stack
Python, `transformers`(SamModel/SamHQModel/Sam2Model), `segment-anything-hq`, OpenCV, scikit-image, PyTorch(CPU 추론)

### Note
실제 학습 데이터·원본 이미지·GT 마스크는 비공개이며, 코드와 결과 리포트만 공개되어 있습니다.

### Repo
<https://github.com/gaeun-k/cv_intern/tree/main/crack-segmentation>
