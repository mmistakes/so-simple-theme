---
layout: page
title: About us
excerpt: About Artineering and the Team
image:
  path: images/about/about.jpg
  caption: Photo of Tallinn by Kylli Kittus
schema: AboutPage
---

Every creative studio or artist currently using 3D applications is being forced to a programmed aesthetic that can’t be easily changed. This has led to many animated productions nowadays, which look extremely similar. It's common to hear the term 'cg-look', and it is a shame that we don't take advantage of the unlimited possibilities that computer graphics has to offer. The more the 3D software has matured, the more it has ingrained the photorealistic look into its core. We are here to change that.

Within stylized rendering, we can't just rely on physics and ray-tracing to produce the desired results. There are countless art-directed choices and individual effects that push the image towards the final vision. The more stylized an image is, the more art-direction is required, which should ideally be made in real-time to encourage the creative flow and exploration.

We are currently developing [MNPRX](/software/MNPRX/) and the evolution thereof, our own standalone customizable renderer which integrates into existing 3D workflows, but provides intuitive and artist-friendly interfaces to fully customize the style of the 3D rendered imagery. To complement these efforts, our application will offer real-time art-directed toolsets to easily manipulate stylistic aesthetic effects within 3D. We are creating this software in close collaboration with our community and [RnD clients](/services), to make sure we make something production proven that our users will love.  

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
