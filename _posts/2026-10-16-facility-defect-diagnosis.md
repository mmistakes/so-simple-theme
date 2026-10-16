---
layout: post
title: "시설물 불량 3종을 탐지+분류 2단계로 진단하다: facility-defect-diagnosis"
categories: [project, facility-defect-diagnosis]
---

뉴럴디 인턴십에서 진행한 프로젝트. 전주 설비(너트 체결부·전선·커버) 3종의 불량을 YOLO(탐지) + EfficientNet-B0(분류) 2단계 파이프라인으로 자동 진단합니다.

### 대상 3종

| 프로젝트 | 대상 | 클래스 구성 |
|---|---|---|
| nut-loosening | 체결부 너트 풀림 | 정상(nut) / 불량(nut_loose) |
| wire-defect | 전선 불량 (탐지 전용) | 단일 클래스(wire_defect) |
| cover-defect | SI/COS/LA 커버 불량 | 3기자재 × 정상/불량 = 6클래스 |

### 공통 파이프라인
1. **데이터 분할**: 모든 실험이 공유하는 고정 test 세트를 먼저 떼어두고, 60/80/100% 등 비율 실험은 작은 비율이 큰 비율의 부분집합이 되도록 구성해 공정 비교
2. **증강**: 회전·스케일·좌우반전·밝기를 랜덤 조합해 Train에만 적용 (Valid/Test는 원본 유지)
3. **YOLO 탐지 학습/평가**: 증강 여부 × 데이터 비율 조합별로 학습 후 공유 고정 test로 재검증
4. **분류용 crop + EfficientNet 학습/평가** (너트·커버만 — 전선은 탐지까지만): YOLO 박스를 크롭해 정상/불량 재분류
5. **오류 분석·시각화**: FP/FN 사례, 오분류 이미지, 혼동행렬 정리

### 프로젝트별 특징
- **nut-loosening**: 정상/불량 통합 2-class 탐지와 불량만 보는 1-class 탐지를 비교 실험하고, 최종적으로 "탐지는 위치만, 분류는 별도 모델" 2단계 구성을 채택. ([YOLOv5 vs EfficientNet 비교 실험]({% post_url 2026-08-27-yolov5-vs-efficientnet %})에서 더 자세히 다뤘습니다)
- **wire-defect**: 원본 이미지 그대로 쓰는 방식과 3×3/4×4 타일로 잘라 쓰는 방식을 비교. 분류 단계 없이 탐지까지만 진행
- **cover-defect**: SI/COS/LA 3개 기자재를 분리하지 않고 6클래스 통합 모델 하나로 학습

### Stack
Python, YOLOv5/ultralytics, PyTorch·torchvision(EfficientNet-B0 fine-tuning), scikit-learn, matplotlib

### Note
실제 학습 데이터·이미지·모델 가중치는 비공개이며, 코드만 공개되어 있습니다.

### Repo
<https://github.com/gaeun-k/cv_intern/tree/main/facility-defect-diagnosis>
