---
layout: documentation
title: Rendering
type: Docs
excerpt: All about rendering in MNPRX
tags: [Docs, MNPRX]
comments: true
schema:
---

Rendering with MNPRX is a breeze compared to rendering with offline renderers, as every frame is calculated in real-time! In fact, computers normally take longer to save image files to disk than to render them.
{: .top2}

There are many ways to get images out of _Maya_, but we strongly recommend the tools that we have developed to get the best and most consistent results, the _Viewport Renderer_ (`rendr` icon in the _[MNPRX shelf](../shelf)_) and the _Target Sequence Renderer_ (`tSeq` icon  in the _[MNPRX shelf](../shelf)_). These two tools will allow you to render images of up to 16K resolution  (16384×16384) with a graphics card supporting it.

<figure class="pull-right">
	<img src="/images/MNPRX/rendr.png" alt="Viewport Renderer"  style="width: 300px">
	<figcaption>The Viewport Renderer captures frames and creates playblast.</figcaption>
</figure>


## Viewport Renderer
The _Viewport Renderer_ is a simple tool to render images and videos, divided into two sections: _Frame Capture_ (save image) and _Quick Playblasts_ (save video).

### Frame capture
The upper section of the _Viewport Renderer_ contains all options to capture a frame (image).

On the left side, you can define a custom resolution to render at. If left unchecked, the viewport resolution will be taken into consideration when rendering.

On the right side, you can find the settings to render with.
* _Quality_ - Defines the quality of the viewport rendering and correlates with the [quality settings of the configuration node](/projects/MNPRX/docs/config/#quality). _TAA_ gives the best visual quality and is the default in the _Indie_ and _Studio_ licenses of _MNPRX_.
* _Alpha_ - Defines how the alpha (transparency) is handled in the rendered frames. The options are _None_ (no alpha), _Linear_ (linear alpha) and _Premult._ (premultiplied alpha).
* _Format_ - Defines the image file format to save the image as i.e., _.png, .jpg, .exr, .tif, .iff_.

_.exr_ images will be in linear space, so you will have to do the gamma correction yourself for the results to look as they appear in _MNPRX_.
{: .notice--info}

The `Render` button will capture/render the frame in the directory you specify.

### Quick Playblast
The lower section of the _Viewport Renderer_ contains all options to create a quick playblast (video).

On the left side, you can define where to get the playblast resolution from. _From Viewport_ will get the viewport resolution to playblast with. _From Render Settings_ will get the [_Render Settings_](https://knowledge.autodesk.com/support/maya/learn-explore/caas/CloudHelp/cloudhelp/2019/ENU/Maya-Rendering/files/GUID-59DFB8B7-776B-4243-B404-A3D602FF8CFD-htm.html) resolution to playblast with.  

On the right side, you can find the settings to playblast with.
* _Quality_ - Defines the quality of the viewport rendering and correlates with the [quality settings of the configuration node](/projects/MNPRX/docs/config/#quality). _4x SSAA_ gives the best visual quality within playblasts and is the default in the _Indie_ and _Studio_ licenses of _MNPRX_. To use _TAA_ quality, you'll have to render an image sequence with the [_Target Sequence Renderer_](/projects/MNPRX/docs/rendering/#target-sequence-renderer) tool and create the video yourself.
* _Format_ - Defines the video file format to save the playblast as i.e., _.avi, .mov (qt)_. The video file format will depend on what codecs your computer currently supports.

The `Playblast` button will playblast the video in the directory you specify.


<figure class="pull-right">
	<img src="/images/MNPRX/tSeq.png" alt="Target Sequence Renderer"  style="width: 500px">
	<figcaption>The Target Sequence Renderer saves image sequences of any MNPRX target.</figcaption>
</figure>

## Target Sequence Renderer
The _Target Sequence Renderer_ is a tool that allows to easily render any target/s as image sequences. The tool itself is divided into three sections: _Directory_, _Targets_ and _Settings_.

### Directory
The upper section of the _Target Sequence Renderer_ allows you to specify where the image sequence is going to be saved in. By default, your current project's directory will be set, but you can define any directory by clicking on the `Browse` button and navigating to your desired path.

### Targets
The left section outlines all internal targets available to render. By default, all targets that are required to replicate the stylization in a compositing application are pre-selected. This allows you to have the same stylization in, for example, _Nuke_ and have complete freedom to push the look further in _comp_. We've already replicated the [watercolor stylization in _Nuke_](/projects/MNPRX/docs/watercolor-nuke/), but the ability to export MNPRX's internal targets will become especially relevant in the future (we have big plans for this, stay tuned!).

Internal render targets (all except _outputTarget_) should be exported as _.exr_ to preserve the embedded linear floating data of each image.
{: .notice--info}

When exporting the _outputTarget_, all other targets will automatically be disabled and the _Render settings_ on the right section will be enabled. The _quality_ and _alpha_ can only be modified for the _outputTarget_.

### Settings
The right section of the _Target Sequence Renderer_ allows you to define all the sequence render settings. By default, the name will be that of your scene, but you can customize it however you want.

**Folder structure** defines the folders that will be created within the directory. By default, only a name folder will be created. Additional folders can be created, if desired, for each camera and target that you render. The hierarchy will look something like this `directory/name/camera/target/image.ext`.

**Render settings** allow you to customize the _quality_, _alpha_ and _format_ of the image sequence. It works in the same way as the [Viewport Renderer](/projects/MNPRX/docs/rendering/#frame-capture)'s _Frame Capture_ settings.
* _Quality_ - Defines the quality of the render and correlates with the [quality settings of the configuration node](/projects/MNPRX/docs/config/#quality). _TAA_ gives the best visual quality and is the default in the _Indie_ and _Studio_ licenses of _MNPRX_.
* _Alpha_ - Defines how the alpha (transparency) is handled in the rendered image sequence. The options are _None_ (no alpha), _Linear_ (linear alpha) and _Premult._ (premultiplied alpha).
* _Format_ - Defines the image file format to save the image sequence as i.e., _.png, .jpg, .exr, .tif, .iff_.

**Resolution** allows you to define a custom resolution to render with. You can specify the width and height individually up to 16384 pixels, if your graphics card supports it. A dedicated GPU should be able to render images of up to 8K without much trouble.

**Frame range** defines the start and end of the target sequence in the timeline.

**Camera views** outlines the available cameras in the scene and allows you to select which views you want to render the sequence through. By default, all cameras set as 'renderable' in _Maya_'s [_Render Settings_](https://knowledge.autodesk.com/support/maya/learn-explore/caas/CloudHelp/cloudhelp/2019/ENU/Maya-Rendering/files/GUID-59DFB8B7-776B-4243-B404-A3D602FF8CFD-htm.html) will be selected.

The `Render targets` button will start rendering the target sequence with the settings you specified. You can cancel the sequence render anytime by hitting on `cancel` within the render progress dialog.


## FAQ
_**When rendering with TAA, the render comes out shifted**_<br>
This will happen when the `2D Pan/Zoom` is used in the camera you are rendering (`Camera Shape Attributes -> Display Options -> 2D Pan/Zoom`). We discourage from using this function with MNPRX at the moment, but we might add this in the future if [requested by the community](https://community.artineering.io/topics/1307804).

{% include toc-side %}
