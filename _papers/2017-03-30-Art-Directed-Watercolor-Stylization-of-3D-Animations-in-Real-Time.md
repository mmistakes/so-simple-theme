---
layout: publication
categories: articles
title: Art-directed watercolor stylization of 3D animations in real-time
authors: Montesdeoca S. E., Seah H.S., Rall H.-M., Benvenuti D.
type: Journal
publication: Computers & Graphics
place: "Computers & Graphics"
citation: "[MSRB17]"
excerpt: This paper presents a direct stylization pipeline to render 3D animated geometry as watercolor painted animation.
year: 2017
publisher: Elsevier
pages: 60-72
tags: [Watercolor, NPR, direct-stylization, real-time, research, journal]
image:
  path: images/headers/cag2017.jpg
  caption: "[Montesdeoca et al.] - Henry © Oculus Story Studio"
  card: images/cards/cag2017.jpg
  thumbnail:
comments: true
share: true
source: http://dx.doi.org/10.2312/exp.20161063
schema: ScholarlyArticle
redirect_from:
  - /articles/Art-directed-watercolor-stylization-of-3D-animations-in-real-time/
  - /research/Art-directed-watercolor-stylization-of-3D-animations-in-real-time/
---
{::options parse_block_html="true" /}
<div class="publication-info center">
  <div class="authors"><span>[Santiago E. Montesdeoca](http://artineering.io)</span> <span>[Hock Soon Seah](http://www.ntu.edu.sg/home/ashsseah/)</span> <span>[Hans-Martin Rall](http://www.hannesrall.com/)</span> <span>[Davide Benvenuti](http://davidebe.blogspot.sg/)</span>
  </div>
  <div class="university">[Nanyang Technological University, Singapore](http://www.ntu.edu.sg)
  </div>
  <div class="published-in">{{page.publication}} - {{page.publisher}}, {{page.year}}, pp. {{page.pages}}
  </div>
  Special section on [Expressive 2016](http://expressive.richardt.name/2016/)
  <div class="doi">DOI: [10.1016/j.cag.2017.03.002](http://doi.org/10.1016/j.cag.2017.03.002)
  </div>
</div>

{% include responsive-embed url="https://player.vimeo.com/video/200206363?byline=0&portrait=0" ratio="16:9" %}

## Abstract
<div class="abstract">
_This paper presents a direct stylization system to render 3D animated geometry as watercolor painted animation. Featuring low-level art-direction in real-time, our approach focuses on letting users paint custom stylization parameters in the 3D scene. These painted parameters drive watercolor effects in object-space, managing localized control and emulating the characteristic appearance of traditional watercolor. For this purpose, the parameters alter the object-space geometric representations and are rasterized, to coherently control and enhance further image-space effects. The watercolor effects are simulated through improved and novel algorithms to recreate hand tremors, pigment turbulence, color bleeding, edge darkening, paper distortion and granulation. All these represent essential characteristic effects of traditional watercolor. The proposed direct stylization system scales well with scene complexity, can be implemented in most rendering pipelines and can be adapted to simulate a wide range of watercolor looks. The simulation is compared to previous approaches and is evaluated through a user study, involving professional CG artists spending over 50 h stylizing their own assets and sharing their feedback about the watercolor stylization, the direct stylization system and their needs as artists using Non-photorealistic Rendering (NPR)._
</div>

## BibTeX
    {% raw %}
    @Article{montesdeocaart2017,
      author   = {S.E. Montesdeoca and H.S. Seah and H.-M. Rall and D. Benvenuti},
      title    = {Art-directed watercolor stylization of 3D animations in real-time},
      journal  = {Computers \& Graphics},
      year     = {2017},
      volume   = {65},
      pages    = {60 - 72},
      issn     = {0097-8493},
      doi      = {10.1016/j.cag.2017.03.002},
      keywords = {Watercolor, NPR, Expressive rendering, Real-time, Direct stylization, Object-space },
      url      = {http://www.sciencedirect.com/science/article/pii/S0097849317300316},
    }
    {% endraw %}

## Downloads
* [Paper Manuscript](https://dr.ntu.edu.sg/handle/10220/44033)*
* [Implementation](/software/Maya-NPR/)
* [Training material](https://www.youtube.com/playlist?list=PLnr8w_xl4rdtMDMLRRdWAnznQfueZZGUB)
* [User study data](http://www.sciencedirect.com/science/MiamiMultiMediaURL/1-s2.0-S0097849317300316/1-s2.0-S0097849317300316-mmc2.zip/271576/abst/S0097849317300316/3c2d536feb5cf748e17c12e0a0a42813/mmc2.zip?_role=raw-data)
* [Full-sized figures](https://1drv.ms/u/s!Arb19fQ9R1Nhj-w9AKABbRLnfr30lw)

<div class="footnote"><sup>*</sup> _This is the accepted manuscript. The journal publication is available at [ScienceDirect](http://doi.org/10.1016/j.cag.2017.03.002)_
</div>
