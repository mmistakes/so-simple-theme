---
layout: documentation
title: MNPRX uber material
type: Docs
excerpt: Breaking down the painterly MNPRX uber material
tags: [Docs, MNPRX]
comments: true
schema:
---

Materials give the surface properties to 3D objects, which are then projected to an image. Therefore, it is crucial to understand what features materials can provide, especially in a non-photorealistic rendering context where everything is possible. It can take some time to fully master the _mnpr_uber_ material, but hopefully this documentation will make the learning curve manageable.
{: .top2}

The _mnpr_uber_ material is developed to meet most painterly shading requirements in real-time. Built using the _ShaderFX_ framework, it is entirely contained within the node-based _ShaderFX Graph_ and can be modified to fit any shading requirements by look development artists. However, most settings and attributes are easily accessible from the _Attribute Editor_ when the material is selected, as shown below.


-------------

<figure class="align-right">
	<img src="/images/MNPRX/mnpr-uber/node.png" alt="MNPR uber material configuration node"  style="width: 400px">
	<figcaption>The default mnpr_uber material in the Attribute Editor.</figcaption>
</figure>

The first element within the _mnpr_uber_ material is the `Open ShaderFX` button. This button will open the _ShaderFX Graph_, which allows complete control to customize the material with nodes. The graph is intended for shader writers or advanced users who know how to manipulate and work with the _ShaderFX_ framework. Using the _ShaderFX_ framework is outside of the scope of this documentation, but, if interested, I recommend you to watch [these tutorials](https://www.youtube.com/watch?v=wWc9_eqbGUI&list=PLOKJUFwsV5SotMRNNxxmbVjlyz7R7mdoc).
{: .top2}

The first section, when opened, provides the material _Settings_ that allow to customize what optional features the _mnpr_uber_ material should have. It's closed by default, as it's a rather advanced section that artists won't use much. However, we'll go into detail with each setting [further on](#Settings). Let us concentrate now on the default material _Attributes_.

{% include aio-hint.html %} **Almost all attributes shown in the _mnpr_uber_ material go between `0` and `1`. The ShaderFX framework unfortunately maxes out the sliders of attributes at their default value.**

## Painterly Shading

Painterly shading attributes focus on bringing colors into the foreground of shading control and work differently than most attributes found in photorealistic renderers. This doesn't mean that they can't be combined with normal _Shading_ parameters, but they require 3D artists to go back to thinking in terms of colors and light. The first group of attributes control the color in the lit parts of the objects, whereas the second group of attributes (from _Shade Override_ onwards) control the color in the shade of objects.

### Cangiante
Cangiante illumination is an attribute that changes the hue of the lit area towards a brighter and saturated related color. This attributes can also be used to enhance the color of any applied _Albedo Texture_.

<figure class="pull-center">
 <video autoplay loop muted playsinline style="width:200px">
   <source src="/images/MNPRX/mnpr-uber/cangiante.mp4" type="video/mp4">
 </video>
 <figcaption>Cangiante illumination between 0 and 2.</figcaption>
</figure>

#### Cangiante Area

**Documentation still in progress, rest is coming soon.**
{: .notice--warning}

### Dilute Paint
#### Dilute Area
#### Dilute Color

### Shade Override
### Shade Color
### Diffuse Factor
### Shade Wrap
#### Wrap Intensity

## Shading
### Shade
### Color Tint
### Albedo Texture
#### Albedo Texture File
### Normal Map
#### Normal Map File
#### Invert U
#### Invert V
#### Bump Depth

## Settings
{: #Settings}



## Advanced

{% include toc-side %}
