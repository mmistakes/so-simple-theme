---
layout: page
title: Development Team
excerpt: ""
modified:
image:
  feature: feature/wide_funnel.png
  credit:
  creditlink:
---

{:.center-txt}
design, doc, code &amp; test


Stan is a team effort that could not be carried out without the
[generous support](/support/) of grants, foundations, sponsors, and
volunteer developers.


<h1>Core Developers <span style="font-size:0.6em" class="note">(in order of joining)</span></h1>


<ul>
{% for member in site.data.developers %}

  <div style="clear:both">
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

{% endfor %}
</ul>

# Development Team Alumni

Developers who have made important contributions in the past, but are no longer contributing actively:

<ul>
{% for member in site.data.alumni_developers %}
  <a href="{{ member.web }}">{{ member.name }}</a>
  ({{ member.affiliation }})
  <br>
{% endfor %}
</ul>

# Join the Team

For more info on how join the the development team, read about
[how to contribute to Stan](/development/).
