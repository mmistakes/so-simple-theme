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

## Watercolor
{: .pull-center}

<div class="demo-img">
  {% for scene in site.data.demo-scenes['watercolor'] %}
    <a href="https://github.com/artineering-io/mnprx-demo-scenes/releases/download{{ scene.download }}" target="_blank">
      <div>
        <img src="/images/MNPRX/demo-scenes/{{scene.picture}}" alt="Image of {{ scene.name }}">
        {% if scene.credits %}
        <p class="img-author"><span>{{ scene.credits }}</span></p>
        {% endif %}
      </div>
       <p><i class="fa fa-download" aria-hidden="true"></i> {{ scene.name }}.zip ({{scene.filesize}})</p>
    </a>
  {% endfor %}
</div>
--- 

## Frayed
{: .pull-center}

<div class="entries-{{ page.entries_layout | default: 'list' }} demo-img">
  {% for scene in site.data.demo-scenes['frayed'] %}
    <a href="https://github.com/artineering-io/mnprx-demo-scenes/releases/download{{ scene.download }}" target="_blank">
      <div>
        <img src="/images/MNPRX/demo-scenes/{{scene.picture}}" alt="Image of {{ scene.name }}">
        {% if scene.credits %}
        <p class="img-author"><span>{{ scene.credits }}</span></p>
        {% endif %}
      </div>
      <p><i class="fa fa-download" aria-hidden="true"></i> {{ scene.name }}.zip ({{scene.filesize}})</p>
    </a>
  {% endfor %}
</div>
--- 

## Cutout
{: .pull-center}

<div class="entries-{{ page.entries_layout | default: 'list' }} demo-img">
  {% for scene in site.data.demo-scenes['cutout'] %}
    <a href="https://github.com/artineering-io/mnprx-demo-scenes/releases/download{{ scene.download }}" target="_blank">
      <div>
        <img src="/images/MNPRX/demo-scenes/{{scene.picture}}" alt="Image of {{ scene.name }}">
        {% if scene.credits %}
        <p class="img-author"><span>{{ scene.credits }}</span></p>
        {% endif %}
      </div>
      <p><i class="fa fa-download" aria-hidden="true"></i> {{ scene.name }}.zip ({{scene.filesize}})</p>
    </a>
  {% endfor %}
</div>