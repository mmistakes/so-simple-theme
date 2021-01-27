---
layout: documentation
title: MNPRX Shelf
type: Docs
excerpt: Breakdown of the MNPRX shelf
tags: [Docs, MNPRX]
comments: true
schema:
redirect_from:
  - /projects/MNPRX/docs/shelf/
---

<figure class="align-center top2">
	<img src="/images/MNPRX/MNPRX-Shelf.png" alt="MNPRX shelf">
	<figcaption>The MNPRX shelf with its three segments: Art-direction, Lighting/Testing and Rendering.</figcaption>
</figure>

The _MNPRX shelf_ contains all tools required to work with MNPRX, separated into three segments:
* Art-direction
* Lighting/Testing
* Rendering

While most users will find themselves working with the first segment, it's important to understand what the remaining two segments are for. The last shelf tool will popup the shelf into its own window.

## Art-direction
The art-direction tools can be found in the left side of the shelf, ordered from highest to lowest level of control. These consist of:
1. **MNPRX** - opens the browser with the [MNPRX documentation](../).
1. **style** - opens the _Stylization Presets_ to load/save predefined styles and their parameters [[docs](../style-presets)].
1. **conf** - selects the configuration node to change each style attribute [[docs](../config)].
1. **mPre** - opens the _Material Presets_ to load/save predefined MNPRX materials and their parameters [[docs](../material-presets)].  
`Right click -> Update ShaderFX materials` will automatically update all _ShaderFX_ materials to the newest version.  
`Right click -> Refresh ShaderFX materials` will automatically refresh all _ShaderFX_ materials in the scene.
1. **mat** - selects the material of currently selected objects e.g., the [_mnpr_uber_](../uber) or [_mnpr_geoproxy_](../proxy) materials.  
`Double click` refreshes the _Attribute Editor_ of the material, forcing the _ShaderFX_ framework to show all attributes.    
`Right click -> Select all objects with material` will select all objects that share the same material.
1. **blk** - opens the _Bulk Attribute_ tool that is like an attribute editor, but lets you modify multiple MNPRX materials at once (in bulk).
1. **nFx** - opens the _NoiseFX_ window that lets you control effects procedurally on MNPRX materials [[docs](../noisefx)].
1. **pFx** - opens the _PaintFX_ window that lets you paint each effect directly on your 3D models [[docs](../paintfx)].


## Lighting/Testing
The lighting and testing tools allow to easily create the supported lights within MNPRX and to troubleshoot if things are not looking quite right.
1. **Supported lights** - shelf icons for the four different supported lights: ambient, directional, point (no shadow maps) and spot light.
1. **pass** - opens the _Pass Inspector_, which lets you toggle on/off each stylization pass and troubleshoot the inner workings of the stylization itself.
1. **test** - creates a simple default test scene with default lighting.


## Rendering
1. **tbox** - opens the _MNPRX Toolbox_ window, containing handy tools to work with MNPRX in production [[docs](../toolbox)].
1. **float** - opens a floating viewport with a 1280 x 720 resolution.  
`Right click -> Float viewport 1024 x 540` opens a floating viewport with a 1024 x 540 resolution.  
`Right click -> Float viewport 1920 x 1080` opens a floating viewport with a 1920 x 1080 resolution (Full HD).  
`Right click -> Custom float viewport` opens a floating viewport with a custom resolution set through a small dialog.
1. **rendr** - opens up the viewport renderer, which quickly allows to save screenshots or playblasts [[docs](../rendering#rendr)].
1. **tSeq** - opens up the target sequence renderer, which allows to render all different passes for production [[docs](../rendering/#target-sequence-renderer)].
1. **im/ex** - opens up the import/export tool to import or export _.style_ files [[docs](../import-export)]
1. **supp.** - opens the browser straight to [support on this webpage](/support/).

## Popup shelf
Creates a popup shelf in a window so that you can always access the MNPRX tools while using other shelves.
<figure class="align-center top2">
	<img src="/images/MNPRX/popup-shelf.png" alt="MNPRX popup shelf">
	<figcaption>The popup shelf with all MNPRX tools.</figcaption>
</figure>

{% include toc-side %}
