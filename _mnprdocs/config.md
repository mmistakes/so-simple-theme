---
layout: documentation
title: Configuration Node
type: Docs
excerpt: Configuring the style within MNPRX
tags: [Docs, MNPRX]
comments: true
search: true
schema:
redirect_from:
  - /projects/MNPRX/docs/config/
---

The style configuration node gets selected when clicking on the `conf` icon in the _[MNPRX shelf](../shelf)_ and looks somewhat similar to the figure below---depending on the active stylization. The node contains every global parameter available in the active stylization and each value is applied over the entire image.
{: .top2}

It is imperative to understand what each attribute does and how it affects the stylization, but it is also fun to simply experiment with them and make happy accidents. The attributes in the style configuration node are separated into six groups.

-------------

<figure class="pull-right">
	<img src="/images/MNPRX/config.png" alt="Style configuration node"  style="max-width: 400px">
	<figcaption>The configuration node showing all watercolor stylization attributes.</figcaption>
</figure>

## Engine
Engine attributes remain the same across stylizations and contain attributes directly related to the MNPRX engine. These attributes can change the fidelity and performance of the stylization.

### Style
Defines the style that MNPRX is currently running in.
* *Viewport+* - A viewport override with all the advantages of MNPRX
* [*Watercolor*](/styles/watercolor/) - The classic watercolor stylization that MNPRX is known for
* [*Cutout*](/styles/cutout/) - Cutout stylization within MNPRX
* [*Hatching*](/styles/hatching/) - Hatching and stippling stylization within MNPRX
* [*Frayed*](/styles/frayed/) - Frayed edges stylization within MNPRX

We are working on opening up the stylization pipeline to support many more styles, including your own!

### Quality
Defines the quality of the viewport rendering.
* _Half_ - Render at half the resolution, which will perform faster with slower computers, at the cost of pixelation.
* _Standard_ - Render at the normal resolution, without any bells and whistles.
* _FXAA_ - Render at the normal resolution with _Fast Approximate Anti-Aliasing_, giving results with less jaggies (staircase effect).
* _4x SSAA_ - Render at 4 times the normal resolution, to later bring it back to the normal resolution with _Super Sampling Anti-Aliasing_. You have much more detail and less jaggies (staircase effect).
* _TAA_ - Renders many images at normal resolution with _Temporal Anti-Aliasing_ to perform progressive, super-sampled results. You will have more detail and **NO** jaggies (staircase effect). Enabling TAA will also show a _TAA Samples_ attribute directly underneath. Within this attribute, you can define the amount of image samples that the _TAA_ quality uses to create the final result.

Anti-aliasing makes edges appear smoother and less pixelated, you can find more about what aliasing is [here](https://www.youtube.com/watch?v=hqi0114mwtY).

<figure class="pull-center half" style="max-width:700px">
	<img src="/images/MNPRX/AA1.png" alt="Close-up without antialiasing" style="max-width: 150px">
	<img src="/images/MNPRX/AA2.png" alt="Close-up with antialiasing" style="max-width: 150px">
	<figcaption>Close-up of image at Standard quality and with FXAA quality.</figcaption>
</figure>

### Color Depth
Defines the color depth of most render targets. This generally translates to: higher is better. However, slower systems should consider using 8bit targets if the performance is too slow, provided you can sacrifice some color fidelity.

### Velocity PV
Enables the calculation of motion vectors of each object in the scene (per vertex). This helps certain effects to remain motion coherent and avoid the _shower door effect_, albeit with a substantial performance cost. Therefore, this attribute should be activated mainly when rendering the final frames.

<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/motion-coherence.mp4" type="video/mp4">
	</video>
	<figcaption>Visualization of motion coherence.</figcaption>
</figure>

Velocity PV does **NOT** work with subdivided previews (`3` on the keyboard), as vertices won't be in the same place. Having both active will also make the scene much slower. Consider subdividing the necessary object with normal geometry instead.
{: .notice--warning}

{% include aio-hint.html %} Big amounts of motion will distort canvas-based effects. It is recommended to refresh the canvas with the _Canvas Tile_ attribute once in a while to reset the texture or use _Canvas Advection_ with _Canvas Regeneration_ to attach the texture to the underlaying motion.

-----------
-----------

## General
General attributes concern all stylizations and contain general attributes that change the overall result.

### World Scale
Defines how many _Maya_ units is considered one meter/cm (normal/miniature) in the virtual world. Since most projects work with assets at different scales, setting up the _World Scale_ right will help the stylization behave correctly.

{% include aio-hint.html %} Example: if your character is supposed to be one meter high in his world, but is actually 5 units high in _Maya_, the _World Scale_ attribute should be set to 5.

### Atmosphere Tint
Defines a custom atmospheric perspective color, making things at distance tint towards the specified color.

### Atmosphere Range
Defines the range at which the atmospheric tint will start and end.

The units work as meter/cm, so keep the  _World Scale_ in mind when setting up this attribute.
{: .notice--info}

### Effect Focal Range
Creates the effect focal range locators in the scene. These locators allow you to define the center of interest and an effect factor at the front and back. Based on these factors, effects like the watercolor bleeding will be reduced or increased at different distances from the effect focal point.

These locators can also be constrained/parented to a camera to have the front and back factors relative to the distance to the camera.

-----------
-----------

## Ambient Occlusion

Ambient Occlusion (AO) darkens the image in areas that are hard to reach for the ambient light due to the local shape of the geometry (e.g. concavities, crevices, holes). Note that this effect depends only on the geometry (and the viewpoint, to a lesser extent), and not on the lights present in the scene.

MNPRX currently uses a screen-space implementation of ambient occlusion based on the _Ground-Truth Ambient Occlusion_ algorithm (GTAO).
{: .notice--info}

### AO Blend Mode
Defines how the computed ambient occlusion term is applied on the final image.
* _None_: AO is not applied.
* _Multiply_: the AO term is multiplied over the image after canvas effects and before the final post-processing steps.
* _Color Burn_: same as above, except that the AO term is blended over the image using the _Color Burn_ blending mode.
* _Style-specific_: AO is applied by the current style. The effect depends on the currently selected style.
	* With the _Watercolor_ and _Frayed_ style, the AO term modulates the _pigment density_, resulting in darker colors in occluded areas.
	* In _Viewport+_ mode, this option has no effect: choose one of the other options.  

### AO Radius
Defines the radius used by the ambient occlusion filter: larger radii result in larger darkened areas.

### AO Strength
Defines the strength of ambient occlusion: higher values make the ambient occlusion term darker.

-----------
-----------

## Bloom
Bloom is an effect that spreads light from the borders of bright areas in the rendered image, resembling overwhelming light being captured.

### Bloom Intensity
Defines the intensity of the bloom effect.

### Bloom Size
Defines the threshold at which a pixel is bright enough to be considered for the bloom effect.

### Bloom Blur
The amount the bloom effect spreads along the image.

-----------
-----------

## Style Attributes
Style attributes contain the attributes of the currently loaded stylization, in the case of the figure above: watercolor. These attributes allow to globally tweak the stylization parameters and are documented for each style.

* [Watercolor](/styles/watercolor/#style-attributes)
* [Cutout](/styles/cutout/#style-attributes)
* [Hatching](/styles/hatching/#style-attributes)
* [Frayed](/styles/frayed/#style-attributes)

-----------
-----------

## Canvas
Canvas attributes contain the attributes of the texture where paint is applied on, be it paper or canvas. Altering these attributes will affect all effects that depend on the canvas for its stylization.

### Canvas Synthesis
Defines if an infinite canvas should be created from the given texture. Infinite canvases are completely seamless and can be generated from any heightmap texture within the `textures` folder of MNPRX.

###	Canvas Distortion
Defines the global amount of distortion caused by the _Canvas Roughness_.

### Canvas Blend
Defines the blending between the _Canvas Texture_ (_Main Canvas_ group) and the _Canvas Texture Alt_ (_Alternate Canvas_ group), allowing you to combine profile properties of different canvases.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/canvas/canvas-blend.mp4" type="video/mp4">
	</video>
	<figcaption>Blending between the Canvas Texture (default) and the Canvas Texture Alt (canvas).</figcaption>
</figure>

###	Canvas Light Dir.
Defines the side where the external light is shining from. `0` degrees is from the bottom, `90` degrees is from the left, `180` degrees from the top and `270` degrees is from the right.

<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/canvas/canvas-light-dir.mp4" type="video/mp4">
	</video>
	<figcaption>Canvas Light Dir between 0 and 359.0.</figcaption>
</figure>

The effect of this attribute can only be seen if _Canvas Shading_ is more than `0`.
{: .notice--warning}

###	Canvas Light Tilt
Defines the tilt angle of the external light in relation to the canvas, 90 degrees is perpendicular to the canvas.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/canvas/canvas-light-tilt.mp4" type="video/mp4">
	</video>
	<figcaption>Canvas Light Tilt between 30.0 and 60.0.</figcaption>
</figure>

The effect of this attribute can only be seen if _Canvas Shading_ is more than `0`.
{: .notice--warning}

### Canvas Position X
Defines how much the canvas should be panned horizontally.

### Canvas Position Y
Defines how much the canvas should be panned vertically.

---

## Advection
Advection attaches the canvas to the undelaying animation, reducing the _shower door_ effect commonly known in non-photorealistic rendering when the canvas appears to float above the animation.  
This group is closed by default, but can be opened by clicking on it.

### Canvas Advection
Enables/Disables canvas advection in the scene.

### Canvas Regeneration
Defines the speed of regeneration in seconds for distorted canvases.

Advection can only be seen if the _VelocityPV_ attribute is checked and the animation is playing.
{: .notice--warning}

---

## Main Canvas
Contains the attributes that define the main canvas texture of the stylization.

### Canvas Texture
Defines the main texture that is going to be used as the canvas. MNPRX comes with more than 10 different canvas heightmaps to choose from. You can load any heightmap, as long as they are in the `textures` folder within MNPRX.

{% include aio-hint.html %} The _Canvas Synthesis_ attribute will automatically make an infinite canvas of any heightmap texture. Feel free to add your own textures and experiment with different canvas blends.

### Canvas Color
Defines the color of the canvas.

###	Canvas Scale
Defines the linear scale of the canvas texture.

### Canvas Rotation
Defines the rotation in degrees of the canvas texture. The center of the viewport is used as the rotation pivot.

###	Canvas Roughness
Defines the global roughness of the canvas.

<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/canvas/canvas-roughness.mp4" type="video/mp4">
	</video>
	<figcaption>Roughness between 0 and 5.0.</figcaption>
</figure>

_Canvas Roughness_ will affect **all** canvas-based effects.
{: .notice--warning}

###	Canvas Shading
Defines the amount of external diffuse shading of the canvas.

<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/canvas/canvas-shading.mp4" type="video/mp4">
	</video>
	<figcaption>Canvas Shading between 1.0 and 0.</figcaption>
</figure>

The shading is caused by the _Canvas Light Dir_ and _Canvas Light Tilt_ attributes.
{: .notice--info}

### Canvas Tile
Loads a new canvas tile at every round number i.e., `1.0`, `2.0`, `3.0`.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/canvas/canvas-tile.mp4" type="video/mp4">
	</video>
	<figcaption>Switching between Canvas Tile 1.0 and Canvas Tile 2.0, without Canvas Tile Blend.</figcaption>
</figure>

Loading a new _Canvas Tile_ will present a new texture pattern and reset every canvas-dependent effect.
{: .notice--info}

### Canvas Tile Blend
Enables to smoothly blend two canvas tiles. That means that the _Canvas Tile_ attribute will smoothly blend the tiles e.g., a _Canvas Tile_ attribute of `1.5` will be a blend of the tile at 1.0 and the tile at 2.0.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/canvas/canvas-tile-blend.mp4" type="video/mp4">
	</video>
	<figcaption>Blending between Canvas Tile 1.0 and Canvas Tile 2.0.</figcaption>
</figure>

---

## Alternate Canvas
Contains the attributes that control the alternate canvas texture of the stylization, for styles that make use of two canvas textures. Control of this canvas is independent from the main canvas.
This group is closed by default, but can be opened by clicking on it.
The attributes are the same as the main canvas: see above for the corresponding documentation.

The alternate canvas is used if the _Canvas Blend_ option is not 0, and also in a style-dependent manner (e.g. cutout).
{: .notice--info}

-----------
-----------

## Post Processing
Post Processing attributes contain simple but useful self-explanatory post-processing filters
*	Saturation
* Contrast
* Brightness

This group is closed by default, but can be opened by clicking on it.

{% include toc-side %}
