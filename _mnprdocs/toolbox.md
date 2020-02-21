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
	<img src="/images/MNPRX/tbox.png" alt="MNPRX Toolbox" style="max-width:100%;">
	<figcaption>The MNPRX Toolbox contains a growing set of useful tools for production.</figcaption>
</figure>

## Import/export MNPRX stylization
Importing/exporting the stylization is crucial in professional production workflows and can be done with the _Import/Export Tool_. We go into detail about this tool in the [**Import/Export Tool documentation**](../import-export/).

## Bulk Attribute {% include aio-new.html %}
Only available for _Indie_ and _Studio_ licenses, the bulk attribute allows to easily change _MNPRX_ material settings and attributes in bulk. To open the tool window, click on the `Bulk Attribute` button in the _MNPRX Toolbox_.

<figure class="align-center">
	<img src="/images/MNPRX/bulkAttribute.png" alt="Bulk attribute tool" style="max-width:100%;">
	<figcaption>The bulk attribute tool contains the active settings of selected MNPRX materials.</figcaption>
</figure>

The settings and attributes that appear on the _Bulk Attribute_ tool depend on what materials you have selected in the scene.

By default, the tool will automatically refresh when the selection changes to show the attributes/settings of the current selection. You can disable this behaviour by unchecking the `Auto-refresh` option within the tool and refreshing manually through the `Refresh` button.

The material will be automatically gathered from any object you currently have selected. You can disable this bahavior by unchecking `Auto-materials` at the bottom right of the UI. If disabled, you will need to select the materials yourself for the attributes/settings to appear in the _Bulk Attribute_ tool.

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
