---
layout: documentation
title: PaintFX
type: Docs
excerpt: Painting effects onto objects in 3D
tags: [Docs, MNPRX]
comments: true
schema:
redirect_from:
  - /projects/MNPRX/docs/paintfx/
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

On the left side of each widget, you will find a term for the generalized behaviour of each effect. This is followed by a _Brush_, indicating what the behavior/effect does. By clicking on the _Brush_ you can quickly start painting the effect with the currently defined values on selected objects. Before going into more details on painting, underneath the _Brush_ icon, you will find three buttons, which will allow to animate _PaintFX_ values.

<figure class="pull-left" style="margin: 0.5em 18px 0">
	<img src="/images/MNPRX/FX/insertKey.png" alt="Insert key on selected vertices"  style="max-height: 32px">
</figure>

This button will key the painted values of selected vertices at the current time, allowing you to animate the painted effects through keyframes.

<figure class="pull-left" style="margin: 0.6em 4px 0 0">
	<img src="/images/MNPRX/FX/timeline.png" alt="Show timeline of selected vertices"  style="max-height: 32px">
</figure>

This button will show the keyframes in the timeline of selected vertices/objects allowing you to adjust timing or delete keyframes of the painted the effects. It will also show the keyframes in _Maya_'s _Graph Editor_.

<figure class="pull-left" style="margin: 0.5em 18px 0">
	<img src="/images/MNPRX/FX/removeKey.png" alt="Remove key on selected vertices"  style="max-height: 32px">
</figure>

This button will remove the keyframe of painted values from selected vertices at the current time.

Keying of PaintFX requires the construction history of the vertex color sets, refer to the [FAQ](./#faq) if you have deleted its construction history. should be done with caution, as _Maya_ internally stores the value of each vertex on adjacent faces. This means that, if you are keying one vertex with four values (RGBA), that is shared with four adjacent faces, you will be keying 16 values---for only one vertex. This escalates exponentially when keying objects with hundreds of vertices. Therefore, try to use proxies and animate them instead, whenever possible.

Because of construction history and how _Maya_ internally stores vertex-color data, painting effects with _PaintFX_ on objects with a lot of vertices can substantially increase the file size of the scene. To reduce the impact in file size, we recommend deleting the _Non-Deformer History_ (_Edit->Delete by Type->Non-Deformer History_) of objects whose _PaintFX_ will not be animated.
{: .notice--info}

## Modifying Paint Values
To modify the painting values of each widget, you can use the radio buttons to quickly change between the two or more painting modes and adjust the vertical slider at the right of the widget to set the painting value/intensity. The painting value/intensity is specified underneath the vertical slider and can also be modified by manually entering the desired numerical value in the spin box.

{% include aio-hint.html %} **By modifying a painting value, the tool will automatically change to painting mode, so there is no need to click on the painting icon anymore.**

### Reset and Flood
The painted values can be reset or flooded (added) on the selected objects/vertices. There are two buttons for this at the bottom of each widget. These buttons are useful when you need to assign a specific value to a lot of vertices in an object, be it to reset the _PaintFX_ values or to add the effect evenly to the selected objects/components. Reset will put the values of the selected objects/vertices to zero (0) whereas flooding will add the numerical value set by the vertical slider or entered manually in the spin box.

## Import/Export
You can quickly import/export the _PaintFX_ values of the selected object by using the two buttons at the top-right of the tool window. While this works, we highly recommend using the more powerful [Import/Export Tool](./docs/import-export/) found in the [MNPRX Toolbox](./docs/toolbox) for this purpose.

## Showcase

<figure class="pull-center">
 <video autoplay loop muted playsinline style="max-width:450px">
   <source src="/images/MNPRX/art-direction/paintfx.mp4" type="video/mp4">
 </video>
 <figcaption>Painting NoiseFX</figcaption>
</figure>

## FAQ

_**I deleted the construction history, how can I still animate PaintFX?**_<br>
Animating _PaintFX_ requires the history created with the vertex color sets to keyframe the values. To recover the required construction history, you can:
1.- Export the _PaintFX_ with the [Import/Export Tool](./docs/import-export/).
2.- Delete the _PaintFX_ using the [MNPRX Toolbox](./docs/toolbox).
3.- Import the _PaintFX_ back in with the [Import/Export Tool](./docs/import-export/).
The construction history will be in place and you can now animate the _PaintFX_ values.

{% include toc-side %}
