---
layout: publication
permalink: /projects/MNPRX/release-log
title: MNPRX Release
excerpt: New MNPRX release!
type: Release
image:
  path: images/headers/MNPRX.jpg
  caption: Stylized rendering for Autodesk Maya
  card: images/cards/MNPRX.jpg
  thumbnail:
schema:
---

<figure class="pull-center">
	<a href="./#getit"><img src="/images/buttons/mnprx_getIt.jpg" alt="image"></a>
  <a href="./docs"><img src="/images/buttons/mnprx_documentation.jpg" alt="image"></a>
  <figcaption>As an MNPRX user, you will automatically get the latest version of MNPRX upon release!</figcaption>
</figure>

---

### JUNE 2019 UPDATE
The June 2019 update of MNPRX is the biggest yet! We've developed many things to improve the overall experience and to continue moving forward with our planned development. Because of this, a re-installation of MNPRX is required on any computer that has a previous installation running. We apologize for this inconvenience, but hope the new features will make up for it.

[**Viewport rendering**](./docs/rendering)

_New_ - Viewport rendering has been completely re-implemented to be handled entirely through _MNPRX_.
{: .top-1}

* Render with _Temporal Anti-Aliasing_ (TAA) for progressive super-sampled results.
* Abstracted quality for the viewport, rendered images and image sequences within 5 different modes: _Half_, _Standard_, _FXAA_, _4x SSAA_ and _TAA_.
* Render out images and image sequences in multiple image file formats (_.png, .jpg, .exr, .tif, .iff_).
* Create quick playblasts in all formats supported by your computer.
* Rendered images, image sequences and playblasts will have the same colors that you see in the viewport (except for _.exr_ images which are in linear space).
* Define alpha of the rendered images and image sequences as _None_, _Linear_, or _Premultiplied_ (only within formats that support alpha channels).
{: .top-1}

**PaintFX**
* _New_ - Numerical value for painting amount can now be directly seen and modified within _PaintFX_.
* _New_ - Pressure sensitivity is enabled when painting with a stylus.
* _Improved_ - Intuitive _undo_ operations within PaintFX.
* _Improved_ - No more flickering of the in-use brush icon.
* _Improved_ - Automatic switch between _NoiseFX_ and _PaintFX_ without re-selecting the objects.

**NoiseFX**
* _Improved_ - Intuitive _undo_ operations within NoiseFX (except for reset and on/off toggle).
* _Fixed_ - Reset and on/off noise toggle now flush the undo queue when used to avoid _Maya_ crashes
(Solving these crashes seem to be outside of our power as it relies on fixing the ShaderFX implementation).

**Material Presets**
* _Fixed_ - When multiple objects share a material, _Create New Material_ will now just create the material within the selection.
* _Improved_ - Loading a material on an object with the default _Lambert1_ material won't load the material on all objects sharing it.
* _New_ - ID material presets have been added.

**Usability**
* _Improved_ - Scene stylization will be automatically loaded when opening a stylized scene.
* _Improved_ - Velocity vertex data is only computed by the required geometry.
* _Improved_ - Velocity vertex data is discarded when no longer required, reducing scene size.
* _Fixed_ - Bug where the attribute editor sometimes didn't show the _ShaderFX_ attributes.
* _Fixed_ - Memory leak when resizing the viewport.
* _Fixed_ - Memory leak when loading different substrate textures.

**Installation**
* _Fixed_ - Installing MNPRX won't modify the existing order of environment variables within the host computer, minimizing clashes that it may have with other installed plugins that may depend on this.


[**Licensing**](./docs/import-export)

Lorem ipsum
{: .top-1}

* Lorem ipsum
{: .top-1}

---

## APRIL 2019 UPDATE

### MNPRX
{: .bottom05}

**MNPR Material**
* _Improved_ - Streamlined _mnpr_uber_ material with [documentation](/projects/MNPRX/docs/uber).
* _Improved_ - Streamlined _mnpr_geoproxy_ material with [documentation](/projects/MNPRX/docs/proxy).
{: .top-1}

**MNPRX Shelf**
* _Improved_ - Streamlined _MNPRX_ shelf with [documentation](/projects/MNPRX/docs/shelf).
* _New_ - [MNPRX documentation](/projects/MNPRX/docs) added under the _MNPRX_ shelf icon.
* _New_ - [MNPRX issue/feedback tracker](https://github.com/artineering-io/MNPRX/issues) added under the _FEEDBACK_ shelf icon.
{: .top-1}

**Viewport Rendering**
* _Fixed_ - Playblasts using the _rendr_ tool come out with proper color correction again with _Maya_ 2018.3, onwards (fix of MAYA-88922 bug caused a double color correction).
{: .top-1}

**Documentation**
* _New_ - Thorough documentation on Basics: [Installation](/projects/MNPRX/docs/installation), [Updating MNPRX](/projects/MNPRX/docs/update), [MNPRX Shelf](/projects/MNPRX/docs/shelf).
* _New_ - Thorough documentation on Styles: [Presets](/projects/MNPRX/docs/style-presets), [Configuration](/projects/MNPRX/docs/conf), [Import/Export](/projects/MNPRX/docs/import-export).
* _New_ - Thorough documentation on Materials: [Presets](/projects/MNPRX/docs/material-presets), [Uber Material](/projects/MNPRX/docs/uber), [Proxies](/projects/MNPRX/docs/proxy).
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
