---
layout: documentation
title: PaintFX
type: Docs
excerpt: Painting effects onto objects in 3D
tags: [Docs, MNPRX]
comments: true
schema:
---

_PaintFX_ is a tool which grants [localized control of effects](#showcase) at the vertex level of control. The tool can be opened by clicking on the **pFX** shelf icon and shares the same window with [_NoiseFX_](../noisefx).
{: .top2}

<figure class="pull-right" style="margin-top:-1em;">
	<img src="/images/MNPRX/FX/paintFX.png" alt="PaintFX tool window"  style="max-width: 300px">
	<figcaption>PaintFX of the watercolor stylization.</figcaption>
</figure>

Each _MNPRX_ material ([uber](../uber) and [proxy](../proxy)) supports _PaintFX_, but the effects driven by _PaintFX_ depend on the loaded style. To use _PaintFX_ select an object with an _MNPRX_ material and click on the paint icon of the effect that you want to paint with.

## Paint Widgets
Each style has different effects, therefore, the paint widgets (sections) will vary depending on the currently loaded stylization. Each widget (section) handles a specific effect/behaviour within the style e.g., _Lighting_, _Pigment turbulence_, _Color bleeding_.

On the left side of each widget, you will find a term for the generalized behaviour of each effect. This is followed by a _Brush_, indicating what the behavior/effect does. By clicking on the _Brush_ you can quickly start painting the effect with the currently defined values on selected objects. Before going into more details on painting, underneath the _Brush_ icon, you will find three buttons.

<figure class="pull-left" style="margin: 0.5em 18px 0">
	<img src="/images/MNPRX/FX/insertKey.png" alt="Insert key on selected vertices"  style="max-height: 32px">
</figure>

This button will key the painted values of selected vertices at the current time, allowing you to animate the painted effects.

<figure class="pull-left" style="margin: 0.6em 4px 0 0">
	<img src="/images/MNPRX/FX/timeline.png" alt="Show timeline of selected vertices"  style="max-height: 32px">
</figure>

This button will show the keyframes in the timeline of selected vertices/objects allowing you to adjust timing or delete keyframes of the painted the effects. It will also show the keyframes in _Maya_'s _Graph Editor_.

<figure class="pull-left" style="margin: 0.5em 18px 0">
	<img src="/images/MNPRX/FX/removeKey.png" alt="Remove key on selected vertices"  style="max-height: 32px">
</figure>

This button will remove the keyframe of painted values from selected vertices at the current time.

Keying of PaintFX should be done with caution, as _Maya_ internally stores the value of each vertex on adjacent faces. This means that, if you are keying one vertex with four values (RGBA), that is shared with four adjacent faces, you will be keying 16 values---for only one vertex. This escalates exponentially when keying objects with hundreds of vertices. Therefore, try to use proxies and animate them instead, whenever possible.

Documentation in progress, please come back in the next few days.
{: .notice--info}

## Modifying Paint Values

### Reset and Flood

## Import/Export

## Showcase

<figure class="pull-center">
 <video autoplay loop muted playsinline style="max-width:450px">
   <source src="/images/MNPRX/art-direction/paintfx.mp4" type="video/mp4">
 </video>
 <figcaption>Painting NoiseFX</figcaption>
</figure>

## FAQ
_**The effect that I was painting with doesn't work anymore**_<br>
This is a known bug which presents difficult to replicate, so, if you know the steps how to replicate them, please [let us know](http://mnprx.feedback.artineering.io).
In the meantime, double click on the **pFX** shelf tool to reload the tool and all its bindings.


{% include toc-side %}
