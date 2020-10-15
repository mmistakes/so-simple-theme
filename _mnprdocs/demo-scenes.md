---
layout: publication
permalink: /software/MNPRX/demo-scenes
title: MNPRX Demo Scenes
excerpt: Demo scenes to use with MNPRX
image:
  path: images/cards/MNPRX.jpg
  header: images/headers/MNPRX.jpg
  caption: Stylized rendering for Autodesk Maya
  thumbnail:
entries_layout: grid
---

{% for style in site.data.demo-scenes %}
<h2 class="pull-center">{{style[0]}}</h2>
<div class="demo-img">
  {% for scene in style[1] %}
  <div>
    <figure>
      <img src="/images/MNPRX/demo-scenes/{{scene.picture}}" alt="Image of {{ scene.name }}">
      {% if scene.credits %}
      <p class="img-author"><span>{{ scene.credits }}</span></p>
      {% endif %}
    </figure>
    <p>
      {% if scene.download %}
        <a href="https://github.com/artineering-io/mnprx-demo-scenes/releases/download/{{ scene.download }}" target="_blank">
          <i class="fa fa-download" aria-hidden="true"></i> {{ scene.name }}.zip ({{scene.filesize}})
        </a>
      {% else %}
        <a href="https://www.patreon.com/artineering" target="_blank">
          <i class="fab fa-patreon" aria-hidden="true"></i>Become our Patron
        </a>
        <i class="fas fa-grip-lines-vertical"></i>
        <a href="/software/MNPRX/#getit" target="_blank">
          <i class="fas fa-shopping-cart" aria-hidden="true"></i>Buy Indie/Studio license
        </a>
      {% endif %}
    </p>
  </div>
  {% endfor %}
</div>
<hr>
{% endfor %}
