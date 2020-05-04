---
layout: documentation
title: MNPRX uber material
type: Docs
excerpt: Breaking down the painterly MNPRX uber material
tags: [Docs, MNPRX]
comments: true
schema:
redirect_from:
  - /projects/MNPRX/docs/uber/
---

Materials give the surface properties to 3D objects, which are then projected to an image. Therefore, it is crucial to understand what features materials can provide, especially in a non-photorealistic rendering context where everything is possible. It can take some time to fully master the _mnpr_uber_ material, but hopefully this documentation will make the learning curve manageable.
{: .top2}

The _mnpr_uber_ material is developed to meet most painterly shading requirements in real-time. Built using the _ShaderFX_ framework, it is entirely contained within the node-based [_ShaderFX Graph_](#shaderfx-graph) and can be modified to fit any shading requirements by look development artists. However, most settings and attributes are easily accessible from the _Attribute Editor_ when the material is selected, as shown below.

A ShaderFX material has two types of 'attributes': [**Settings**](.#settings) and [**Attributes**](.#painterly-shading). They work quite differently so its important to consider them as separate entities.
{: .notice--info}

-------------

<figure class="pull-right bottom-1">
	<img src="/images/MNPRX/mnpr-uber/node-AE.png" alt="MNPR uber material node"  style="width: 400px">
	<figcaption>The default mnpr_uber material in the Attribute Editor.</figcaption>
</figure>

The first element within the _mnpr_uber_ material is the `Open ShaderFX` button. This button will open the _ShaderFX Graph_, which allows complete control to customize the material with nodes. The graph is intended for shader writers or advanced users who know how to manipulate and work with the _ShaderFX_ framework. Using the _ShaderFX_ framework is outside of the scope of this documentation, but, if interested, we recommend you to watch [these tutorials](https://www.youtube.com/watch?v=wWc9_eqbGUI&list=PLOKJUFwsV5SotMRNNxxmbVjlyz7R7mdoc) and read the [advanced documentation](#advanced).
{: .top2 #shaderfx-graph}

The first section, when opened, provides the material [**Settings**](.#settings) that allow to customize what optional features the _mnpr_uber_ material should have. The section is closed by default, as these settings are rather advanced. However, we'll go into detail with each setting [further on](#settings). Let us concentrate first on the default material [**Attributes**](.#painterly-shading).

{% include aio-hint.html %} **Almost all attributes shown in the _mnpr_uber_ material go between `0` and `1`. The ShaderFX framework unfortunately maxes out the sliders of attributes at their default value.**


## Painterly Shading
Painterly shading attributes focus on bringing colors into the foreground of shading control and work differently than most attributes found in photorealistic renderers. This doesn't mean that they can't be combined with normal [_Shading_](#shading) parameters, but they require 3D artists to go back to thinking in terms of colors and light. The first group of attributes control the color in the lit parts of the objects, whereas the second group of attributes (from [_Colored Shading_](#colored-shading) onwards) control the color in the shade of objects.

### Cangiante
_Cangiante_ illumination changes the hue of the lit area towards a brighter and saturated related color. This attributes can also be used to enhance the color of any applied [_Albedo Texture_](#albedo-texture).
<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/cangiante.mp4" type="video/mp4">
 </video>
 <figcaption>Cangiante illumination (0...2.0)</figcaption>
</figure>

#### Cangiante Wrap
_Cangiante Wrap_ defines the area of effect for the [_Cangiante_](#cangiante) illumination attribute.
<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/cangiante-wrap.mp4" type="video/mp4">
 </video>
 <figcaption>Cangiante Wrap (0...1.0)</figcaption>
</figure>

### Light
_Light_ (prev. Dilute Paint) changes the color of the lit area towards the [_Light Color_](#light-color).
<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/light.mp4" type="video/mp4">
 </video>
 <figcaption>Light (0...1.0)</figcaption>
</figure>

#### Light Wrap
_Light Wrap_ (prev. Dilute Area) defines the area of effect for the [_Light_](#light) attribute.
<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/light-wrap.mp4" type="video/mp4">
 </video>
 <figcaption>Light Wrap (0...1.0)</figcaption>
</figure>


#### Light Color
_Light Color_ (prev. Dilute Color) defines a custom color used by the [_Light_](#light) and [_Highlight_](#highlight) attributes.
<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/light-color.mp4" type="video/mp4">
 </video>
 <figcaption>Different light colors</figcaption>
</figure>


### Colored Shading
_Colored Shading_ toggles colored shading of objects, which is then done with the [_Shade Color_](#shade-color) instead of black.
<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/colored-shading.mp4" type="video/mp4">
 </video>
 <figcaption>Colored Shading on/off</figcaption>
</figure>

### Diffuse Factor
_Diffuse Factor_ defines the amount of diffuse shading within the material. `0` will be flat shading (entirely lit), `1` will be completely diffuse.
<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/diffuse-factor.mp4" type="video/mp4">
 </video>
 <figcaption>Diffuse Factor (0...1.0)</figcaption>
</figure>

### Shade
_Shade_ (prev. Shade Wrap) changes the color of the shade area towards the [_Shade Color_](#shade-color).
<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/shade.mp4" type="video/mp4">
 </video>
 <figcaption>Shade (0...1.0)</figcaption>
</figure>

### Shade Wrap
_Shade Wrap_ defines the area of effect for the _Shade_ attribute. It behaves like the [_Light Wrap_](#light-wrap), but for the shade of an object.
<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/shade-wrap.mp4" type="video/mp4">
 </video>
 <figcaption>Shade Wrap (0...1.0)</figcaption>
</figure>

### Shade Color
_Shade Color_ defines a custom color used by the [_Colored Shading_](#colored-shading) and the [_Shade_](#shade) attributes.
<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/shade-color.mp4" type="video/mp4">
 </video>
 <figcaption>Different shade colors showcased with the Colored Shading attribute on</figcaption>
</figure>

-----------------

## Shading
Shading attributes focus on common attributes found in photorealistic materials, including various uses of texture mapping for different shading effects. Further attributes can be shown in this section by enabling the [_Specularity_](#specularity) and [_NormalMapTweaks_](#normalmaptweaks) Settings.

### Shading
_Shading_ defines the amount of shading within the material. `0` will be flat shading (entirely unlit), `1` will be shaded. It's the opposite of [_Diffuse Factor_](#diffuse-factor) and won't affect lighting from [_Light Maps_](#lightmap).
<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/shading.mp4" type="video/mp4">
 </video>
 <figcaption>Shading (0...1.0)</figcaption>
</figure>

### Color Tint
_Color Tint_ defines a custom tint color. If no [_Albedo Textures_](#albedo-texture) are used, the color tint will define the overall color of the material. With textures, the color tint will multiply with the albedo texture to tint it accordingly. Leave the color tint white if you only want the color of the albedo texture.
<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/color-tint.mp4" type="video/mp4">
 </video>
 <figcaption>Different tint colors showcased with a Diffuse Factor of 0.6</figcaption>
</figure>

### Albedo Texture
_Albedo Texture_ is an image which contains the raw colors of the object, without any lighting information. This attribute toggles the use of the [_Albedo Texture File_](#albedo-texture-file).

#### Albedo Texture File
Specifies the file path to the _Albedo Texture_. The path can be absolute or relative to the project root directory.  
<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/albedo-tint.mp4" type="video/mp4">
 </video>
 <figcaption>Albedo Texture with different tint colors and a Diffuse Factor of 0.85</figcaption>
</figure>

### Normal Map
_Normal Map_ is an image which contains the normal inclination deviations of the surface in the red and green channels. This texture is used to add geometric detail through
normal modulations.

#### Normal Map File
Specifies the file path to the _Normal Map_. The path can be absolute or relative to the project root directory.  

#### Bump Depth
Defines the intensity of the normal inclinations in the [_Normal Map_](#normal-map).
<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/normal-map.mp4" type="video/mp4">
 </video>
 <figcaption>Normal Map with Bump Depth (0...3.0)</figcaption>
</figure>

As not all normal maps are encoded the same way, there is a [_NormalMapTweaks_](#normalmaptweaks) setting that helps to invert the U or V direction of the normal map, if necessary.
{: .notice--info}

------------------
------------------

## Stylization (proc.)
When the [_NoiseFX_](./../noisefx) tool has been used on the material, the _Stylization (procedural)_ section will appear at the bottom of the _Attribute Editor_. This section contains all the procedural attributes that the _NoiseFX_ tool creates and modifies. Therefore, you can mostly ignore these attributes within the material.

<figure class="align-center">
	<img src="/images/MNPRX/stylization-proc-AE.png" alt="Stylization (procedural) attributes"  style="width: 500px">
	<figcaption>Some procedural stylization attributes created through NoiseFX.</figcaption>
</figure>

------------------
------------------

## Settings

Settings is the first section within the _Attribute Editor_, but it is closed by default. Once opened, each _Setting_ allows you to customize what optional features the _mnpr_uber_ material should have. Most of these settings are disabled by default, as to avoid unnecessary computations and clutter for artists. If needed, enabling settings will provide the necessary attributes to configure them.

### Reflectance Model
The _Reflectance Model_ setting defines the shading algorithm used by the _mnpr_uber_ shader. A shading algorithm dictates how light is reflected along the surface of the object. Here is a visual comparison of each shading algorithm.

<figure class="pull-center">
	<img src="/images/MNPRX/mnpr-uber/lambert.png" alt="lambert" style="height:150px">
	<img src="/images/MNPRX/mnpr-uber/half-lambert.png" alt="half-lambert" style="height:150px">
	<img src="/images/MNPRX/mnpr-uber/extended-lambert.png" alt="extended-lambert" style="height:150px">
	<img src="/images/MNPRX/mnpr-uber/angular-lambert.png" alt="angular-lambert" style="height:150px">
	<figcaption>Available reflectance models: Lambert, Half Lambert, Extended Lambert and Angular Lambert.</figcaption>
</figure>

Some reflectance models may not be compatible with all material features on this documentation page. Only the _Lambert_ reflectance model has been thoroughly tried and tested.
{: .notice--warning}

------------------

### VtxControl
The _VtxControl_ setting enables the control of stylization effects through the vertex colors. This attribute is automatically managed by MNPRX and is activated as soon as you start using [_PaintFX_](./../paintfx).

------------------

### Shadow
The _Shadow_ setting enables cast shadows of the material on other surfaces. If disabled, the objects with the material won't _cast_ any shadows onto other objects (they might still present shadows from other casting objects/materials).

------------------

### Flip-Back-Faces
The _Flip-Back-Faces_ setting flips the normals of faces that might be pointing away from the camera view. This is useful to obtain better results for thin objects like leaves.

------------------

### Transparent and Semi-Transparent
The _Transparent_ setting enables the use of alpha masks in the material and unlocks the _Semi-Transparent_ setting directly underneath.
<figure class="align-center">
	<img src="/images/MNPRX/mnpr-uber/transparent-AE.png" alt="Transparency and Semi-Transparency attributes"  style="width: 500px">
	<figcaption>The Transparent and Semi-Transparent section in the Attribute Editor.</figcaption>
</figure>

#### Alpha Mask
_Alpha Mask_ is a black and white image which embeds the alpha of the material. White is opaque, black is transparent. Use the alpha masks if you want cast shadows respect the transparency.

#### Alpha Texture File
Specifies the file path to the _Alpha Mask_. The path can be absolute or relative to the project root directory. While similar to [_Transparency Map_](#transparency-map), the alpha mask is binary and can only distinguish between opaque or fully transparent.

#### Alpha Mask Cutoff
The grayscale value at which the [_Alpha Mask_](#alpha-mask) is transparent. Defines the boundary of the alpha mask in case there are grey values.
<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/alpha-mask.mp4" type="video/mp4">
 </video>
 <figcaption>Alpha Mask with Alpha Mask Cutoff (0.1...0.9).</figcaption>
</figure>

#### Transparency Map
_Transparency Map_ is a greyscale image which embeds the semi-transparency of the material. This attribute toggles the use of the [_Transparency Texture File_](#transparency-texture-file) and is only available if the _Transparent_ and  _Semi-Transparent_ setting have been enabled.

{% include aio-hint.html %} **As with [_Alpha Masks_](#alpha-mask): white is opaque, grey values are semi-transparent, black is transparent. The darker the value of the _Transparency Map_, the more transparent the material will be.**

#### Transparency Texture File
Specifies the file path to the _Transparency Map_. The path can be absolute or relative to the project root directory.  
<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/transparency-map.mp4" type="video/mp4">
 </video>
 <figcaption>Transparency Map, featuring semi-transparency.</figcaption>
</figure>

#### Transparency
_Transparency_ defines the overall semi-transparency of the material.
<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/transparency.mp4" type="video/mp4">
 </video>
 <figcaption>Transparency (0...1.0)</figcaption>
</figure>

When working with [_Transparency Map_](#transparency-map) or [_Alpha Mask_](#alpha-mask), you can set the _Transparency_ attribute to `0`, as the textures will normally handle the transparency, instead.
{: .notice--info}

------------------

### LightMap
The _Light Map_ setting enables the use of light maps within the material and creates a new section with light map attributes. Light maps are grayscale maps that define which parts of the material are lit. These can be baked from offline renderers, painted manually or [set up procedurally](#procedural) using _ShaderFX_.

<figure class="align-center">
	<img src="/images/MNPRX/mnpr-uber/light-map-AE.png" alt="Light Map attributes"  style="width: 500px">
	<figcaption>The Light Map section in the Attribute Editor.</figcaption>
</figure>

##### Light Map File
Specifies the file path to the _Light Map_. The path can be absolute or relative to the project root directory.  

#### Shade in Light Map
If this attribute is enabled, [_Light Maps_](#lightmap) will add both light and shade to the object. White `1.0` will add light, neutral grey `0.5` won't add anything, black `0` will add shade to the object.

<div class="pull-center">
	<figure style="display:inline-block;">
		<img src="/images/MNPRX/mnpr-uber/light-map-map.png" alt="Light map used in video"  style="height: 150px">
		<figcaption>Light Map supporting Shade in Light Map.</figcaption>
	</figure>
	<figure style="display:inline-block;">
		<video autoplay loop muted playsinline style="height:150px">
			<source src="/images/MNPRX/mnpr-uber/light-map.mp4" type="video/mp4">
		</video>
		<figcaption>Light Map applied.</figcaption>
	</figure>
</div>

------------------

### Highlight
The _Highlight_ setting generates the [_Highlight Roll Off_](#highlight-roll-off) and [_Highlight Transparency_](#highlight-transparency) attributes in the _Painterly Shading_ material section. These attributes generate a sharp highlight with the [_Light Color_](#light-color).
<figure class="align-center">
	<img src="/images/MNPRX/mnpr-uber/highlight-AE.png" alt="Highlight attributes"  style="width: 500px">
	<figcaption>The Highlight attributes in the Paintery Shading section within the Attribute Editor.</figcaption>
</figure>

#### Highlight Roll Off
_Highlight Roll Off_ defines the size of the highlight in the lit area of objects.

<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/highlight-roll-off.mp4" type="video/mp4">
 </video>
 <figcaption>Highlight Roll Off with an orange Light Color (0...1.0)</figcaption>
</figure>

#### Highlight Transparency
_Highlight Transparency_ defines the transparency of the highlight.

<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/highlight-transparency.mp4" type="video/mp4">
 </video>
 <figcaption>Highlight Transparency (0...1.0).</figcaption>
</figure>

------------------

### Rim light / Rim light opp.
The _Rim Light_ and _Rim light opp._ settings control the appearance of the rim lighting effect around the silhouette of objects, on areas facing respectively away and towards the light.
The settings described below are the same for both rim light (facing away) and rim light opposite (facing towards the light).

#### Rim Light
_Rim Light_ controls the intensity of the rim light. A value of `0` means that the rim light is invisible.

<div class="pull-center">
<figure style="display:inline-block;">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/rim-light.mp4" type="video/mp4">
 </video>
 <figcaption>Rim Light (0...1.0).</figcaption>
</figure>

<figure style="display:inline-block;">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/rim-light-opp.mp4" type="video/mp4">
 </video>
 <figcaption>Rim Light Opposite (0...1.0).</figcaption>
</figure>
</div>

#### Rim Light Wrap
_Rim Light Wrap_ defines the area of effect of the rim light.

<div class="pull-center">
<figure style="display:inline-block;">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/rim-wrap.mp4" type="video/mp4">
 </video>
 <figcaption>Rim Light Wrap (0...1).</figcaption>
</figure>

<figure style="display:inline-block;">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/rim-wrap-opp.mp4" type="video/mp4">
 </video>
 <figcaption>Rim Light Wrap Opposite (0...1).</figcaption>
</figure>
</div>

#### Rim Light Color
Controls the color of the rim light effect. The color is additively blended on top of the underlying shading.

<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/rim-color.mp4" type="video/mp4">
 </video>
 <figcaption>Varying the hue of the rim light color.</figcaption>
</figure>

------------------

### Specularity
The _Specularity_ setting enables the use of [specular reflectance models](#specularmodel) within the material and creates new attributes within the Shading section. Once enabled, two new settings appear underneath: [_specularModel_](#specularmodel) and [_Specular-In-Alpha_](#specular-in-alpha) (if the [_Transparent_](#transparent-and-semi-transparent) setting is also enabled).

<figure class="align-center">
	<img src="/images/MNPRX/mnpr-uber/specularity-AE.png" alt="Specularity settings"  style="width: 500px">
	<figcaption>The Specularity settings in the Attribute Editor.</figcaption>
</figure>

### specularModel
The _specularModel_ setting defines the shading algorithm used by the _mnpr_uber_ material for specularity (shininess). A shading algorithm dictates how light is reflected along the surface of the object.

<figure class="pull-center">
	<img src="/images/MNPRX/mnpr-uber/blinn.png" alt="Blinn" style="height:150px">
	<img src="/images/MNPRX/mnpr-uber/anisotropic.png" alt="Anisotropic" style="height:150px">
	<figcaption>Available specular reflectance models: Blinn and Anisotropic.</figcaption>
</figure>

Depending on which specular model is selected, different specularity attributes will appear in the _Shading_ section.
{: #specular-AE}

<div class="pull-center">
	<figure style="display:inline-block;">
		<img src="/images/MNPRX/mnpr-uber/blinn-AE.png" alt="Blinn specularity attributes"  style="height: 350px">
		<figcaption>Blinn specularity attributes.</figcaption>
	</figure>
	<figure style="display:inline-block;">
		<img src="/images/MNPRX/mnpr-uber/anisotropic-AE.png" alt="Anisotropic specularity attributes"  style="height: 350px">
		<figcaption>Red: Anisotropic specularity attributes. Cyan: Specular-In-Alpha attributes.</figcaption>
	</figure>
</div>


#### Specular Map
_Specular Map_ is a greyscale image which defines the specularity within the material. Otherwise, the specularity will be even throughout the material. This attribute toggles the use of the [_Specular Map File_](#specular-map-file).

{% include aio-hint.html %} **The specularity within the specular map is encoded within the intensity (white values) of the texture. White is specular, grey is semi-specular, black is diffuse.**

#### Specular Map File
Specifies the file path to the _Specular Map_. The path can be absolute or relative to the project root directory.  
<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:150px">
   <source src="/images/MNPRX/mnpr-uber/specular-map.mp4" type="video/mp4">
 </video>
 <figcaption>(1) without specularity; (2) with specularity; (3) with specularity and a Specular Map.</figcaption>
</figure>

#### Roll Offs
_Specular Roll Off_, _Horizontal Roll Off_ and _Vertical Roll Off_ define the size of the specular highlight.

<div class="pull-center">
	<figure style="display:inline-block;">
		<video autoplay loop muted playsinline style="height:150px">
			<source src="/images/MNPRX/mnpr-uber/roll-off.mp4" type="video/mp4">
		</video>
		<figcaption style="width:17em">Blinn: Roll Off (0...1.0).</figcaption>
	</figure>
	<figure style="display:inline-block;">
		<video autoplay loop muted playsinline style="height:150px">
			<source src="/images/MNPRX/mnpr-uber/h-roll-off.mp4" type="video/mp4">
		</video>
		<figcaption style="width:17em">Anisotropic: Horizontal Roll Off (0...0.5).</figcaption>
	</figure>
	<figure style="display:inline-block;">
		<video autoplay loop muted playsinline style="height:150px">
			<source src="/images/MNPRX/mnpr-uber/v-roll-off.mp4" type="video/mp4">
		</video>
		<figcaption style="width:17em">Anisotropic: Vertical Roll Off (0...0.5).</figcaption>
	</figure>
</div>

#### Specular Diffusion
_Specular Deffusion_ defines how diffuse or sharp a specular highlight is.

<div class="pull-center">
	<figure style="display:inline-block;">
		<video autoplay loop muted playsinline style="height:150px;">
			<source src="/images/MNPRX/mnpr-uber/blinn-diffusion.mp4" type="video/mp4">
		</video>
		<video autoplay loop muted playsinline style="height:150px;">
			<source src="/images/MNPRX/mnpr-uber/anisotropic-diffusion.mp4" type="video/mp4">
		</video>
		<figcaption>Specular Diffusion (0...1.0).</figcaption>
	</figure>
</div>

#### Specular Transparency
_Specular Transparency_ defines the transparency of the specular highlight.

<div class="pull-center">
	<figure style="display:inline-block;">
		<video autoplay loop muted playsinline style="height:150px">
			<source src="/images/MNPRX/mnpr-uber/specular-transparency.mp4" type="video/mp4">
		</video>
		<figcaption>Specular Transparency (0...1.0).</figcaption>
	</figure>
</div>

### Specular-In-Alpha
The _Specular-In-Alpha_ setting is only visible if the [_Specularity_](#specularity) and [_Transparent_](#transparent-and-semi-transparent) settings are enabled. The setting forces the specularity on the transparent parts of an object, which were set through the [_Alpha Mask_](#alpha-mask) attribute. The specular in alpha setting also generates the [_Alpha Tint_](#alpha-tint) attribute in the _Shading_ section ([cyan attribute](#specular-AE))

<div class="pull-center">
	<figure style="display:inline-block;">
		<img src="/images/MNPRX/mnpr-uber/no-specular-in-alpha.png" alt="Without Specular-In-Alpha"  style="height: 150px">
		<figcaption>Without Specular-In-Alpha</figcaption>
	</figure>
	<figure style="display:inline-block;">
		<img src="/images/MNPRX/mnpr-uber/specular-in-alpha.png" alt="With Specular-In-Alpha"  style="height: 150px">
		<figcaption>With Specular-In-Alpha</figcaption>
	</figure>
</div>

#### Alpha Tint
_Alpha Tint_ darkens the alpha parts of the material with a specified color. This attribute is especially useful for materials like tinted windows.

<div class="pull-center">
	<figure style="display:inline-block;">
		<video autoplay loop muted playsinline style="height:150px">
			<source src="/images/MNPRX/mnpr-uber/alpha-tint.mp4" type="video/mp4">
		</video>
		<figcaption>Alpha Tint with a light red color.</figcaption>
	</figure>
</div>

------------------

### Displacement
The _Displacement_ setting enables the use of displacement within the material and creates a _Displacement_ section with [displacement attributes](#tessellation-factor) in the _Attribute Editor_. Once enabled, a new _Setting_ also appears underneath: [_displacementModel_](#displacementmodel).

<figure class="align-center">
	<img src="/images/MNPRX/mnpr-uber/displacement-AE.png" alt="Displacement section"  style="width: 500px">
	<figcaption>The Displacement section in the Attribute Editor.</figcaption>
</figure>

### displacementModel
The _displacementModel_ setting defines the displacement algorithm used by the _mnpr_uber_ shader. More importantly, it defines what kind of [_Displacement Map_](#displacement-map) it expects. Depending on where you got your displacement map from, this becomes quite relevant. _GrayScale_ is the simplest form of displacement map, in which the intensity of the map (white value) defines the amount of displacement given to the geometry.

#### Tessellation Factor
_Tessellation Factor_ defines the amount of subdivision within each polygon. The higher the factor, the more polygons are subdivided, giving more points to displace. There is no magic number, so you will need to find out how much tessellation is enough for your displacement purposes depending on the topology of each model.  

<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:150px">
   <source src="/images/MNPRX/mnpr-uber/tessellation-factor.mp4" type="video/mp4">
 </video>
 <figcaption>Displacement with different Tesselation Factors (1.0...10.0).</figcaption>
</figure>

#### Displacement Map
Specifies the file path to the _Displacement Map_. The path can be absolute or relative to the project root directory. The displacement map is different depending on what [_displacementModel_](#displacementmodel) is selected in _Settings_.  

#### Displacement Multiplier
_Displacement Multiplier_ defines the amount of displacement to use. The higher the value, the more displacement there will be.

<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:150px">
   <source src="/images/MNPRX/mnpr-uber/displacement-multiplier.mp4" type="video/mp4">
 </video>
 <figcaption>Displacement Multiplier (0...0.5).</figcaption>
</figure>

#### Flat Tessellation Blend
_Flat Tessellation Blend_ defines the amount of flatness within the tessellations (subdivisions). By default, tessellations smoothen the transitions between flat polygons, unless specified through this attribute.

<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:150px">
   <source src="/images/MNPRX/mnpr-uber/flat-tessellation-blend.mp4" type="video/mp4">
 </video>
 <figcaption>Flat Tessellation Blend (0...1.0).</figcaption>
</figure>

#### Displacement Offset
_Displacement Offset_ offsets parts of the displacement inward, instead of only outward.

<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:150px">
   <source src="/images/MNPRX/mnpr-uber/displacement-offset.mp4" type="video/mp4">
 </video>
 <figcaption>Displacement Offset (0...1.0).</figcaption>
</figure>

#### Clipping Bias Add
_Clipping Bias Add_ defines a small default value to avoid vertices clipping away from light view during the shadow map calculations.

------------------

### NormalMapTweaks
The _NormalMapTweaks_ setting enables more refined control over the [_Normal Map_](#normal-map) by creating the [_Invert U_ and _Invert V_](#invert) attributes within the _Shading_ section.

<figure class="align-center">
	<img src="/images/MNPRX/mnpr-uber/normal-map-tweaks-AE.png" alt="Normal Map Tweak attributes"  style="width: 500px">
	<figcaption>Invert U and Invert V attributes created by the Normal Map Tweaks setting.</figcaption>
</figure>

#### Invert
_Invert U_ and _Invert V_ invert the normal inclinations either horizontally or vertically, respectively.

<div class="pull-center">
	<figure style="display:inline-block;">
		<video autoplay loop muted playsinline style="height:150px;">
			<source src="/images/MNPRX/mnpr-uber/invert-u.mp4" type="video/mp4">
		</video>
		<video autoplay loop muted playsinline style="height:150px;">
			<source src="/images/MNPRX/mnpr-uber/invert-v.mp4" type="video/mp4">
		</video>
		<figcaption>Invert U and Invert V.</figcaption>
	</figure>
</div>

------------------

### maxLights
The _maxLights_ setting defines the maximum amount of lights considered by the material for its calculations.

---------------

## Advanced

**Modifying nodes inside of the ShaderFX material**
{: .top2 #modifying-shaderfx}

1. Open the [_ShaderFX graph_](#shaderfx-graph) within the desired material.
1. Change the _CustomGraph_ node at the top-level from `false` to `true`. This will avoid overwriting your changes upon a _ShaderFX_ update.
1. Modify the material to your heart's content and [create your own ShaderFX material](#creating-shaderfx), if needed.

**Set your own NoiseFX algorithms within the mnpr_uber material**
{: .top2 #procedural}

1. Remember which attribute is being modified within the material's _Stylization (procedural)_ section when modifying the desired _NoiseFX_ values.
1. Open the [_ShaderFX graph_](#shaderfx-graph) within the desired material.
1. Navigate to: `Material -> ForwardRenderPasses -> Color-DiffusePass -> Control Sets -> Procedural Control -> X Procedural`, where `X` is the procedural attribute that modifies the desired effect.
1. Depending on what kind of noise algorithm you use, you can hook up your own nodes within the _Noise2D_ or _Noise3D_ node.

**Create your own ShaderFX materials**
{: .top2 #creating-shaderfx}

You can create your own _ShaderFX_ materials and continue using the MNPRX tools with them.
1. [Modify](#modifying-shaderfx) the _mnpr_uber_ material to create your custom _ShaderFX_ network.
1. At the top-level of the _ShaderFX_ material, set the desired name of the graph in the _GraphName_ node.
1. If previously modified, change the _CustomGraph_ node from `true` to `false`. This will enable quick _ShaderFX_ updates in the future for materials with your graph name.
1. Export the entire graph `File->Export Graph` into `MNPRX->shaders` under the new graph name.
1. Create a new preset with the [_mPre_](./../material-presets) tool

Every time you load your preset, your shaderfx graph will now be loaded.

{% include toc-side %}
