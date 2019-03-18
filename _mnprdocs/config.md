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
	<img src="/images/MNPRX/config.png" alt="Style configuration node"  style="max-width: 400px">
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

**Documentation still in progress, rest is coming soon.**
{: .notice--warning}

## Style Attributes
Style attributes contain the attributes of the currently loaded stylization, in the case of the figure above: watercolor. These attributes allow to globally tweak the stylization parameters.

### Pigment Density
Defines the amount of pigment accumulated at the valleys of the paper, giving the render a more concentrated/darker look.

### Edge Darkening Intensity
sets the global strength of the edge darkening.

### Edge darkening Width
defines global width for edge darkening.
The rest of the attributes modify how some localized effects work, which will become relevant once we apply them in the scene. Let’s briefly introduce them:

### Bleeding Radius
controls how strong the bleeding effect can be.

### Drybrush Threshold
controls how sharp the drybrush application looks.

### Max Gaps Overlaps Width
controls the maximum pixel width considered by the gaps and overlaps effect.

-----------

## Substrate Attributes
Substrate attributes contain the attributes of the substrate where paint is applied on, be it paper or canvas

### Substrate Texture
lets you choose between different MNPR compatible substrate textures

### Substrate Texture Alt

### Substrate Blend

###	Substrate Scale
defines the size of the texture

### Substrate Tile Blend

### Substrate Tile

###	Substrate Roughness
controls the overall roughness of the substrate

###	Substrate Distortion
controls the distortion caused by the roughness of the substrate.

### Substrate Color
defines the color of the substrate

###	Substrate Shading
lets you decide the amount of diffuse shading of the substrate

###	Substrate Light Dir
defines the side where the light is shining from. 0 degrees is from the bottom, 90 degrees is from the left, 180 degrees from the top and 270 degrees is from the right.

###	Substrate Light Tilt
defines the tilt angle of the light in relation to the substrate, 90 degrees is perpendicular to the substrate.


-----------

## Post Processing
Post Processing attributes contain simple but useful self-explanatory post-processing filters
*	Saturation
* Contrast
* Brightness


{% include toc-side %}
