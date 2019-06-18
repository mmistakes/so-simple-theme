---
layout: documentation
title: Art-direction
type: Docs
excerpt: Art-directing the style within MNRPX
tags: [Docs, MNPRX]
comments: true
schema:
---

MNPRX is all about art-direction and offering ways for artists to interactively control the 3D render towards their desired vision. Therefore, we offer 4 different levels of control, which help to control the stylization from the highest level of control (Style Presets) to the lowest level of control (PaintFX).
{: .top2}

<figure class="align-center">
	<img src="/images/MNPRX/art-direction/levels-of-control.svg" alt="Levels of Control" style="max-width:300px;">
	<figcaption>The MNPRX Toolbox contains a growing set of useful tools for production.</figcaption>
</figure>

## Style Presets and Attributes
At the top level of control are [_Style Presets_](../style-presets/) (`style` button in the [_MNPRX Shelf_](../shelf/)), which allow you to quickly change the style that MNPRX is currently running in.

<figure class="pull-center">
 <video autoplay loop muted playsinline style="max-width:450px">
   <source src="/images/MNPRX/art-direction/presets.mp4" type="video/mp4">
 </video>
 <figcaption>Switching between style presets</figcaption>
</figure>

_Style Presets_ contain and modify attributes from the style [_configuration node_](../conf/).

The style [_configuration node_](../conf/) (`conf` button in the [_MNPRX Shelf_](../shelf/)) contains every global parameter available in the active stylization. These parameters are applied over the entire image.

<figure class="pull-center">
 <video autoplay loop muted playsinline style="max-width:450px">
   <source src="/images/MNPRX/art-direction/global.mp4" type="video/mp4">
 </video>
 <figcaption>Modifying global controls through the configuration node</figcaption>
</figure>


## Material Presets and Attributes
At the middle level of control are [_Material Presets_](../material-presets/) (`mPre` button in the [_MNPRX Shelf_](../shelf/)), which allow you to quickly change the materials that are currently assigned to selected objects. If the material is shared between objects, it will modify the material for all objects (as seen in the video below). To avoid this, make sure to tick the `Create new material` for the selection. More information can be found in the [_Material Presets_](../material-presets/) documentation.

<figure class="pull-center">
 <video autoplay loop muted playsinline style="max-width:450px">
   <source src="/images/MNPRX/art-direction/material-presets.mp4" type="video/mp4">
 </video>
 <figcaption>Switching between material presets</figcaption>
</figure>

_Material Presets_ contain and modify attributes from the painterly [_Uber Materials_](../uber/) and [_Geoproxy Materials_](../proxy).

The painterly [_Uber Material_](../uber/) (loaded through the [_Material Presets_](../material-presets/) and selected by clicking on the `mat` button in the [_MNPRX Shelf_](../shelf/)) presents every material setting and parameter. These values are applied on all objects that share the same material.

<figure class="pull-center">
 <video autoplay loop muted playsinline style="max-width:450px">
   <source src="/images/MNPRX/art-direction/material.mp4" type="video/mp4">
 </video>
 <figcaption>Modifying material controls</figcaption>
</figure>

MNPRX materials can also drive stylization effects procedurally through the use of [_NoiseFX_](../noisefx/).


### NoiseFX
The [_NoiseFX_](../noisefx/) tool (`nFX` button in the [_MNPRX Shelf_](../shelf/)) allows to control effects procedurally at the material-level of control. To use it, select an object with an assigned painterly material and modify the sliders of the effects that you want to control in the _NoiseFX_ window. More information can be found in the [_NoiseFX_](../noisefx/) documentation.

<figure class="pull-center">
 <video autoplay loop muted playsinline style="max-width:450px">
   <source src="/images/MNPRX/art-direction/noisefx.mp4" type="video/mp4">
 </video>
 <figcaption>Adding and modifying NoiseFX</figcaption>
</figure>


## PaintFX
At the lowest level of control are [_PaintFX_](../paintfx/) (`pFX` button in the [_MNPRX Shelf_](../shelf/)), which allow you to paint effects onto the 3D objects at the vertex level (effects are assigned per vertex). This allows for meticulous local control over the stylization. More information can be found in the [_PaintFX_](../paintfx/) documentation.

<figure class="pull-center">
 <video autoplay loop muted playsinline style="max-width:450px">
   <source src="/images/MNPRX/art-direction/paintfx.mp4" type="video/mp4">
 </video>
 <figcaption>Painting NoiseFX</figcaption>
</figure>


## Proxies
In parallel to all these levels of control are [_Proxies_](../proxy/) (created by loading the _\_proxy_ material preset: `mPre` button in the [_MNPRX Shelf_](../shelf/)). Proxies are invisible objects controlling your stylization.

Geometry proxies can take the form of arbitrary 3D objects i.e., spheres, complex objects or simple planes. All proxies can be placed in your scene to control and stylize whatever is behind them. Their usage in 3D is versatile, as they can be placed onto a small part of your scene, or over the entire scene, in the form of a filter plane. More information can be found in the [_Proxy_](../proxy/) documentation.

<figure class="pull-center">
 <video autoplay loop muted playsinline style="max-width:450px">
   <source src="/images/MNPRX/art-direction/proxies.mp4" type="video/mp4">
 </video>
 <figcaption>Assigning and modifying a proxy</figcaption>
</figure>

Make sure to watch the [stylization examples](../stylizing-scene) to learn how to take advantage of each level of control when stylizing your scenes. Once you are happy with the results, render out your animation!

<figure class="pull-center">
 <video autoplay loop muted playsinline style="max-width:450px">
   <source src="/images/MNPRX/art-direction/spherebot.mp4" type="video/mp4">
 </video>
 <figcaption>The Spherebot in motion, 3D model by Bastien Genbrugge</figcaption>
</figure>

{% include toc-side %}
