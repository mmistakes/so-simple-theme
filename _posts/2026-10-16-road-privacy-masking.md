---
layout: post
title: "전주·전선만 남기고 나머지는 블러: road-privacy-masking"
categories: [project, road-privacy-masking]
---

뉴럴디 인턴십에서 진행한 프로젝트. 도로 촬영 이미지에서 전주·전선 영역만 원본 그대로 남기고, 사람 얼굴·차량 번호판·건물 등 나머지 영역을 블러 처리해 비식별화하는 스크립트입니다.

### What it does
- 기존 YOLO bbox 라벨을 그대로 활용 (원본 이미지·라벨은 수정하지 않고 결과만 별도 폴더에 저장)
- 원본 전체에 가우시안 블러를 2회 적용한 블러 버전을 만든 뒤, 전주·전선 박스 영역만 원본 픽셀로 합성 (경계는 페더링 처리)
- 전주-전선 박스 사이 라벨링 간격을 모폴로지 클로징으로 메워, 연결부가 부분적으로 블러되는 현상을 방지

### 사용법
```bash
python mask_privacy.py <원본 폴더> <출력 폴더>
```
`<원본 폴더>`에는 이미지와 같은 이름의 `.txt`(YOLO bbox 라벨)가 함께 있어야 합니다.

### 테스트 결과
navi_images_200(200장) 전체 정상 처리. 전주·전선은 선명하게 유지되고, 차량 번호판·건물·사람 등은 식별 불가능한 수준으로 블러됐습니다.

### Repo
<https://github.com/gaeun-k/cv_intern/tree/main/road-privacy-masking>
