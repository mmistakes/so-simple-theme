---
layout: page
title: Face2Voice
permalink: /face2voice/
---

# Face2Voice
> 얼굴 이미지 **+** 텍스트 → 얼굴 정체성을 반영한 **음성 합성**

<!-- **업데이트:** 2025-11-04 -->

## 관련 글들

{% for post in site.posts %}
  {% if post.categories contains "face2voice" %}
- [{{ post.title }}]({{ post.url }}) — {{ post.date | date: "%Y-%m-%d" }}
  {% endif %}
{% endfor %}


### What it does
- 업로드한 **얼굴 이미지**에서 face embedding 추출
- 입력 **텍스트**를 멜스펙트로그램으로 합성
- **보코더**로 파형 생성 → 브라우저 재생/다운로드

### Stack
- **Face**: `facenet_pytorch`, `lip2speech/modules/vgg_face.py`
- **Visual**: `ShuffleNetV2` 백본 (`lip2speech/modules/video.py`)
- **Core**: `lip2speech/model.py` (VideoExtractor + FaceRecognizer + Decoder)
- **TTS**: SV2TTS 스타일 synthesizer + vocoder
- **Web**: Flask (`app.py`), Jinja2 (`templates/`), Static (`static/`)

### Run (local)
```bash
conda create -n face2voice python=3.9 -y
conda activate face2voice
pip install torch torchvision torchaudio
pip install -r requirements.txt
python app.py
```

### Notes
- `savedmodels/`에 사전학습 가중치 필요(encoder/synthesizer/vocoder)
- GPU 권장(특히 vocoder)
- 윤리: 합성 음성은 명시하고, 동의 없이 공개 사용하지 않기
