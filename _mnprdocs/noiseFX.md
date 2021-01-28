---
layout: documentation
title: NoiseFX
type: Docs
excerpt: Creating and customizing procedural effect parameters
tags: [Docs, MNPRX]
comments: true
schema:
redirect_from:
  - /projects/MNPRX/docs/noisefx/
---

_NoiseFX_ is a tool which grants [procedural control of effects](#showcase) at the material level of control. The tool can be opened by clicking on the **nFx** shelf icon and shares the same window with [_PaintFX_](../paintfx).
{: .top2}

<figure class="pull-right" style="margin-top:-1em; margin-bottom:0em">
	<img src="/images/MNPRX/FX/noiseFX.png" alt="NoiseFX tool window"  style="max-width: 300px">
	<figcaption>NoiseFX of the watercolor stylization.</figcaption>
</figure>

Each _MNPRX_ material supports _NoiseFX_, but the effects driven by _NoiseFX_ depend on the loaded style. To use _NoiseFX_ select an object with an _MNPRX_ material and modify the desired slider.


From top to bottom, these are the different elements of the NoiseFX tool.

<figure class="pull-left" style="margin: 0.5em 18px 0">
	<img src="/images/MNPRX/FX/viewPassive.png" alt="View NoiseFX"  style="max-height: 32px">
</figure>

On the top-left, you will find an eye icon which toggles the parameter view. This will allow you to observe the control parameters that you are currently affecting through the _Noise Widgets_.

On the top-right, you will find the `Bake 3D` button. This button toggles the `deformed` setting in the mnprx materials, baking the current 3D position of objects. Baking is especially useful to attach the current NoiseFX patterns to an animated/deformed object. If the 3D position is not baked, NoiseFX might seem to float in 3D space on animated objects, instead of moving with them.

## Noise Widgets
Each style has different effects, therefore, the noise widgets (sections) will vary depending on the currently loaded stylization. Each widget (section) handles a specific effect/behaviour within the style e.g., _Lighting_, _Pigment turbulence_, _Color bleeding_.

On the left side of each widget, you will find a term for the generalized behaviour of each effect. This is followed by a _Sphere_, visually showcasing what the behavior/effect does. Underneath the _Sphere_, you will find two buttons.

<figure class="pull-left" style="margin: 0.5em 18px 0">
	<img src="/images/MNPRX/FX/io.png" alt="NoiseFX toggle"  style="max-height: 32px">
</figure>

This button will toggle the _NoiseFX_ on/off to visualize the difference that the noise creates for the stylization.

<figure class="pull-left" style="margin-right: 4px">
	<img src="/images/MNPRX/FX/3D2D.png" alt="Noise type"  style="max-height: 32px">
</figure>

This button will toggle between 3D noise and 2D noise for the material.  
**Deprecated**: Only use 3D noise, and use the **Bake 3D** button to the top right to attach the 3D noise to animated objects.

## Modifying Noise
Modifying noise is quite simple, simply select the object with the material that you wish to modify and use one of the three relative sliders.

* **Scale** - The scale slider modifies the scale of the 3D/2D noise for the specified effect.
* **Noise** - The noise slider modifies the contrast (how strong it is) of the noise for the specified effect. Keep in mind that noise is composed out of positive and negative values and the contrast amplifies the noise in both directions.
* **Shift** - The shift slider is the vertical slider on the far right and shifts the noise towards the positive or negative values, accordingly.

Depending on the widget (see _Edge Manipulation_ widget), it may present different names for the _Noise_ slider, but they also just modify the contrast (how strong it is) of the noise for the specified effect.

The relative sliders activate and modify procedural attributes on each material, which can be found in the attribute editor to the right.

<figure class="align-center">
	<img src="/images/MNPRX/stylization-proc-AE.png" alt="Stylization (procedural) attributes"  style="width: 500px">
	<figcaption>Some procedural stylization attributes within the material, created through NoiseFX.</figcaption>
</figure>

### Resetting the Noise

<figure class="pull-left" style="margin: 0.5em 18px 0">
 <img src="/images/MNPRX/FX/reset.png" alt="Reset NoiseFX"  style="max-height: 32px">
</figure>

If you wish to reset all of these values and the _NoiseFX_ attributed to it, click on the icon at the top-right of the desired widget within the _NoiseFX_ window.


## Showcase

<figure class="pull-center">
 <video autoplay loop muted playsinline style="max-width:450px">
   <source src="/images/MNPRX/art-direction/noisefx.mp4" type="video/mp4">
 </video>
 <figcaption>Adding and modifying NoiseFX</figcaption>
</figure>


## FAQ
{% include faq/section.html file="noisefx.md" self-contained=true %}

{% include toc-side %}
