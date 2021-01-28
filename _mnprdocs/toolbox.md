---
layout: documentation
title: MNPRX toolbox
type: Docs
excerpt: Handy tools to work with MNPRX in production
tags: [Docs, MNPRX]
comments: true
schema:
redirect_from:
  - /projects/MNPRX/docs/toolbox/
---

The _MNPRX toolbox_ is a handy collection of tools to use MNPRX in production. The toolbox can be opened by clicking on the `tbox` [shelf icon](../shelf).
{: .top2}

<figure class="align-center">
	<img src="/images/MNPRX/tbox2.png" alt="MNPRX Toolbox" style="max-width:100%;">
	<figcaption>The MNPRX Toolbox contains a growing set of useful tools for production.</figcaption>
</figure>

## Delete PaintFX
Deleting _PaintFX_ can be useful in a various situations
* To start using _PaintFX_ again from scratch
* To reduce file size, while keeping the _PaintFX_ values in the exported file
* To recover the construction history of the vertex color sets to animate _PaintFX_ (remember to export the current _PaintFX_ first and import them back in afterwards)

To use it, simply select the objects from which you'd like to remove the _PaintFX_, and click on the **Delete PaintFX** button.

If nothing is selected, the tool will try to delete the _PaintFX_ of **ALL** objects in the scene.
{: .notice--info}

## Auto-convert Maya materials
_Auto-convert Maya materials_ will automatically try to convert all Maya materials in the scene to _MNPRX_ materials, inheriting attributes and textures. This is especially useful for quickly loading existing _Maya_ scenes and seeing how they render with _MNPRX_.


## Unsubdivide Previews
_Unsubdivide Previews_ can be useful in a various situations where you need to work with light meshes.
* When using the _Velocity PV_ attribute in the [style configuration node](../config/#velocity-pv), to improve upon the performance and correctly advect (attach) the canvas to the underlaying motion.
* For performance and stability issues on computers running with integrated graphics

To use it, simply select the objects from which you'd like to unsubdivide and click on the **Unsubdivide Previews** button.

If nothing is selected, the tool will try to unsubdivide **ALL** meshes/shapes in the scene.
{: .notice--info}

## Re-link textures
When opening scenes that were stylized by someone else or from another computer, the texture paths within the _ShaderFX_ materials might not be the same anymore. Re-link textures automatically re-links all existing textures from a specific directory with the click of a button.

{% include toc-side %}
