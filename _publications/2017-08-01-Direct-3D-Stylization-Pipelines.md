---
layout: publication
categories: talks
title: Direct 3D stylization pipelines
authors: Montesdeoca S. E., Seah H. S., Benvenuti D., Bénard P., Rall H.-M., Thollot J., Vergne R.
type: Conference Talk
publication: ACM SIGGRAPH 2017 Real Time Live!
place: ACM SIGGRAPH
event: Real Time Live!
citation: "[MSB*17]"   
excerpt: We present a direct watercolor stylization system that lets artists control locally the desired effects directly in their animated 3D scene, seeing the stylized results in real-time.
year: 2017
publisher: ACM
pages: 18
tags: [Watercolor, MNPR, art-directed, SIGGRAPH, NPR, research, conference]
image:
  path: images/headers/siggraph2017.jpg
  caption: "[Montesdeoca et al.] - Spherebot, model by Bastien Genbrugge."
  card: images/cards/siggraph2017.jpg
  thumbnail:
comments: true
share: true
source: https://doi.org/10.1145/3098333.3098339
schema: ScholarlyArticle
redirect_from:
  - /articles/Direct-3D-stylization-pipelines/
  - /research/Direct-3D-stylization-pipelines/
---
{::options parse_block_html="true" /}
<div class="publication-info center">
  <div class="authors"><span>[Santiago E. Montesdeoca](http://artineering.io)</span> <span>[Hock Soon Seah](http://www.ntu.edu.sg/home/ashsseah/)</span> <span>[Davide Benvenuti](http://davidebe.blogspot.sg/)</span> <span>[Pierre Bénard](http://www.labri.fr/perso/pbenard/)</span> <span>[Hans-Martin Rall](http://www.hannesrall.com/)</span> <span>[Joëlle Thollot](http://maverick.inria.fr/~Joelle.Thollot/)</span> <span>[Romain Vergne](http://romain.vergne.free.fr/blog/)</span>
  </div>
  <div class="university">[Nanyang Technological University](http://www.ntu.edu.sg), [Inria](https://www.inria.fr/en/), [Université Grenoble Alpes](http://www.univ-grenoble-alpes.fr/), [Université Bordeaux](http://www.u-bordeaux.com/), [CNRS](http://www.cnrs.com/)
  </div>
  <div class="published-in">{{page.publication}} - {{page.publisher}}, {{page.year}}, pp. {{page.pages}}
  </div>
  Presented at [Siggraph 2017](http://s2017.siggraph.org/)
  <div class="doi">DOI: [10.1145/3098333.3098339](http://doi.acm.org/10.1145/3098333.3098339)
  </div>
</div>

{% include responsive-embed url="https://www.youtube.com/embed/hpuEdXn_M0Q?rel=0&amp;start=3214" ratio="16:9" %}


## Abstract
<div class="abstract">
_Using 3D computer graphics to emulate watercolor presents a special challenge.
Complex stylizations are commonly processed offline, by combining multiple passes in
compositing, where art directing is slow and non-intuitive because the stylized result is
not immediate._

_This direct 3D stylization pipeline allows art direction to happen in real time. Using
the framework, artists can assign their desired local and global effects directly in the
3D scene, see the stylized results immediately, and intuitively adapt them to fit their
stylized vision._

_The technique can be used and applied in 3D animations, games, VR, visualizations,
illustrations, and interactive art._
</div>


## BibTeX
    {% raw %}
    @inproceedings{montesdeocadirect2017,
     author = {Montesdeoca, Santiago and Seah, Hock Soon and Benvenuti, Davide and B{\'e}nard, Pierre and Rall, Hans-Martin and Thollot, Jo\"{e}lle and Vergne, Romain},
     title = {Direct 3D Stylization Pipelines},
     booktitle = {ACM SIGGRAPH 2017 Real Time Live!},
     series = {SIGGRAPH '17},
     year = {2017},
     isbn = {978-1-4503-5090-7},
     location = {Los Angeles, California},
     pages = {18--18},
     numpages = {1},
     url = {http://doi.acm.org/10.1145/3098333.3098339},
     doi = {10.1145/3098333.3098339},
     acmid = {3098339},
     publisher = {ACM},
     address = {New York, NY, USA},
    }
    {% endraw %}


## Downloads
* [Publication](https://dl.acm.org/authorize?N658395)
* [Implementation](/software/Maya-NPR/)
