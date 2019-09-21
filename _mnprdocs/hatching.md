---
layout: documentation
title: Hatching style
type: Docs
excerpt: Understanding all effects involved in the cutout style
tags: [Docs, MNPRX]
comments: true
schema:
---

## Hatching (alpha version)

The _Hatching_ style strives to reproduce the artistic shading technique of the same name that uses fine, tightly-packed lines to depict shading on objects.
These lines are oriented in a way that follows the direction of the shading.

The motion of the lines stays coherent with the motion of the underlying object.
However, the lines themselves are drawn in image space, which makes them 
unaffected by perspective deformation. This avoids the "synthetic" look of 
other approaches that rely on texture mapping to achieve a hatching effect.

Furthermore, the style also incorporates a _fractalization_ pass that ensures that the density of the lines stays constant when zooming in and out of an object.

This style is experimental, is likely to contain bugs, and should not be considered production-quality at the moment. 
However, you are highly encouraged to try it out on your scenes, push it to its limits, use it in weird and unexpected ways, break it, and send us feedback or suggestions about what you would like to see.
{: .notice--info}


The _hatching_ style requires its own specific material: to set this material on an object, select an object and load the "hatching" material preset (see [material presets](../material-presets)).

<figure class="pull-center">
	<img src="/images/MNPRX/HG/hatching.png" alt="Hatching style"  style="width: 600px">
	<figcaption>Example of hatching style rendering.</figcaption>
</figure>

The appearance of the hatching lines can be controlled though several material and style attributes that are described in the following sections.

Due to limitations of the ShaderFX framework, you have to manually set the rendering resolution in the _Screen Width_ and _Screen Height_ material parameters. 
{: .notice--warning}

------------------------
------------------------

## Style attributes

These attributes specify the behavior of the hatching style.

### Length
Length of the hatching lines. If set to zero, produces a stippling effect.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/HG/length.mp4" type="video/mp4">
	</video>
	<figcaption>Varying length between 0 and 40</figcaption>
</figure>

### Width
Average width (thickness) of the hatching lines in pixels. A width of zero is invisible.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/HG/width.mp4" type="video/mp4">
	</video>
	<figcaption>Varying width between 0 and 6</figcaption>
</figure>

### Gradient
Controls the extent of the diffuse lighting gradient. A value of zero results in a binary shading style.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/HG/wrap.mp4" type="video/mp4">
	</video>
	<figcaption>Varying gradient between 0 and 2</figcaption>
</figure>

### Smoothness
Smoothes the vector field used to orient the hatching lines. Higher values produce less abrupt changes in orientation.  
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/HG/smoothness.mp4" type="video/mp4">
	</video>
	<figcaption>Varying smoothness between 1 and 5</figcaption>
</figure>


------------------------
------------------------

## Hatching Material

This section describes the per-material attributes specific to the _hatching_ material. 
Note that this material inherits from most of the attributes of the _uber_ material, which control the backdrop of the hatching lines. See [uber](../uber) for a description of those attributes. 

#### Hatching > Density Scale
Controls the overall density of the hatching lines.

<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/HG/density.mp4" style="width:300px" type="video/mp4">
	</video>
	<figcaption>Varying density scale between 10 and 200</figcaption>
</figure>

#### Hatching > Dynamic Noise
If checked, enables the _fractalization_ pass that ensures a constant line density regardless of camera position and zoom. This sometimes produces a slight "blending effect" when moving, so this can be disabled if your shot keeps the object at the same camera distance and zoom level.

<div class="pull-center">
<figure style="display:inline-block;">
 <video autoplay loop muted playsinline style="width:300px">
   <source src="/images/MNPRX/HG/fract_on.mp4" type="video/mp4">
 </video>
 <figcaption>Dynamic noise enabled.</figcaption>
</figure>
<figure style="display:inline-block;">
 <video autoplay loop muted playsinline style="width:300px">
   <source src="/images/MNPRX/HG/fract_off.mp4" type="video/mp4">
 </video>
 <figcaption>Dynamic noise disabled.</figcaption>
</figure>
</div>

#### Hatching > Screen Width and Hatching > Screen Height
These must be set to match your rendering resolution, in pixels.

------------------------
------------------------

## Art-direction
The width and the local orientation of the hatching lines can be art-directed procedurally with noiseFX and/or locally by painting with paintFX. See [noiseFX](../noiseFX) and [paintFX](../paintFX) for usage information.
 
<figure class="pull-center">
	<img src="/images/MNPRX/HG/noiseFX.png" alt="MNPRX noiseFX window"  style="width: 400px">
	<figcaption>Art-directable parameters of the hatching style.</figcaption>
</figure>

{: .top2}

