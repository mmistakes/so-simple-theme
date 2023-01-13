---
layout: page
title: Development Team
excerpt: ""
modified:
image:
  feature: feature/wide_ensemble.png
  credit:
  creditlink:
redirect_from: "/team/"
---

Stan is a team effort that could not be carried out without the
[generous support](/support/) of grants, foundations, sponsors, and
volunteer developers.


<h1>Core Developers <span style="font-size:0.6em" class="note">(in order of joining)</span></h1>


<ul style="columns:1">
{% for member in site.data.developers %}

  <div style="clear:both">
    <div style="float: left">
      {% if member.avatar %}
        {% if member.avatar contains 'http' %}
          <img src="{{ member.avatar }}"
               class="dev-bio-photo"
               alt="{{ member.name }} bio photo"></img>
        {% else %}
          <img src="{{ site.url }}/images/bio/{{ member.avatar }}"
               class="dev-bio-photo"
               alt="{{ member.name }} bio photo">
        {% endif %}
      {% else %}
        <img src="{{ site.url }}/images/bio/bio-photo.jpg"
             class="dev-bio-photo"
             alt="{{ member.name }} bio photo">
      {% endif %}
    </div>

    <div>
      {{ member.name }}<br>
      {{ member.affiliation }}
        <div>
          {% if member.web %}
            <a href="{{member.web}}" target="_blank">
            <i class="fa fa-home"></i></a>
          {% endif %}

          {% if member.email %}
            <a href="mailto:{{member.email}}" target="_blank">
            <i class="fa fa-envelope-square"></i></a>
          {% endif %}

          {% if member.linkedin %}
            <a href="{{member.linkedin}}" target="_blank">
            <i class="fa fa-linkedin-square"></i></a>
          {% endif %}

          {% if member.twitter %}
            <a href="https://twitter.com/{{member.twitter}}" target="_blank">
            <i class="fa fa-twitter-square"></i></a>
          {% endif %}
          {% if member.github %}
            <a href="https://github.com/{{member.github}}" target="_blank">
            <i class="fa fa-github-square"></i></a>
          {% endif %}
        </div>
    </div>

  </div>

{% endfor %}
</ul>

# Development Team Alumni

Developers who have made important contributions in the past, but are no longer contributing actively:

<ul style="columns:2" style="clear:both">
{% for member in site.data.alumni_developers %}
  <div style="clear:both">
    <div style="float: left">
      {% if member.avatar %}
        {% if member.avatar contains 'http' %}
          <img src="{{ member.avatar }}"
               class="dev-bio-photo"
               alt="{{ member.name }} bio photo"></img>
        {% else %}
          <img src="{{ site.url }}/images/bio/{{ member.avatar }}"
               class="dev-bio-photo"
               alt="{{ member.name }} bio photo">
        {% endif %}
      {% else %}
        <img src="{{ site.url }}/images/bio/bio-photo.jpg"
             class="dev-bio-photo"
             alt="{{ member.name }} bio photo">
      {% endif %}
    </div>

    <div>
        {{ member.name }}<br>
        <i>while at:</i>&nbsp; {{ member.affiliation }}
        <div>
          {% if member.web %}
            <a href="{{member.web}}" target="_blank">
            <i class="fa fa-home"></i></a>
          {% endif %}

          {% if member.email %}
            <a href="mailto:{{member.email}}" target="_blank">
            <i class="fa fa-envelope-square"></i></a>
          {% endif %}

          {% if member.linkedin %}
            <a href="{{member.linkedin}}" target="_blank">
            <i class="fa fa-linkedin-square"></i></a>
          {% endif %}

          {% if member.twitter %}
            <a href="https://twitter.com/{{member.twitter}}" target="_blank">
            <i class="fa fa-twitter-square"></i></a>
          {% endif %}
          {% if member.github %}
            <a href="https://github.com/{{member.github}}" target="_blank">
            <i class="fa fa-github-square"></i></a>
          {% endif %}
        </div>
    </div>

  </div>
{% endfor %}

</ul>

# Join the Team

For more info on how join the the development team, read about
[how to contribute to Stan](/development/).

<style>
body { line-height: normal; }
</style>
