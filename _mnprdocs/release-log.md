---
layout: publication
permalink: /software/MNPRX/release-log
title: MNPRX Release
excerpt: New MNPRX release!
type: Release
image:
  path: images/headers/MNPRX.jpg
  caption: Stylized rendering for Autodesk Maya
  card: images/cards/MNPRX.jpg
  thumbnail:
schema:
redirect_from:
  - /projects/MNPRX/release-log/

---

<figure class="pull-center">
	<a href="/software/MNPRX/#getit"><img src="/images/buttons/mnprx_getIt.jpg" alt="image"></a>
  <a href="./docs"><img src="/images/buttons/mnprx_documentation.jpg" alt="image"></a>
  <figcaption>As an MNPRX user, you will automatically get the latest version of MNPRX upon release!</figcaption>
</figure>


---

## December 2019 UPDATE
The December 2019 update has taken a long time to come out, but we hope to make the wait worth it! 

We have worked hard with one of our clients to develop a [_Frayed_](/styles/frayed/) style, which is inspired by the look of short films like _Feast_ and _Age of Sail_. We are including the style with this release, pushing MNPRX further than ever before!

While doing so, we revamped the way [_PaintFX_](/software/MNPRX/docs/paintfx/) are handled to make scenes lighter, developed a way to bake NoiseFX onto animated objects and made [_NoiseFX_](/software/MNPRX/docs/noisefx/) more intuitive to use at different scene world scales.

On our existing styles, we've made improvements to the dry-brush effect in the watercolor stylization and on stabilizing the line/point patterns in the hatching stylization under animation. 

We've also tried to address most issues that some of you have been having, so thank you for sharing your valuable feedback with us! We will focus on creating tutorials on all these new features in the coming weeks.

**Upgrading notes**:  
**_Materials_** - Make sure to also [update the materials in the scene](/software/MNPRX/docs/update/#materials) to take advantage of the latest features with the PaintFX and NoiseFX tools and to use the import/export stylization tool in the future.
{: .notice--info}

### Frayed Stylization

_New_ - Inspired by the look of short films like _Feast_ and _Age of Sail_, our _Frayed Stylization_ brings real-time rendering with frayed edges directly within _Autodesk Maya_. Find out more [**here**](/styles/frayed/).
{: .top-1}

<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/FR/showcase.mp4" type="video/mp4">
	</video>
	<figcaption>3D frayed animation in real-time.</figcaption>
</figure>


### MNPRX
**Viewport rendering**
* _Improved_ - Performance with VelocityPV enabled has been drastically improved
* _Fixed_ - Automatically disable MSAA to avoid wrong output within the viewport
* _Fixed_ - The substrate doesn't sometimes dissapear anymore when the resolution changes

**Watercolor**
* _New_ - Added a custom dry-brush color and improved upon the dry-brush effect
* _Fixed_ - Bleeding now appears automatically when new scenes are created or opened
{: .top-1}

**Hatching**
* _New_ - Hatching and stippling patterns can now be baked onto objects by enabling the deformed setting within the hatching materials.

**Installation**
* _Fixed_ - Installation will automatically delete MNPRX shelves that might have saved themselves locally though Maya's preferences.
{: .top-1}

**PaintFX**  
* _Fixed_ - Vertex control sets are now created on-demand, drastically reducing scene size.
* _Fixed_ - Unnecessary history nodes are automatically deleted.
{: .top-1}

**NoiseFX**  
* _New_ - Baking of _NoiseFX_ now allows you to bake the current 3D noise pattern so that it works with animation and deformed objects. NoiseFX with 2D noise is thereby deprecated.
* _New_ - World scale of NoiseFX is now directly linked to the world scale of the scene (_World Scale_ attribute in the _config_ node), making the default scale of each effect work predictably with scenes of different world scales.
{: .top-1}

**Import/Export**
* _Improved_ - Smaller file sizes for exported styles
* _Improved_ - Progress bar when importing/exporting styles
{: .top-1}

**MNPRX Shelf**
* _Updated_ - Updated MNPRX info and Support (prev. Feedback) icons to direct users to the related page on our website.
{: .top-1}

**Documentation**
* _New_ - Frayed [documentation](/styles/frayed/).
* _New_ - Art-direction control [documentation](/software/MNPRX/docs/controls/)
* _New_ - Tutorial on [**Avoiding the Shower Door Effect in MNPRX**](https://www.youtube.com/watch?v=eMU4GMQNEs0).
{: .top-1}

### Stylizations in Nuke
{: .top2}
* _New_ - The frayed stylization in Nuke 
* _Updated_ - The watercolor stylization in Nuke has been updated to support the November 2019 release of MNPRX.
* _New_ - Refer to the art-direction control [documentation](/software/MNPRX/docs/controls/) to create your own control textures within Nuke.

---

## SEPTEMBER 2019 UPDATE
The September 2019 update is focused on new styles and overall stability! We have worked on a new _Hatching_ style with one of our clients, and are releasing an alpha version thereof for you all to have fun with! Our watercolor stylization has also gotten some love, as we have improved the edge-based effects and overall control over the pigment density and paper granulation. While working on these styles, we spent some time squashing bugs that you have let us know of.

**Upgrading notes**:  
**_Watercolor_** - The _pigment density_ in the configuration node needs to be reduced to match the perceived pigment concentration that you previously had (prev. 5.0, new default is 1.0). The _edge intensity_ attribute might also need to be lowered a bit as we have normalized the edges throughout the image.  
**_Materials_** - Make sure to also [update the materials in the scene](/projects/MNPRX/docs/update/#materials) to take advantage of the alpha masking bug fix.
{: .notice--info}


### Hatching Stylization

_New_ - The _Hatching Stylization_ brings real-time hatching rendering of 3D objects and animation directly within _Autodesk Maya_ through _MNPRX_. Find out more [**here**](/styles/hatching/).
{: .top-1}

<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/HG/showcase.mp4" type="video/mp4">
	</video>
	<figcaption>3D Hatching animation in real-time.</figcaption>
</figure>

### MNPRX
**Viewport rendering**
* _Fixed_ - Rendering in non-linear image file formats (all except .exr) is now properly color managed. Supported are: 1.8 gamma, 2.2 gamma, Rec 709 gamma, sRGB gamma and Raw. As long as you use these color corrections, rendering will give you the exact colors as what you see in the viewport.
* _Improved_ - Added atmospheric tint support to orthographic renders. Range distance 0 will be at the origin.
{: .top-1}

**MNPRX Materials**
* _Fixed_ - Using alpha masks within transparency will not break the object sorting given by Maya anymore.
{: .top-1}

**Watercolor**
* _New_ - _Edge Darkening_ type control has been added. 'Advanced' edge darkening more faithfully reproduces edge darkening behavior found in traditional watercolors and reduces edges created from gradients. You may switch the type to 'Simple' mode if you still desire to use the old edge darkening approach.
* _New_ - Control over the _Pigment Density_ and _Paper Granulation_ has been separated for better control and nicer paper granulation results. **Because of this, the _Pigment Density_ will need to be reduced to match the perceived pigment concentration that you previously had in stylized scenes (prev. 5.0, new default is 1.0).**
{: .top-1}

**Installation**
* _Fixed_ - Installing MNPRX will delete any empty lines that the Maya.env file might have had to avoid _Maya_ not recognizing the plugin.
{: .top-1}

**Configuration Node**  
* _Fixed_ - Bug that didn't save all attributes with the scene.
{: .top-1}

**PaintFX**  
* _Fixed_ - Bug that sometimes messed up the painting of effects.
{: .top-1}

**Documentation**
* _New_ - Hatching [documentation](/projects/hatching/).
* _Updated_ - Finished the [**Stylizing a Scene**](./docs/stylizing-scene/) tutorial series, featuring the stylization of a production shot from _Run Totti Run_ by _Shad Bradbury_!
* _New_ - Tutorial on getting the most out of [**Shadow Maps in the Maya Viewport**](https://www.youtube.com/watch?v=j2Oy3djmQZk).
{: .top-1}

### Watercolor stylization in Nuke
{: .top2}

* _Updated_ - The watercolor stylization in Nuke has been updated to support the August 2019 release of MNPRX (September 2019 update coming soon).
* _New_ - Documentation on compositing MNPRX stylizations in Nuke and MNPRX AOV's Explained now [found in the documentation](./docs/compositing-nuke/).

---



## AUGUST 2019 UPDATE
The August 2019 update is focused on improving the functionality of MNPRX and its tools. We now support normal _Maya_ materials within _MNPRX_ stylizations, rim lights and have improved tools for better production workflows. Make sure to also [update the materials in the scene](/software/MNPRX/docs/update/#materials), to use the rim lights within the uber material.

### MNPRX
**Viewport rendering**
* _New_ - Maya materials are also supported by _MNPRX_ now, making _Viewport+_ the perfect option for higher quality viewport renders. Do keep in mind that _NoiseFX_ and _PaintFX_ only work with MNPRX materials.
* _Improved_ - Ambient occlusion has been improved upon and can now be used with any material and in scenes with big world scales.
* _Improved_ - The _Atmosphere Tint_ is now deactivated for orthographic views.
* _Fixed_ - Minor bug that didn't TAA the image when de-selecting objects.
* _Fixed_ - Minor bug that didn't show the substrate properly upon changing between textures of different resolutions.
{: .top-1}

**MNPRX Materials**
* _New_ - _Rim Lights_ setting and attributes have been added to the [uber material](./docs/uber#rim-light).  
{: .top-1}

**MNPRX Toolbox**
* _New_ - _Bulk Attribute_ tool now available for _Indie/Studio_ licenses. The tool will allow you to change _ShaderFX_ settings in bulk. It will be expanded to change normal attributes in the future, as well.
{: .top-1}

**Watercolor**
* _Fixed_ - Pigment dilution now also dilutes ambient occlusion.
{: .top-1}

**MNPRX Shelf**
* _New_ - A point light shelf icon has been included in the _MNPRX_ shelf. Point light support is limited by _Maya_'s _ShaderFX_ framework, so you won't be able to cast point light shadows in _MNPRX materials_.
{: .top-1}

**Material Presets**  
_New_ - Redesigned and more powerful material presets window. From top to bottom, the updates are as follows:
* _Improved_ - Save presets by pressing enter after writing the name (save button still there if you prefer a mouse)
* _New_ - Load attributes checkbox allows you to not load the attributes in case you are only interested in loading the _NoiseFX_ or textures of an existing preset
* _New_ - Filter presets by name or by material type
* _Improved_ - Double click on a preset to load it on the selected objects
{: .top-1}

**Style Presets**  
_New_ - Redesigned and more powerful stylization presets window. From top to bottom, the updates are as follows:
* _Improved_ - Save presets by pressing enter after writing the name (save button still there if you prefer a mouse)
* _New_ - Loading options for stylizations, giving control over loading the world scale, attributes, quality and substrates.
* _New_ - Filter presets by name or by stylization
* _Improved_ - Double click on a preset to load it
{: .top-1}

**Import/Export**
* _Improved_ - Optimized file size when exporting stylization
{: .top-1}

**Documentation**
* _New_ - Next two tutorials on [Stylizing a Scene](./docs/stylizing-scene/): Matching Materials and Matching Lighting, featuring the stylization of a production shot from _Run Totti Run_ by _Shad Bradbury_.
* _Updated_ - All existing documentation to match the August 2019 release i.e., [MNPRX Shelf](./docs/shelf/), [MNPRX Toolbox](./docs/toolbox/), [Uber Material](./docs/uber/), [Material Presets](./docs/material-presets/) and [Stylization Presets](./docs/style-presets/).
{: .top-1}

---

## JULY 2019 UPDATE
The July 2019 update of MNPRX includes a completely new [Cutout Stylization](/styles/cutout/), together with our own implementation of _Ground Truth Ambient Occlusion_ (_GTAO_)! These two features, together with a series of smaller new features, improvements and fixes, make the July update a substantial improvement for _MNPRX_. Just make sure to also [update the materials in the scene](/software/MNPRX/docs/update/#materials), to be sure that you are using all the latest features of this update.

### MNPRX

[**Cutout Stylization**](/styles/cutout/)

_New_ - The _Cutout Stylization_ brings real-time cutout rendering of 3D objects and animation directly within _Autodesk Maya_ through _MNPRX_.
{: .top-1}

<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/CO/showcase.mp4" type="video/mp4">
	</video>
	<figcaption>3D Cutout animation in real-time.</figcaption>
</figure>

**Viewport rendering**
* _New_ - Render with _Ground Truth Ambient Occlusion_ (_GTAO_) to emulate ambient lighting.
* _New_ - Visualize and stylize normal _Viewport 2.0 Maya_ materials (_NoiseFX_, _PaintFX_ and _GTAO_ are only supported with _MNPRX_ materials).
* _Fixed_ - The Target Sequence Renderer can also render and save images from cameras within namespaces.
{: .top-1}

**Watercolor Stylization**
* _New_ - Ambient occlusion can concentrate pigment density within the watercolor stylization.

**Substrates**
* _New_ - Rotation attribute on each substrate.
* _New_ - Thorough control over the _Alternate Substrate_

**Material Presets**
* _Improved_ - Material presets do not force to load-up materials within the _MNPRX_ renderer anymore, you can use the normal _Viewport 2.0_ with it, if desired.
* _Improved_ - Material presets automatically check and clean connected Shading Engines to work properly with certain material setups.
{: .top-1}

**MNPRX Materials**
* _Improved_ - The noise created through the _NoiseFX_ tool will not be stretched along one direction anymore.

**MNPRX Shelf**
* _New_ - Double clicking on `mat` will now reload the _Attribute Editor_ of the material, forcing the _ShaderFX_ material to show all its attributes.
* _New_ - Selecting all objects that share the assigned material can now be done directly from the _MNPRX_ shelf by right-clicking on `mat` -> Select objects with material.
{: .top-1}

**Licensing**
* _New_ - installing MNPRX will check for an existing license and automatically ask the user what to do with it. This will make transitions from _Non-Commercial_ to _Indie/Studio_ much easier by simply re-installing _MNPRX_ and deleting the existing license to enter the new one.
{: .top-1}

**Documentation**
* _New_ - Cutout stylization [**documentation**](/styles/cutout/).
* _New_ - Tutorial series on [Stylizing a Scene](./docs/stylizing-scene/) in progress, featuring the stylization of a production shot from _Run Totti Run_ by _Shad Bradbury_.
* _New_ - Tutorial for [Rendering a Scene](./docs/rendering-scene/).
* _New_ - Thorough documentation on [Art-direction](./docs/art-direction/), including breakdowns on the [_NoiseFX_](/docs/noisefx/) and [_PaintFX_](docs/paintfx/) tools.
* _New_ - Thorough documentation on the [MNPRX Toolbox](./docs/toolbox/).
* _Updated_ - All existing documentation to match the July 2019 release i.e., [MNPRX Shelf](./docs/shelf/) and [Configuration node](./docs/config/).
{: .top-1}

### Watercolor stylization in Nuke
{: .top2}

The watercolor stylization is now also available for _Nuke_ in _Indie_ and _Studio_ licenses, allowing to re-create the style and tweak it further in compositing. More details on where to get it and how to take advantage of it can be [found in the documentation](./docs/watercolor-nuke/).

---

## JUNE 2019 UPDATE
The June 2019 update of MNPRX is the biggest yet! We've developed many things to improve the overall experience and to continue moving forward with our planned development. Because of this, a re-installation of MNPRX is required on any computer that has a previous installation running. We apologize for this inconvenience, but hope the new features will make up for it.

### MNPRX
{: .bottom05}

[**Viewport rendering**](./docs/rendering)

_New_ - Viewport rendering has been completely re-implemented to be handled entirely through _MNPRX_.
{: .top-1}

* Render with _Temporal Anti-Aliasing_ (TAA) for progressive super-sampled results.
* Abstracted quality for the viewport, rendered images and image sequences within 5 different modes: _Half_, _Standard_, _FXAA_, _4x SSAA_ and _TAA_.
* Render out images and image sequences in multiple image file formats (_.png, .jpg, .exr, .tif, .iff_).
* Create quick playblasts in all formats supported by your computer.
* Rendered images, image sequences and playblasts should have the same colors that you see in the viewport (except for _.exr_ images which are in linear space).
* Define alpha of the rendered images and image sequences as _None_, _Linear_, or _Premultiplied_ (only within formats that support alpha channels).
{: .top-1}

**PaintFX**
* _New_ - Numerical value for painting amount can now be directly seen and modified within _PaintFX_.
* _New_ - Pressure sensitivity is enabled when painting with a stylus.
* _Improved_ - Intuitive _undo_ operations within PaintFX.
* _Improved_ - No more flickering of the in-use brush icon.
* _Improved_ - Automatic switch between _NoiseFX_ and _PaintFX_ without re-selecting the objects.
{: .top-1}

**NoiseFX**
* _Improved_ - Intuitive _undo_ operations within NoiseFX (except for reset and on/off toggle).
* _Fixed_ - Reset and on/off noise toggle now flush the undo queue when used to avoid _Maya_ crashes
(Solving these crashes seem to be outside of our power as it relies on fixing the ShaderFX implementation).
{: .top-1}

**Material Presets**
* _Fixed_ - When multiple objects share a material, _Create New Material_ will now just create the material within the selection.
* _Improved_ - Loading a material on an object with the default _Lambert1_ material won't load the material on all objects sharing it.
* _New_ - ID material presets have been added.
{: .top-1}

**Usability**
* _Improved_ - Scene stylization will be automatically loaded when opening a stylized scene.
* _Improved_ - Velocity vertex data is only computed by the required geometry.
* _Improved_ - Velocity vertex data is discarded when no longer required, reducing scene size.
* _Fixed_ - Bug where the attribute editor sometimes didn't show the _ShaderFX_ attributes.
* _Fixed_ - Memory leak when resizing the viewport.
* _Fixed_ - Memory leak when loading different substrate textures.
{: .top-1}

**Installation**
* _New_ - MNPRX environment variables are now handled by a plugin distribution module, avoiding clashes with environment variables from the host system.
* _Fixed_ - Installing MNPRX won't modify the existing order of environment variables within the host computer, minimizing clashes that it may have with other installed plugins that may depend on this.
{: .top-1}

**Licensing**
* _New_ - Using MNPRX now requires a valid license. Upon first use, you will be prompted to either enter the activation code that came with your purchase of _MNPRX Indie/Studio_ or activate _MNPRX Non-Commercial_.
  * Please refer to the [licensing documentation](./docs/licensing) for details.
{: .top-1}

---

## APRIL 2019 UPDATE

### MNPRX
{: .bottom05}

**MNPR Material**
* _Improved_ - Streamlined _mnpr_uber_ material with [documentation](/software/MNPRX/docs/uber).
* _Improved_ - Streamlined _mnpr_geoproxy_ material with [documentation](/software/MNPRX/docs/proxy).
{: .top-1}

**MNPRX Shelf**
* _Improved_ - Streamlined _MNPRX_ shelf with [documentation](/software/MNPRX/docs/shelf).
* _New_ - [MNPRX documentation](/software/MNPRX/docs) added under the _MNPRX_ shelf icon.
* _New_ - [MNPRX issue/feedback tracker](https://github.com/artineering-io/MNPRX/issues) added under the _FEEDBACK_ shelf icon.
{: .top-1}

**Viewport Rendering**
* _Fixed_ - Playblasts using the _rendr_ tool come out with proper color correction again with _Maya_ 2018.3, onwards (fix of MAYA-88922 bug caused a double color correction).
{: .top-1}

**Documentation**
* _New_ - Thorough documentation on Basics: [Installation](/software/MNPRX/docs/installation), [Updating MNPRX](/software/MNPRX/docs/update), [MNPRX Shelf](/software/MNPRX/docs/shelf).
* _New_ - Thorough documentation on Styles: [Presets](/software/MNPRX/docs/style-presets), [Configuration](/software/MNPRX/docs/conf), [Import/Export](/software/MNPRX/docs/import-export).
* _New_ - Thorough documentation on Materials: [Presets](/software/MNPRX/docs/material-presets), [Uber Material](/software/MNPRX/docs/uber), [Proxies](/software/MNPRX/docs/proxy).
{: .top-1}

---

## MARCH 2019 UPDATE

### MNPRX
{: .bottom05}

[**Stylization Import/Export tool**](./docs/import-export)

New tool that allows the artist to Import/Export the stylization of either the selected objects or of the entire scene.
The stylization settings that can be exported/imported include:
{: .top-1}

* Style parameters (mnprConfig node attributes).
* MNPR materials (with NoiseFX and material attributes).
* PaintFX (all painted parameters).
* Proxies (the geometry proxies, their material and painted parameters).
{: .top-1}

The tool is name-based, but supports the Import/Export between different namespaces. The stylization can also be imported on scenes where there were no prior MNPRX materials, as long as names of the objects remain consistent.

**Viewport Rendering**
* _New_ - Viewport Rendering now also matches the resolution gate, when in use.
* _Fixed_ - Memory leak that used all available system memory when rendering out big image sequences.
* _Fixed_ - Texture samplers not being recognized until the shaders were reloaded i.e., no more weird pixels at the borders of the images.
* _Fixed_ - Assigned substrate not showing when opening a scene from scratch.
{: .top-1}

### Watercolor stylization in Nuke
{: .top2 .bottom05}

* _New_ - Added sample usage of background plates in the stylization pipeline.
* _New_ - MNPRX stylization can now be imported within the stylization options.
* _Fixed_ - Depth target provoking weird edge darkening lines.

---

## FEBRUARY 2019 UPDATE

### MNPRX
{: .bottom05}

**MNPR Material**
* _Optimized_ - Compilation times have been drastically reduced (up to 20x) by optimizing the node network to get rid of redundant shader code. Changing Settings and recompiling the material should now be immediate.
* _New_ - Real-time Displacement and tessellation have been added to the _mnpr_uber_ material. These can be activated within the material Settings. (DX11+ hardware is required for this).
* _Fixed and improved_ - Support for light maps has been improved and a bug regarding the use of diffuse factor with light maps has been fixed. Light maps can be activated within the material Settings, whereas vertex painted lighting is always active.
* _Improved_ - Cangiante algorithm has been improved for better results with mapped textures. The attribute defaults to 0.6 now and can go up or down until the desired result is achieved.
* _Reorganized_ - The material attributes have been reorganized for more intuitive control. The _Highlights_ attributes are not shown by default anymore, but can be activated through _Settings_.
{: .top-1}

**Watercolor**
* _Fixed_ - Bleeding when no objects are behind is now working again as expected.
{: .top-1}

**Usability**
* _New_ - A textured material preset has been added in the _mPre_ tool. Loading this preset will retain the textures of the prior material (i.e., _mnpr_uber_, _lambert_) and set all attributes required for a textured workflow.
* _Improved_ - Creating/Loading a new material will now keep the name of the previously assigned one.
{: .top-1}

**Licensing**
* _Improved_ - A less aggressive licensing method has been created that will always allow to load and work with MNPRX. However, it won't be possible to render images past the licensing date.
{: .top-1}

---

## JANUARY 2019 UPDATE

### MNPRX
{: .bottom05}

**MNPR Material**
* _New_ - Art-directable shading has been added to the _mnpr_uber_ material. Artists can now control light directly on the object through _lightmaps_, _paintFX_ or _noiseFX_.
Lightmaps within the material can be activated on demand in the _Settings_ of the material itself. Art-directable shading is found by default within the _paintFX_ and _noiseFX_ tools. Art-directed shading is strongly dependent on the _Diffuse Factor_ attribute. Therefore, an additional _Shade_ attribute has been added to the material to separately control the lighting contribution from lights. It is highly encouraged to read the [documentation](./docs/lighting#lightmaps) to fully understand how art-directable shading can be effectively used.
* _Fixed_ - Issue with depth in semi-transparent objects not rendering and certain depth-dependent stylization effects now working properly.
{: .top-1}

**PaintFX**
* _Improved_ - Highlight brush that is currently in use.
{: .top-1}

### Watercolor stylization in Nuke
{: .top2 .bottom05}
* _Improved_ - Updated stylization pipeline to support the latest changes in MNPRX.

---

## NOVEMBER 2018 UPDATE  

### MNPRX
{: .bottom05}

**MNPR Material**
* _New_ - Semi-transparency support added to _mnpr_uber_ material.
* _Improved_ - _Shade Override_ and _Shade Wrap_ attributes can now be used together
{: .top-1}

**PaintFX**
* _Fixed_ - Issue of objects appearing white after another object with the same material was being painted.
{: .top-1}

### Watercolor stylization in Nuke
{: .top2 .bottom05}
* _New_ - Added [sample usage](https://1drv.ms/v/s!Arb19fQ9R1Nhjf5erCNkFo8on1xV2Q) stylizing images rendered with an external renderer e.g., [_Arnold_](https://1drv.ms/v/s!Arb19fQ9R1Nhjf5fMsGYdbbldnuS_g), _Renderman_.
* _Fixed_ - Issue where color bleeding was not as strong in Nuke as in Maya.

---

## OCTOBER 2018 UPDATE

### MNPRX
{: .bottom05}

[**Viewport Rendering**](./docs/rendering)
{: .bottom05}

_New_ - Tool to batch render any render target (images/gBuffers) out of MNPRX. You can specify the following within the user interface:
* Render targets (images/gBuffers) to save
* Custom output folder
* Frame resolution
* Frame range
* Multiple camera views
{: .top-1}
The artist can cancel the render at any time and all targets are saved within one pass.

**Substrates**
* _New_ - Motion-driven substrates (dynamic canvas) that allow for motion coherent substrate-based effects. Activate the _Velocity PV_ attribute in the _mnprConfig_ node to activate it.
* _Improved_ - Controllable substrate tiles through the _Substrate Tile_ attribute.
* _New_ - Smooth/rough transition between tiles by activating the _Substrate Tile Blend_ attribute.
* _New_ - Support for substrate blending between two specified textures with the _Substrate Blend_ attribute.
{: .top-1}

**Watercolor**
* _Improved_ - No more _Depth Range_ or _Bleeding Threshold_ attribute required for watercolor effects to behave correctly.
{: .top-1}


---

## SEPTEMBER 2018 UPDATE

### [Watercolor stylization in Nuke](./docs/watercolor-nuke)
{: .bottom05}

_New_ - The watercolor stylization pipeline in _The Foundry_'s _Nuke_. This node network allows to recreate the _MNPRX_ watercolor stylization out of render targets exported from _Maya_.

---

## JULY 2018 UPDATE

### MNPRX
{: .bottom05}

**Viewport Rendering**
* _Fixed_ - Edge artefacts in alpha channel when _FXAA_ was on
{: .top-1}

**Substrates**
* _Improved_ - Extended the range of substrates (papers) to use.
* _Improved_ - Substrates can be downloaded from within the shelf
  ``RMB on _MNPR_ shelf icon -> Download substrates``.
{: .top-1}

---

## JUNE 2018 - Open-Source release of [MNPR](../Maya-NPR)
