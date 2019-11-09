---
layout: publication
categories: projects
title: Watercolor Stylization
no-tile-title: true
authors: Montesdeoca S. E.
type: Project
excerpt: Watercolor in 3D
year: 2015-current
tags: [MNPR, NPR, stylization, Real-time, Watercolor, Art-directed, Research, Maya, Software]
image:
  path: images/headers/watercolor.jpg
  caption: "Henry © Oculus Story Studio"
  card: images/cards/watercolor.jpg
  thumbnail: images/tiles/watercolor.png
comments: true
share: true
schema: SoftwareApplication
redirect_from:
  - /projects/Maya-Watercolor/
  - /projects/watercolor/
---


The Watercolor Stylization brings real-time watercolor rendering of 3D objects and animation directly within _Autodesk Maya_ through [**MNPRX**](../MNPRX).

### Pigment Density
Defines the global concentration of pigments placed over a substrate, giving the render a more saturated and darker look.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/WC/pigment-density.mp4" type="video/mp4">
	</video>
	<figcaption>Pigment Density between 0 and 20.</figcaption>
</figure>

### Edge Darkening Intensity
Defines the global strength of the edge darkening effect.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/WC/edge-intensity.mp4" type="video/mp4">
	</video>
	<figcaption>Edge Darkening Intensity between 0 and 3.</figcaption>
</figure>

### Edge Darkening Width
Defines the global width for the edge darkening effect.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/WC/edge-width.mp4" type="video/mp4">
	</video>
	<figcaption>Edge Darkening Width between 0 and 10.</figcaption>
</figure>

Make sure to also increase the _Edge Darkening Intensity_ attribute with wide edges, as wider edges dilute pigmentation.
{: .notice--info}

### Bleeding Radius
Defines the maximum global width for the bleeding effects.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/WC/bleeding-radius.mp4" type="video/mp4">
	</video>
	<figcaption>Bleeding radius between 0 and 20.</figcaption>
</figure>

### Drybrush Threshold
Defines the global sharpness of the drybrush application.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/WC/drybrush-threshold.mp4" type="video/mp4">
	</video>
	<figcaption>Drybrush Threshold between 0 and 20.</figcaption>
</figure>

### Max Gaps Overlaps Width
Defines the maximum global width of the gaps & overlaps effect.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/WC/gaps-overlaps.mp4" type="video/mp4">
	</video>
	<figcaption>Drybrush Threshold between 0 and 5.</figcaption>
</figure>



It is the first watercolor stylization pipeline of [MNPR](../Maya-NPR) based on algorithms algorithms found in:

* [Art-directed Watercolor Rendered Animation](/articles/Art-directed-Watercolor-Rendered-Animation)
* [Art-directed Watercolor Stylization of 3D Animations in Real-time](/articles/Art-directed-watercolor-stylization-of-3D-animations-in-real-time)
* [Edge- and substrate-based effects for watercolor stylization](/articles/Edge-and-substrate-based-effects-for-watercolor-stylization/)

For visual results, please visit the individual publication posts.

The style is included for **[free in MNPR](../Maya-NPR)** and has been further refined in [MNPRX](/software/MNPRX) for different production requirements.

------------------------

## Features
* Watercolor materials
* Pigment turbulence
* Granulation & dry-brush
* Edge darkening (control over width and intensity)
* Gaps & Overlaps
* Substrate distortion
* Color bleeding (Wet-in-Wet)
