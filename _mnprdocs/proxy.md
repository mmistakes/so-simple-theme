---
layout: documentation
title: MNPRX proxy material
type: Docs
excerpt: Breaking down the invisible geoproxy material
tags: [Docs, MNPRX]
comments: true
schema:
redirect_from:
  - /projects/MNPRX/docs/proxy/
---

Proxy materials are invisible materials that only render to the stylization control maps within MNPRX, modifying stylization effects. As this may sound abstract, please watch the following tutorial demonstrating its usage within a watercolor stylization.
{: .top2}

{% include responsive-embed url="https://www.youtube.com/embed/QD9cX0Y8WRE" ratio="16:9" width="90%" %}

It may take some time to get used to working with proxy materials, but these provide unique versatility, as they portray standalone stylization elements in the scene. They can help stylize at a high level of control---affecting the whole image by being placed in front of the camera---, down to a low level of control---affecting a specific part in 3D space.

Built using the _ShaderFX_ framework, it is entirely contained within the node-based [_ShaderFX Graph_](#shaderfx-graph) and can be modified to fit any requirements by look development artists. However, most settings and attributes are easily accessible from the _Attribute Editor_ when the material is selected, as shown below.

-------------

<figure class="pull-right">
	<img src="/images/MNPRX/proxy/node-AE.png" alt="MNPRX proxy material node"  style="width: 400px">
	<figcaption>The proxy material in the Attribute Editor.</figcaption>
</figure>

The first element within the _proxy_ material is the `Open ShaderFX` button. This button will open the _ShaderFX Graph_, which allows complete control to customize the material with nodes. The graph is intended for shader writers or advanced users who know how to manipulate and work with the _ShaderFX_ framework. Using the _ShaderFX_ framework is outside of the scope of this documentation, but, if interested, we recommend you to watch [these tutorials](https://www.youtube.com/watch?v=wWc9_eqbGUI&list=PLOKJUFwsV5SotMRNNxxmbVjlyz7R7mdoc).
{: .top2 #shaderfx-graph}

The first section, when opened, provides the material **Settings** that allow to customize what optional features the _proxy_ material should have. The section is closed by default, as the only setting in the proxy material is handled by the [_PaintFX_](./../paintfx) tool.

### VtxControl
The _VtxControl_ setting enables the control of stylization effects through the vertex colors. This attribute is automatically managed by MNPRX and is activated as soon as you start using [_PaintFX_](./../paintfx).

------------------

## Attributes
The proxy material offers only a few default parameters, as it is mostly controlled through the [_PaintFX_](./../paintfx) and [_NoiseFX_](./../noisefx) tools

### Color Tint
_Color Tint_ darkens the material with a specified color. This attribute is especially useful for materials like tinted windows.

<div class="pull-center">
	<figure style="display:inline-block;">
		<video autoplay loop muted playsinline style="height:150px">
			<source src="/images/MNPRX/proxy/color-tint.mp4" type="video/mp4">
		</video>
		<figcaption>Color Tint with a light red color.</figcaption>
	</figure>
</div>

### Feathering
_Feathering_ softens the hard edges of the proxy materials to create a soft transition. This effect works best when the material is applied to round proxy objects.

<div class="pull-center">
	<figure style="display:inline-block;">
		<video autoplay loop muted playsinline style="height:150px">
			<source src="/images/MNPRX/proxy/feathering.mp4" type="video/mp4">
		</video>
		<figcaption>Feathering the Color Tint (0...3.0).</figcaption>
	</figure>
</div>

### Cookie Mask
_Cookie Mask_ is an image which contains a mask of the proxy. It is especially useful if you place a proxy plane (card) in front of the camera to create effect vignettes. This attribute toggles the use of the [_Cookie Mask File_](#cookie-mask-file).

### Cookie Mask File
Specifies the file path to the _Cookie Mask_. The path can be absolute or relative to the project root directory.  
<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/proxy/cookie-mask.mp4" type="video/mp4">
 </video>
 <figcaption>Cookie mask applied on a proxy material.</figcaption>
</figure>

### Invert Cookie
_Invert Cookie_ inverts the applied _Cookie Mask_ values.

<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/proxy/cookie-invert.mp4" type="video/mp4">
 </video>
 <figcaption>Cookie mask inverted on a proxy material.</figcaption>
</figure>

------------------

## Stylization (procedural)
When the [_NoiseFX_](./../noisefx) tool has been used on the material, the _Stylization (procedural)_ section will appear at the bottom of the _Attribute Editor_. This section contains all the procedural attributes that the _NoiseFX_ tool creates and modifies. Therefore, you can mostly ignore these attributes within the material.

<figure class="align-center">
	<img src="/images/MNPRX/stylization-proc-AE.png" alt="Stylization (procedural) attributes"  style="width: 500px">
	<figcaption>Some procedural stylization attributes created through NoiseFX.</figcaption>
</figure>

{% include toc-side %}
