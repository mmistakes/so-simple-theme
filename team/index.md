---
layout: page
title: Developers &amp; Funding
excerpt: ""
modified:
image:
  feature: feature/wide_funnel.png
  credit:
  creditlink:
---

Stan is a team effort that could not be carried out without external
  grant funding.

Development Team
================

Core contributors to Stan's design, implementation, and testing,
in order of joining:

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
  </div>

  </div>

{% endfor %}
</ul>

Development Team Alumni
-----------------------

Developers who contributed to earlier versions of Stan:

<ul>
{% for member in site.data.alumni_developers %}
  <a href="{{ member.web }}">{{ member.name }}</a>
  ({{ member.affiliation }})
  <br>
{% endfor %}
</ul>

Join the Development Team
-------------------------

For more info on how join the the development team, read about
[how to contribute to Stan](/development/).

Logo
----

Stan logo copyright Michael Betancourt, with special thanks to
[Stephanie Mannhein](http://www.stephaniemannheim.com/)
for critical refinements. <span class="note">(CC-BY ND 4.0 license)</span>

Funding
-------

Without the following generous funding from our sponsors,
Stan would not exist.

Stan is currently funded in part by the following corporations:

* [YouGov](https://today.yougov.com/#/)
* [Novartis](https://www.novartis.com)
* [Alcon](http://www.alcon.com)

Stan is currently funded in part by the following grants:

* Alfred P. Sloan Foundation
  <br />
  <span class="note">(G-2015-13987: <i>Stan Community and Continuity</i>)</span>

* U. S. Office of Naval Research
  <br />
  <span class="note">(<i>Informative Priors for Bayesian Inference
  and Regularization</i>)</span>

* U. S. Institute of Education Sciences
  <br />
  <span class="note">(Statistical and Research Methodology:
  <i>Solving Difficult Bayesian Computation Problems in Education
  Research Using Stan</i>)</span>


Stan was previously funded in part by the following grants:

* U. S. National Science Foundation
  <br />
  <span class="note">(CNS-1205516: <i>Stan: Scalable Software for Bayesian Modeling</i>)</span>

* U. S. Department of Energy
  <br />
  <span class="note">(DE-SC0002099 <i>Petascale Computing</i>)</span>

* U. S. National Science Foundation
  <br />
  <span class="note">(ATM-0934516: <i>Reconstructing Climate from Tree Ring Data</i>).</span>

* U. S. Institute of Education Sciences
  <br />
  <span class="note">(ED-GRANTS-032309-005:
  <i>Practical Tools for Multilevel Hierarchical Modeling in Education
  Research</i>)</span>
  <br />
  <span class="note">(R305D090006-09A:
  <i>Practical Solutions for Missing Data</i>)</span>

The high-performance computing facility used for large-scale
evaluations was funded through the following grant:

* U. S. National Institutes of Health
  <br />
  <span class="note">(1G20RR030893-01:
  <i>Research Facility Improvement Grant</i>)</span>
