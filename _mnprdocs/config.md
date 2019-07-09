---
layout: documentation
title: Configuration Node
type: Docs
excerpt: Configuring the style within MNPRX
tags: [Docs, MNPRX]
comments: true
search: true
schema:
---

The style configuration node gets selected when clicking on the `conf` icon in the _[MNPRX shelf](../shelf)_ and looks somewhat similar to the figure below---depending on the active stylization. The node contains every global parameter available in the active stylization and each value is applied over the entire image. Therefore, it is imperative to understand what each attribute does and how it affects the stylization. The attributes in the style configuration node are separated into four groups.
{: .top2}

-------------

<figure class="pull-right">
	<img src="/images/MNPRX/config.png" alt="Style configuration node"  style="max-width: 400px">
	<figcaption>The configuration node showing all watercolor stylization attributes.</figcaption>
</figure>

## Engine
Engine attributes remain the same across stylizations and contain attributes directly related to the MNPRX engine. These attributes can change the fidelity and performance of the stylization.

### Style
Defines the style that MNPRX is currently running in.
* _Watercolor_ - The classic watercolor stylization that MNPRX is known for
* _Viewport+_ - A viewport override with all the advantages of MNPRX
* _Cutout_ - Cutout stylization within MNPRX

The more MNPRX matures, the more styles it will support!

### Quality
Defines the quality of the viewport rendering.
* _Half_ - Render at half the resolution, which will perform faster with slower computers, at the cost of pixelation.
* _Standard_ - Render at the normal resolution, without any bells and whistles.
* _FXAA_ - Render at the normal resolution with _Fast Approximate Anti-Aliasing_, giving results with less jaggies (staircase effect).
* _4x SSAA_ - Render at 4 times the normal resolution, to later bring it back to the normal resolution with _Super Sampling Anti-Aliasing_. You have much more detail and less jaggies (staircase effect).
* _TAA_ - Renders many images at normal resolution with _Temporal Anti-Aliasing_ to perform progressive, super-sampled results. You will have more detail and **NO** jaggies (staircase effect). Enabling TAA will also show a _TAA Samples_ attribute directly underneath. Within this attribute, you can define the amount of image samples that the _TAA_ quality uses to create the final result.

Anti-aliasing makes edges appear smoother and less pixelated, you can find more about what aliasing is [here](https://www.youtube.com/watch?v=hqi0114mwtY)
<figure class="pull-center half">
	<img src="/images/MNPRX/AA1.png" alt="Close-up without antialiasing" style="max-width: 150px">
	<img src="/images/MNPRX/AA2.png" alt="Close-up with antialiasing" style="max-width: 150px">
	<figcaption>Close-up of image at Standard quality and with FXAA quality.</figcaption>
</figure>

### Color Depth
Defines the color depth of the render targets. This generally translates to: higher is better. However, slower systems should consider using 8bit targets if the performance is too slow, provided you can sacrifice some color fidelity.

### Velocity PV
Enables the calculation of motion vectors of each object in the scene (per vertex). This helps certain effects to remain motion coherent and avoid the _shower door effect_, albeit with a substantial performance cost. Therefore, this attribute should be activated mainly when rendering the final frames.

<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/motion-coherence.mp4" type="video/mp4">
	</video>
	<figcaption>Visualization of motion coherence.</figcaption>
</figure>

{% include aio-hint.html %} Big amounts of motion will distort substrate-based effects. It is recommended to refresh the substrate with the _Substrate Tile_ attribute once in a while to reset the substrate texture.

---

## General
General attributes concern all stylizations and contain general attributes that change the overall result.

### World Scale
Defines how many _Maya_ units is considered one meter/cm (normal/miniature) in the virtual world. Since most projects work with assets at different scales, setting up the _World Scale_ right will help the stylization behave correctly.

If your character is supposed to be one meter high in his world, but is actually 5 units high in _Maya_, the _World Scale_ attribute should be set to 5.
{: .notice--info}

### Atmosphere Tint
Defines a custom atmospheric perspective color, making things at distance tint towards the specified color.

### Atmosphere Range
Defines the range at which the atmospheric tint will start and end.

The units work as meter/cm, so keep the  _World Scale_ in mind when setting up this attribute.
{: .notice--info}

-----------

## Ambient Occlusion {% include aio-new.html %}

Ambient Occlusion (AO) darkens the image in areas that are hard to reach for the ambient light due to the local shape of the geometry (e.g. concavities, crevices, holes). Note that this effect depends only on the geometry (and the viewpoint, to a lesser extent), and not on the lights present in the scene.

MNPRX currently uses a screen-space implementation of ambient occlusion based on the _Ground-Truth Ambient Occlusion_ algorithm (GTAO).
{: .notice--info}

### AO Blend Mode
Defines how the computed ambient occlusion term is applied on the final image.
* _None_: AO is not applied.
* _Multiply_: the AO term is multiplied over the image after substrate effects and before the final post-processing steps.
* _Color Burn_: same as above, except that the AO term is blended over the image using the _Color Burn_ blending mode.
* _Style-specific_: AO is applied by the current style. The effect depends on the currently selected style.
	* With the _Watercolor_ style, the AO term modulates the _pigment density_, resulting in darker colors in occluded areas.
	* In _Viewport+_ mode, this option has no effect: choose one of the other options.  

### AO Radius
Defines the radius used by the ambient occlusion filter: larger radii result in larger darkened areas.

### AO Strength
Defines the strength of ambient occlusion: higher values make the ambient occlusion term darker.

-----------


## Style Attributes
Style attributes contain the attributes of the currently loaded stylization, in the case of the figure above: watercolor. These attributes allow to globally tweak the stylization parameters.

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

-----------

## Cutout
See [Cutout style](../cutout).

-----------

## Substrate
Substrate attributes contain the attributes of the texture where paint is applied on, be it paper or canvas. Altering these attributes will affect all effects that depend on the substrate for its stylization.

###	Substrate Distortion
Defines the global amount of distortion caused by the _Substrate Roughness_.

### Substrate Blend
Defines the blending between the _Substrate Texture_ (_Main Substrate_ group) and the _Substrate Texture Alt_ (_Alternate Substrate_ group), allowing you to combine profile properties of different substrates.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/substrate/substrate-blend.mp4" type="video/mp4">
	</video>
	<figcaption>Blending between the Substrate Texture (default) and the Substrate Texture Alt (canvas).</figcaption>
</figure>

###	Substrate Light Dir.
Defines the side where the external light is shining from. `0` degrees is from the bottom, `90` degrees is from the left, `180` degrees from the top and `270` degrees is from the right.

<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/substrate/substrate-light-dir.mp4" type="video/mp4">
	</video>
	<figcaption>Substrate Light Dir between 0 and 359.0.</figcaption>
</figure>

The effect of this attribute can only be seen if _Substrate Shading_ is more than `0`.
{: .notice--warning}

###	Substrate Light Tilt
Defines the tilt angle of the external light in relation to the substrate, 90 degrees is perpendicular to the substrate.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/substrate/substrate-light-tilt.mp4" type="video/mp4">
	</video>
	<figcaption>Substrate Light Tilt between 30.0 and 60.0.</figcaption>
</figure>

The effect of this attribute can only be seen if _Substrate Shading_ is more than `0`.
{: .notice--warning}

## Main Substrate
Contains the attributes that define the main substrate texture of the stylization.

### Substrate Texture
Defines the main texture that is going to be used as the substrate. There is currently a [library](https://researchdata.ntu.edu.sg/dataset.xhtml?persistentId=doi:10.21979/N9/HI7GT7) of 10 different substrate textures to choose from. To create your own substrate textures, compatible with MNPRX, [check out this tutorial](https://mnpr.artineering.io/substrates/extraction-tutorial).

### Substrate Color
Defines the color of the substrate.

###	Substrate Scale
Defines the scale of the substrate texture. A _Substrate Scale_ of `1` will show the texture at its original size, whereas a _Substrate Scale_ of `2` would make it twice as big.

### Substrate Rotation
Defines the rotation in degrees of the substrate texture. The center of the viewport is used as the rotation pivot.

###	Substrate Roughness
Defines the global roughness of the substrate.

<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/substrate/substrate-roughness.mp4" type="video/mp4">
	</video>
	<figcaption>Roughness between 0 and 5.0.</figcaption>
</figure>

_Substrate Roughness_ will affect **all** substrate-based effects.
{: .notice--warning}

###	Substrate Shading
Defines the amount of external diffuse shading of the substrate.

<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/substrate/substrate-shading.mp4" type="video/mp4">
	</video>
	<figcaption>Substrate Shading between 1.0 and 0.</figcaption>
</figure>

The shading is caused by the _Substrate Light Dir_ and _Substrate Light Tilt_ attributes.
{: .notice--info}

### Substrate Tile
Loads a new substrate tile at every round number i.e., `1.0`, `2.0`, `3.0`.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/substrate/substrate-tile.mp4" type="video/mp4">
	</video>
	<figcaption>Switching between Substrate Tile 1.0 and Substrate Tile 2.0, without Substrate Tile Blend.</figcaption>
</figure>

Loading a new _Substrate Tile_ will present a new texture pattern and reset every substrate-dependent effect.
{: .notice--info}

### Substrate Tile Blend
Enables to smoothly blend two substrate tiles. That means that the _Substrate Tile_ attribute will smoothly blend the tiles e.g., a _Substrate Tile_ attribute of `1.5` will be a blend of the tile at 1.0 and the tile at 2.0.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/substrate/substrate-tile-blend.mp4" type="video/mp4">
	</video>
	<figcaption>Blending between Substrate Tile 1.0 and Substrate Tile 2.0.</figcaption>
</figure>

## Alternate Substrate
Contains the attributes that control the alternate substrate texture of the stylization, for effects that make use of two substrate textures. Control of this substrate is independent from the main substrate.
This group is closed by default, but can be opened by clicking on it.
The attributes are the same as the main substrate: see above for the corresponding documentation.

The alternate substrate is used if the _Substrate Blend_ option is not 0, and also in a style-dependent manner (e.g. cutout).
{: .notice--info}

-----------

## Post Processing
Post Processing attributes contain simple but useful self-explanatory post-processing filters
*	Saturation
* Contrast
* Brightness

This group is closed by default, but can be opened by clicking on it.

{% include toc-side %}
