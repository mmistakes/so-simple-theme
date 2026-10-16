---
layout: post
title: "전주 통합 관제 화면 목업에서 3D 뷰어 프로토타입까지: pole-monitoring-viewer"
categories: [project, pole-monitoring-viewer]
---

뉴럴디 인턴십에서 진행한 프로젝트. 베트남 다낭 전주 상태를 관제 화면 형태로 확인할 수 있도록 만든 뷰어로, "전주 통합 관제 시스템" 컨셉 목업에서 시작해 실좌표를 3D 지도에 연동한 CesiumJS 프로토타입까지 진행했습니다.

### 진행 내용
1. **컨셉 목업**: 실제 데이터 연결 전, UI 구성과 기능(상태 필터, 목록, 상세 패널 등) 아이디어를 정적 HTML로 먼저 스케치
2. **CesiumJS 프로토타입**: 실제 GPS 대표좌표 데이터를 CesiumJS에 연동해, 지도 위에 전주를 실좌표대로 배치하고 신뢰도 등급(A/B/C)에 따라 색상을 다르게 표시. 클릭 시 상세 정보를 보여주는 인포박스 구성. Cesium ion 토큰을 넣으면 실사 위성 지형·3D 건물도 켤 수 있도록 옵션 처리

이 프로토타입을 바탕으로 한 정식 배포판(주행 로그 재생, 건물·도로 데이터 통합 등)은 동료가 이어서 작업했습니다.

### 사용법
두 HTML 파일 모두 브라우저로 더블클릭해서 바로 열람 가능합니다. 프로토타입에서 실사 지형·3D 건물을 보려면 [Cesium ion](https://ion.cesium.com) 무료 토큰을 발급받아 넣으면 됩니다.

### Stack
CesiumJS 1.120(CDN), 프레임워크 없는 순수 HTML/CSS/JS

### Note
실제 촬영 이미지(전주 사진)는 포함하지 않았습니다.

### Repo
<https://github.com/gaeun-k/cv_intern/tree/main/pole-monitoring-viewer>
