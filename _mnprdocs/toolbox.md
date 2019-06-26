---
layout: documentation
title: MNPRX toolbox
type: Docs
excerpt: Handy tools to work with MNPRX in production
tags: [Docs, MNPRX]
comments: true
schema:
---

The _MNPRX toolbox_ is a handy collection of tools to use MNPRX in production. The toolbox can be opened by clicking on the `tbox` [shelf icon](../shelf).
{: .top2}

<figure class="align-center">
	<img src="/images/MNPRX/tbox.png" alt="MNPRX Toolbox" style="width:300px;">
	<figcaption>The MNPRX Toolbox contains a growing set of useful tools for production.</figcaption>
</figure>

## Import/export MNPRX stylization
Importing/exporting the stylization is crucial in professional production workflows and can be done with the _Import/Export Tool_. We go into detail about this tool in the [**Import/Export Tool documentation**](../import-export/).

## Delete PaintFX
Deleting _PaintFX_ can be useful in a various situations
* To start using _PaintFX_ again from scratch
* To reduce file size, while keeping the _PaintFX_ values in the exported file
* To recover the construction history of the vertex color sets to animate _PaintFX_ (remember to export the current _PaintFX_ first and import them back in afterwards)

To use it, simply select the objects from which you'd like to remove the _PaintFX_, and click on the **Delete PaintFX** button.

If nothing is selected, the tool will try to delete the _PaintFX_ of **ALL** objects in the scene.
{: .notice--info}

## Unsubdivide Previews
_Unsubdivide Previews_ can be useful in a various situations where you need to work with light meshes.
* When using the _Velocity PV_ attribute in the [style configuration node](../config/#velocity-pv), to improve upon the performance and correctly advect (attach) the substrate to the underlying motion.
* For performance and stability issues on computers running with integrated graphics

To use it, simply select the objects from which you'd like to unsubdivide and click on the **Unsubdivide Previews** button.

If nothing is selected, the tool will try to unsubdivide **ALL** meshes/shapes in the scene.
{: .notice--info}

{% include toc-side %}
