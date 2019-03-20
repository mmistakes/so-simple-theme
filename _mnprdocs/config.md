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

<figure class="align-right">
	<img src="/images/MNPRX/config.png" alt="Style configuration node"  style="width: 400px">
	<figcaption>The configuration node showing all watercolor stylization attributes.</figcaption>
</figure>

## Engine Settings
Engine settings remain the same across stylizations and contain attributes directly related to the MNPRX engine. These attributes can change the fidelity and performance of the stylization.

### Color Depth
Defines the color depth of the render targets. This generally translates to: higher is better. However, slower systems should consider using 8bit targets if the performance is too slow, provided you can sacrifice some color fidelity.

### Render Scale
Defines the resolution at which MNPR is rendering.
* _Half_ will render at half the size, which will perform faster with slower computers, at the cost of pixilation.
* _Normal_ will render at the normal viewport resolution.
* _Double_ will render at twice the size and then reduce the rendered image to fit the viewport. You will have more detail and less aliasing, but make sure to have a powerful computer.

{% include aio-hint.html %}You will get better antialiasing and more detail by using the _Render Scale_ attribute instead of _Antialiasing_.

### Antialiasing
Defines the algorithm used to perform antialiasing. Antialiasing makes edges appear smoother and less pixelated, you can find more about what aliasing is [here](https://www.youtube.com/watch?v=hqi0114mwtY)
<figure class="pull-center half">
	<img src="/images/MNPRX/AA1.png" alt="Close-up without antialiasing" style="max-width: 150px">
	<img src="/images/MNPRX/AA2.png" alt="Close-up with antialiasing" style="max-width: 150px">
	<figcaption>Close-up of image without and with FXAA antialiasing.</figcaption>
</figure>

### World Scale
Defines how many _Maya_ units is considered one meter/cm (normal/miniature) in the virtual world. Since most projects work with assets at different scales, setting up the _World Scale_ right will help the stylization behave correctly.

If your character is supposed to be one meter high in his world, but is actually 5 units high in _Maya_, the _World Scale_ attribute should be set to 5.
{: .notice--info}

### Velocity PV
Enables the calculation of motion vectors of each object in the scene (per vertex). This helps certain effects to remain motion coherent and avoid the _shower door effect_, albeit with a substantial performance cost. Therefore, this attribute should be activated mainly when rendering the final frames.

<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/motion-coherence.mp4" type="video/mp4">
	</video>
	<figcaption>Visualization of motion coherence.</figcaption>
</figure>

{% include aio-hint.html %} Big amounts of motion will distort substrate-based effects. It is recommended to refresh the substrate with the _Substrate Tile_ attribute once in a while to reset the substrate texture.

### Atmosphere Tint
Defines a custom atmospheric perspective color, making things at distance tint towards the specified color.

### Atmosphere Range
Defines the range at which the atmospheric tint will start and end.

The units work as meter/cm, so keep the  _World Scale_ in mind when setting up this attribute.
{: .notice--info}

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


## Substrate Attributes
Substrate attributes contain the attributes of the texture where paint is applied on, be it paper or canvas. Altering these attributes will affect all effects that depend on the substrate for its stylization.

### Substrate Texture
Defines the primary texture that is going to be used as the substrate. There is currently a [library](https://researchdata.ntu.edu.sg/dataset.xhtml?persistentId=doi:10.21979/N9/HI7GT7) of 10 different substrate textures to choose from. To create your own substrate textures, compatible with MNPRX, [check out this tutorial](https://mnpr.artineering.io/substrates/extraction-tutorial).

### Substrate Texture Alt
Defines the alternative texture that is going to be used as the substrate.

### Substrate Blend
Defines the blending between the _Substrate Texture_ and the _Substrate Texture Alt_, allowing you to combine profile properties of different substrates.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/substrate/substrate-blend.mp4" type="video/mp4">
	</video>
	<figcaption>Blending between the Substrate Texture (default) and the Substrate Texture Alt (canvas).</figcaption>
</figure>

###	Substrate Scale
Defines the scale of the substrate texture. A _Substrate Scale_ of `1` will show the texture at its original size, whereas a _Substrate Scale_ of `2` would make it twice as big.

### Substrate Tile Blend
Enables to smoothly blend two substrate tiles. That means that the _Substrate Tile_ attribute will smoothly blend the tiles e.g., a _Substrate Tile_ attribute of `1.5` will be a blend of the tile at 1.0 and the tile at 2.0.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/substrate/substrate-tile-blend.mp4" type="video/mp4">
	</video>
	<figcaption>Blending between Substrate Tile 1.0 and Substrate Tile 2.0.</figcaption>
</figure>

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

###	Substrate Distortion
Defines the global amount of distortion caused by the _Substrate Roughness_.

### Substrate Color
Defines the color of the substrate.

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

-----------

## Post Processing
Post Processing attributes contain simple but useful self-explanatory post-processing filters
*	Saturation
* Contrast
* Brightness


{% include toc-side %}
