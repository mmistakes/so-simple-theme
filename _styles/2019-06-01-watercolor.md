---
layout: publication
categories: projects
title: Watercolor Stylization
tile-caption: Watercolor in 3D
authors: Montesdeoca S. E.
type: Project
excerpt: "Non-photorealistic 3D rendering in a watercolor style, powered by MNPRX."
year: 2015-current
tags: [MNPR, NPR, stylization, Real-time, Watercolor, Art-directed, Research, Maya, Software]
image:
  header: images/headers/watercolor.jpg
  caption: "Montesdeoca et al. - Henry model © Oculus Story Studio"
  path: images/cards/watercolor.jpg
  thumbnail: images/tiles/watercolor.png
comments: true
share: true
schema: SoftwareApplication
redirect_from:
  - /projects/Maya-Watercolor/
  - /projects/watercolor/
---

The _Watercolor Stylization_ brings real-time watercolor to 3D objects and animation within _Autodesk Maya_!
{: .pull-center}

<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/WC/showcase.mp4" type="video/mp4">
	</video>
	<figcaption>3D Watercolor animation in real-time.</figcaption>
</figure>

The _Watercolor_ style emulates the **traditional watercolor animation** aesthetic, without the usual flickering associated with when showing multiple watercolor paintings in sequence. Based on the award-winning research of Montesdeoca et al. and Bousseau et al., we are continuously improving upon it with new effects and controls.

<figure class="example-pull-right">
 <video autoplay loop muted playsinline style="max-width:300px">
   <source src="/images/MNPRX/art-direction/spherebot.mp4" type="video/mp4">
 </video>
 <figcaption>The Spherebot in a watercolor style, 3D model by Bastien Genbrugge</figcaption>
</figure>

### Main Features
* Pigment-based effects such as **pigment turbulence and bleeding**
* Edge-based effects such as **edge darkening and gaps & overlaps**
* Substrate-based effects such as **paper granulation and distortion**
* Substrate can be attached to the underlying motion
* Use PaintFX and NoiseFX to **attach effects** onto the animation
* Use proxies to **control the style with invisible objects**
* The stylization is also **available in Nuke** for Indie/Studio subscribers to add the watercolor style to offline renders (i.e., Arnold, Renderman)

The style can be **[art-directed](/software/MNPRX/docs/art-direction/)** at each level of control with **[MNPRX](/software/MNPRX/)** and its **[uber material](/software/MNPRX/docs/uber/)**.

<figure class="align-center">
	<a href="/software/MNPRX/#getit"><img src="/images/buttons/mnprx_getIt.jpg" alt="image"></a>
</figure>

### Featured examples

<div class="flex-third">

<figure>
{% include responsive-embed url="https://player.vimeo.com/video/370400489?loop=1&title=0&byline=0&portrait=0" ratio="16:9" %}
 <figcaption>Personal work by Miguel Ramos Carretero</figcaption>
</figure>

<figure>
{% include responsive-embed url="https://www.youtube-nocookie.com/embed/mZQoIKaKuLA?rel=0" ratio="16:9" %}
 <figcaption>Student work by Ray Sober</figcaption>
</figure>

<figure>
{% include responsive-embed url="https://player.vimeo.com/video/274818189?loop=1&title=0&byline=0&portrait=0" ratio="16:9" %}
 <figcaption>Award-winning research by Montesdeoca et al.</figcaption>
</figure>

</div>

------------------------
------------------------

## Style attributes

To refine and customize the watercolor style, a series of global watercolor attributes are provided within the [style configuration node](/software/MNPRX/docs/config#style-attributes).

<figure class="pull-center">
 <img src="/images/MNPRX/WC/style-attrs.png" alt="Style attributes"  style="width: 600px">
 <figcaption>Style attributes in the configuration node</figcaption>
</figure>

### Pigment Density
The concentration of pigments, giving the render either a diluted or a more saturated and darker look.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/WC/pigment-density.mp4" type="video/mp4">
	</video>
	<figcaption>Pigment Density between 0.5 and 2.</figcaption>
</figure>

### Paper Granulation
The accumulation of pigments on the valleys of the paper (substrate). Concentrates the pigments on the valleys and creates a more saturated and darker look.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/WC/paper-granulation.mp4" type="video/mp4">
	</video>
	<figcaption>Paper Granulation between -1 and 5.</figcaption>
</figure>

---

### Edge Darkening
* **Simple** - Simple control over edges defined by the colors and depth.
* **Advanced** - Advanced control over edges defined by lightness, chromacity and depth. We recommend working with this for more faithful results.

### Edge Darkening Intensity
Strength of the edge darkening effect. A higher intensity will concentrate more color on the edges.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/WC/edge-intensity.mp4" type="video/mp4">
	</video>
	<figcaption>Edge Darkening Intensity between 0 and 3.</figcaption>
</figure>

### Edge Darkening Width
Width for the edge darkening effect. Note: A wider edge darkening will require an increase in intensity, as well.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/WC/edge-width.mp4" type="video/mp4">
	</video>
	<figcaption>Edge Darkening Width between 0 and 30.</figcaption>
</figure>

---

### Bleeding Radius
Maximum width for the bleeding effect. Pushing this too far might affect performance.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/WC/bleeding-radius.mp4" type="video/mp4">
	</video>
	<figcaption>Bleeding radius between 1 and 40.</figcaption>
</figure>

### Drybrush Threshold
Sharpness of the drybrush application.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/WC/drybrush-threshold.mp4" type="video/mp4">
	</video>
	<figcaption>Drybrush Threshold between 0 and 20.</figcaption>
</figure>

### Drybrush Color
Color of the drybrush application.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/WC/drybrush-color.mp4" type="video/mp4">
	</video>
	<figcaption>Different drybrush colors.</figcaption>
</figure>

### Max Gaps Overlaps Width
Maximum width of the gaps & overlaps effect.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/WC/gaps-overlaps.mp4" type="video/mp4">
	</video>
	<figcaption>Gaps and overlaps width between 1 and 5.</figcaption>
</figure>
