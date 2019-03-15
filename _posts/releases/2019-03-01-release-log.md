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
	<a href="./"><img src="/images/buttons/mnprx_getIt.jpg" alt="image"></a>
  <a href="./docs"><img src="/images/buttons/mnprx_documentation.jpg" alt="image"></a>
  <figcaption>As an MNPRX user, you will automatically get the latest version of MNPRX upon release!</figcaption>
</figure>

---

## MARCH 2019 UPDATE

### MNPRX
{: .bottom05}

[**Stylization export/import tool**](./docs/export-import)

New tool that allows the artist to export/import the stylization of either the selected objects or of the entire scene.
The stylization settings that can be exported/imported include:
{: .top-1}

* Style parameters (mnprConfig node attributes).
* MNPR materials (with NoiseFX and material attributes).
* PaintFX (all painted parameters).
* Proxies (the geometry proxies, their material and painted parameters).
{: .top-1}

The tool is name-based, but supports the export/import between different namespaces. The stylization can also be imported on scenes where there were no prior MNPRX materials, as long as names of the objects remain consistent.

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
