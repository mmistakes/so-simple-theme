---
layout: publication
categories: articles
title: Edge- and substrate-based effects for watercolor stylization
authors: Montesdeoca S. E., Seah H. S., Bénard P., Vergne R. Thollot J., Rall H.-M., Benvenuti D.
type: Conference Proc.
publication: "Expressive '17: The Joint Symposium on Computational Aesthetics and Sketch Based Interfaces and Modeling and Non-Photorealistic Animation and Rendering"
place: "Expressive"
citation: "[MSB*17]"
excerpt: This paper presents an investigation towards edge- and substrate-based effects in watercolor.
year: 2017
publisher: ACM
pages: 2:1-2:10
tags: [Watercolor, art-directed, Expressive, NPR, research, conference]
image:
  header: images/headers/expressive2017.jpg
  caption: "[Montesdeoca et al.] - Still Life, model by Dylan Sisson © Pixar Animation Studios."
  path: images/cards/expressive2017.jpg
  thumbnail:
comments: true
share: true
source: https://diglib.eg.org/handle/10.2312/exp20161063
schema: ScholarlyArticle
redirect_from:
  - /articles/Edge-and-substrate-based-effects-for-watercolor-stylization/
  - /research/Edge-and-substrate-based-effects-for-watercolor-stylization/
---
{::options parse_block_html="true" /}
<div class="publication-info center">
  <div class="authors"><span>[Santiago E. Montesdeoca](http://artineering.io)</span> <span>[Hock Soon Seah](http://www.ntu.edu.sg/home/ashsseah/)</span> <span>[Pierre Bénard](http://www.labri.fr/perso/pbenard/)</span> <span>[Romain Vergne](http://romain.vergne.free.fr/blog/)</span> <span>[Joëlle Thollot](http://maverick.inria.fr/~Joelle.Thollot/)</span> <span>[Hans-Martin Rall](http://www.hannesrall.com/)</span> <span>[Davide Benvenuti](http://davidebe.blogspot.sg/)</span>
  </div>
  <div class="university">[Nanyang Technological University](http://www.ntu.edu.sg), [Inria](https://www.inria.fr/en/), [Université Grenoble Alpes](http://www.univ-grenoble-alpes.fr/), [Université Bordeaux](http://www.u-bordeaux.com/), [CNRS](http://www.cnrs.com/)
  </div>
  <div class="published-in">{{page.publication}} - {{page.publisher}}, {{page.year}}, pp. {{page.pages}}
  </div>
  Presented at [Expressive 2017](https://expressivesymposium.com/)
  <div class="doi">DOI: [10.1145/3092919.3092928](http://dx.doi.org/10.1145/3092919.3092928)
  </div>
</div>

{% include responsive-embed url="https://player.vimeo.com/video/227687612/?title=0&byline=0&portrait=0" ratio="16:9" %}

## Abstract
<div class="abstract">
_We investigate characteristic edge- and substrate-based effects for watercolor stylization. These two fundamental elements of painted art play a significant role in traditional watercolors and highly influence the pigment's behavior and application. Yet a detailed consideration of these specific elements for the stylization of 3D scenes has not been attempted before. Through this investigation, we contribute to the field by presenting ways to emulate two novel effects: dry-brush and gaps & overlaps. By doing so, we also found ways to improve upon well-studied watercolor effects such as edge-darkening and substrate granulation. Finally, we integrated controllable external lighting influences over the watercolorized result, together with other previously researched watercolor effects. These effects are combined through a direct stylization pipeline to produce sophisticated watercolor imagery, which retains spatial coherence in object-space and is locally controllable in real-time._
</div>

## Expressive Presentation
{% include responsive-embed url="https://prezi.com/embed/6pynxbjldfkr/" ratio="16:9" %}


## BibTeX
    {% raw %}
    @InProceedings{Montesdeoca:2017:EAS,
      author    = {Montesdeoca, Santiago E. and Seah, Hock Soon and B{\'e}nard, Pierre and Vergne, Romain and Thollot, Jo\"{e}lle and Rall, Hans-Martin and Benvenuti, Davide},
      title     = {Edge- and Substrate-Based Effects for Watercolor Stylization},
      doi       = {10.1145/3092919.3092928},
      booktitle = {Expressive '17: The Joint Symposium on Computational Aesthetics and Sketch Based Interfaces and Modeling and Non-Photorealistic Animation and Rendering},
      isbn      = {978-1-4503-5081-5},
      location  = {Los Angeles, California},
      year      = {2017},
      series    = {NPAR '17},
      pages     = {2:1-2:10},
      articleno = {2},
      numpages  = {10},
      publisher = {ACM},
      address = {New York, NY, USA},
    {% endraw %}


## Downloads
* [Paper](https://dl.acm.org/authorize?N658384)
* [Implementation](/software/Maya-NPR/)
