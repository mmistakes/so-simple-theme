---
layout: publication
permalink: /software/MNPRX/demo-scenes
title: MNPRX Demo Scenes
excerpt: Demo scenes to use with MNPRX
image:
  path: images/headers/MNPRX.jpg
  caption: Stylized rendering for Autodesk Maya
  card: images/cards/MNPRX.jpg
  thumbnail:
entries_layout: grid
---

<!--<script>window.location.href = "https://www.notion.so/artineering/MNPRX-Demo-Scenes-90609f181dd24e5fb97ded06a55fb404"</script>
If you are not redirected automatically, please manually continue to [MNPRX Demo Scenes](https://www.notion.so/artineering/MNPRX-Demo-Scenes-90609f181dd24e5fb97ded06a55fb404).-->

## Watercolor
{: .pull-center}

<div class="demo-img">
  {% for demo in site.data.demo['watercolor'] %}
    <a href="https://github.com/artineering-io/mnprx-demo-scenes/releases/download{{ demo.download }}" target="_blank">
      <div>
        <img src="/images/MNPRX/demo-scenes/{{demo.picture}}" alt="Image of {{ demo.name }}">
        <p class="img-author"><span>Made by {{ demo.made_by }}</span></p>
      </div>
       <p><i class="fa fa-download" aria-hidden="true"></i> {{ demo.name }}.zip ({{demo.filesize}})</p>
    </a>
  {% endfor %}
</div>
--- 

## Frayed
{: .pull-center}

<div class="entries-{{ page.entries_layout | default: 'list' }} demo-img">
  {% for demo in site.data.demo['frayed'] %}
    <a href="https://github.com/artineering-io/mnprx-demo-scenes/releases/download{{ demo.download }}" target="_blank">
      <div>
        <img src="/images/MNPRX/demo-scenes/{{demo.picture}}" alt="Image of {{ demo.name }}">
        <p class="img-author"><span>Made by {{ demo.made_by }}</span></p>
      </div>
      <p><i class="fa fa-download" aria-hidden="true"></i> {{ demo.name }}.zip ({{demo.filesize}})</p>
    </a>
  {% endfor %}
</div>
--- 

## Cutout
{: .pull-center}

<div class="entries-{{ page.entries_layout | default: 'list' }} demo-img">
  {% for demo in site.data.demo['cutout'] %}
    <a href="https://github.com/artineering-io/mnprx-demo-scenes/releases/download{{ demo.download }}" target="_blank">
      <div>
        <img src="/images/MNPRX/demo-scenes/{{demo.picture}}" alt="Image of {{ demo.name }}">
        <p class="img-author"><span>Made by {{ demo.made_by }}</span></p>
      </div>
      <p><i class="fa fa-download" aria-hidden="true"></i> {{ demo.name }}.zip ({{demo.filesize}})</p>
    </a>
  {% endfor %}
</div>