---
layout: documentation
title: Cutout style
type: Docs
excerpt: Understanding all effects involved in the cutout style
tags: [Docs, MNPRX]
comments: true
schema:
---

## Cutout

The _Cutout_ style simulates a _paper cutout_ effect with two sheets of paper on top of each other. 
The top sheet is "cut-out" following the _cutout mask_, revealing the bottom sheet underneath. 
Through several attributes, the lighting can be adjusted globally to control the shadow cast by the top sheet on the bottom sheet.

<figure class="pull-center">
	<img src="/images/MNPRX/cutout/cutout.png" alt="Paper cutout rendering"  style="width: 600px">
	<figcaption>Example of paper cutout rendering.</figcaption>
</figure>

Note that this style is special in that it only shades the two sheets of paper and not the objects in the scene.

The cut-out mask is generated using a specific material: you need to set this material on all objects that need to be in the mask, otherwise they won't appear.
To set this material on an object, select an object and load the "cutout" material preset (see [material presets](../material-presets)).
{: .notice--warning}

### Cutout Material

The cutout material controls how objects affect the cutout mask and the paper color.

<figure class="pull-center">
	<img src="/images/MNPRX/cutout/material.png" alt="MNPRX cutout material node"  style="width: 400px">
	<figcaption>The cutout material in the Attribute Editor.</figcaption>
</figure>

- _Settings > Colored_: if checked, overrides the color of the substrate with the color specified in _Attributes > Shading > Color tint_

- _Attributes > Shading > Cut_: if checked, the object is drawn in the cutout mask, and appears cut-out in the final image. Otherwise, the object is not drawn in the mask. This is enabled by default.


### Substrate
The appearance of the top and bottom sheets of paper is controlled respectively by the _Main substrate_ and _Alternate substrate_ attribute sets. See [Substrate](../config#substrate) for a description of the attributes.
Additionally, the position of the drop shadow and bevel shade follows the direction of the substrate light defined by [Substrate Light Tilt](../config#substrate-light-tilt) and [Substrate Light Dir](../config#substrate-light-dir).

### Style attributes

These attributes specify the behavior of the cutout style.

- _Paper Distance_: distance between the two sheets. A longer distance will increase the offset of the drop shadow. 
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/cutout/paperDistance.mp4" type="video/mp4">
	</video>
	<figcaption>Varying paper distance between 2 and 20</figcaption>
</figure>

- _Drop Shadow Radius_: radius of the drop shadow in pixels. This is the shadow cast by the top sheet on the bottom sheet.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/cutout/dropShadow.mp4" type="video/mp4">
	</video>
	<figcaption>Varying drop shadow radius between 2 and 30</figcaption>
</figure>

- _Outer Bevel Radius_: radius of the outer bevel in pixels. The outer bevel simulates the paper curving near cut edges.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/cutout/outerBevel.mp4" type="video/mp4">
	</video>
	<figcaption>Varying outer bevel radius between 2 and 30</figcaption>
</figure>

- _Outer Bevel Highlight_: multiplier controlling the intensity of the highlight (paper curving towards the light) around outer bevels.  
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/cutout/outerBevelHighlight.mp4" type="video/mp4">
	</video>
	<figcaption>Varying outer bevel highlights between 0.0 and 3.0</figcaption>
</figure>

- _Outer Bevel Shadow_: multiplier controlling the intensity of the shadow (paper curving away from the light) around outer bevels.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/cutout/outerBevelShadow.mp4" type="video/mp4">
	</video>
	<figcaption>Varying outer bevel shadow between 0.0 and 3.0</figcaption>
</figure>

- _Gradient Shade_: defines the intensity of the gradient shading effect. The gradient shading is a light-to-dark gradient overlaid on the image and oriented towards the direction of the light. 
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/cutout/gradientShade.mp4" type="video/mp4">
	</video>
	<figcaption>Varying the intensity of the gradient shading effect. The gradient follows the direction of the substrate light.</figcaption>
</figure>

- _Paper Edge_: defines the intensity of the cut paper edge near the bevel shadow (cut edge facing the light). A value of zero means that the cut edge is invisible.

<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/cutout/paperEdge.mp4" type="video/mp4">
	</video>
	<figcaption>Varying paper edge intensity between 0 and 1</figcaption>
</figure>

- _Paper Edge Opposite_: defines the intensity of the cut paper edge near the bevel highlight (cut edge turning away from the light).

<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/cutout/paperEdgeOpposite.mp4" type="video/mp4">
	</video>
	<figcaption>Varying opposite paper edge intensity between 0 and 1</figcaption>
</figure>

- _Invert Mask_: If checked, the cut-out mask is inverted.

<figure class="pull-right">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/cutout/invertMask.mp4" type="video/mp4">
	</video>
	<figcaption>Inverting the cutout mask. Objects appear to be floating on top of the bottom substrate.</figcaption>
</figure>

{: .top2}
