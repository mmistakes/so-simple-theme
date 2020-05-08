---
layout: about-page
title: Our Story
excerpt: About Artineering and the Team
image:
  header: images/about/spring_tallinn.jpg
  caption: Early night in Tallinn
schema: AboutPage
---

It's common to hear the term 'cg-look', and it is unfortunate considering the unlimited possibilities that computer graphics can offer. The more 3D software has matured, the more it has ingrained the photorealistic look into its core. We are here to change that.

We are developing [MNPRX](/software/MNPRX/) and the evolution thereof, while integrating our technology into existing production pipelines and making it as flexible as possible. At the same time, we strongly advocate to real-time art-directed workflows to support and motivate the creative flow and exploration of artists.

Still here? Awesome! We craft our software in close collaboration with our community and clients like you, to make sure we make something production proven that everyone will love to use!

Building upon years of research in the field, we are passionate and determined developers, researchers and artists from different corners of the world whose headquarters are currently in Tallinn, Estonia.

<div class="aio-team">
  {%- for member in site.data.team -%}
    <div class="aio-team-member">
      {%- assign tm = member[1] -%}
        {%- if tm.picture -%}
          <img src="/images/about/team/{{tm.picture}}" alt="Image of {{ tm.name }}">
        {%- else -%}
          <img src="/images/about/team/member.png" alt="Image of {{ tm.name }} coming soon">
        {%- endif -%}
        <div class="aio-team-name">{{tm.name}}</div>
        <div class="aio-team-role">{{tm.role}}</div>
        <div class="aio-team-social">
          {% if tm.email %}<a href="mailto:{{ tm.email }}" title="Email {{ tm.name }}" target="_top"><i class="fas fa-paper-plane fa-lg"></i></a>{% endif %}
          {% if tm.web %}<a href="{{ tm.web }}" title="{{ tm.name }} on the web" target="_blank"><i class="fas fa-globe-europe fa-lg"></i></a>{% endif %}
          {% if tm.twitter %}<a href="https://twitter.com/{{ tm.twitter }}" title="{{ tm.name }} on Twitter" target="_blank"><i class="fab fa-twitter-square fa-lg"></i></a>{% endif %}
          {% if tm.linkedin %}<a href="https://linkedin.com/in/{{ tm.linkedin }}" title="{{ tm.name }} on LinkedIn" target="_blank"><i class="fab fa-linkedin fa-lg"></i></a>{% endif %}
          {% if tm.github %}<a href="https://github.com/{{ tm.github }}" title="{{ tm.name}} on Github" target="_blank"><i class="fab fa-github-square fa-lg"></i></a>{% endif %}
          {% if tm.vimeo %}<a href="https://vimeo.com/{{ tm.vimeo }}" title="{{ tm.name}} on Vimeo" target="_blank"><i class="fab fa-vimeo-square fa-lg"></i></a>{% endif %}
        </div>
      </div>
  {%- endfor -%}
</div>
