---
layout: publication
permalink: /software/MNPRX/release-log
title: MNPRX Release
excerpt: New MNPRX release!
type: Release
image:
  path: images/cards/MNPRX.jpg
  header: images/headers/MNPRX.jpg
  caption: Stylized rendering for Autodesk Maya
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
## January 2021 UPDATE
The January 2021 update brings massive changes under the hood. Every single script file has been updated and is now compatible with both Python 2 and 3 to support future Maya versions. We have also created and revamped many tools to make them as robust as possible.

<figure class="pull-center">
  <img src="/images/MNPRX/2021-01.jpg" alt="MNPRX January 2021 Update" style="max-height:360px">
</figure>

**Separate stylization and Maya scene**
- *New* - The stylization and Maya scene are now saved separately. This brings a much needed (and massive) reduction in file sizes for production. This workflow also improves the robustness when working with complex scenes:
    - If the Maya scene gets corrupted, you can restore the stylization through the separate `style` file saved along with the scene.
    - References or caches? No problem, as we are saving the stylization ourselves, we can be sure that any style changes made to referenced or cached objects are also saved.

The *style* and *Maya scene* files should always be in the same folder for a seamless workflow.
{: .notice--info}

**Revamped import/export workflow**
- *New* - Dedicated import/export icon on shelf
- *New* - Automatically save the stylization when saving the scene
- *Improved* - Smaller stylization files (*.style*). We are using our own encoder and only saving the data that has been set in the scene.  
Old stylization files (*.json) can still be imported.

**Support for multiple materials in the same objects**
- *New* - Revamping the import/export workflow required us to fully support when artists assign multiple materials to objects and vice-versa. The entire MNPRX stylization now should work as expected no matter what is assigned where.

**Revamped installation process**
- *New* - Installation dialog with different options
- *New* - Install MNPRX for **ALL users** of a computer. This has been highly requested by institutions with multiple users per computer.

<figure class="pull-center">
  <img src="/images/MNPRX/installation.png" alt="MNPRX Installation">
</figure>

Installations for a single user will always take precedence over installations for all users. Make sure to uninstall MNPRX if you have a previous 'single user' installation and want to use the installation for all users, instead.
{: .notice--info}

**Popup shelf tool**
- *New* - Easily detach the shelf onto a new window with the new *Popup Shelf* tool (last one on the right)

<figure class="pull-center">
  <img src="/images/MNPRX/popup-shelf.png" alt="MNPRX Popup Shelf">
</figure>

**Re-link textures tool**
- *New* - Working with a scene that was running on another computer? Now you can automatically relink all existing textures with the click of a button. The Re-link texture tool can be found in the MNPRX toolbox.

<figure class="pull-center">
  <img src="/images/MNPRX/tbox2.png" alt="MNPRX toolbox">
</figure>

**Material presets**
- *Improved -* Inherit will replicate the attributes of whatever is already assigned to the object—thereby inheriting the old material. This works with _Maya_ materials (creating a _ShaderFX_ material with similar attributes) or with _ShaderFX_ materials (making a "duplicate").
- *Fixed* - Filtered presets not appearing correctly

**Style presets**
- *New* - Watercolor and Frayed RGB-matte presets
- *New* - New presets to experiment with

**ShaderFX updates**
- *New* - Most nodes in the ShaderFX graph are now referenced. This means that this update will be the last one in which you will have to manually update the ShaderFX materials in the scene. And the scene size will be reduced by around 0.5MB per material!
- *New* - Color-plane s*etting* in the material will override any atmosphere range effects on it, making it easier to work with color planes in MNPRX
- *New* - While rarely, ShaderFX materials sometimes just stop working (-1 issue). We can't fix the ShaderFX plugin (proprietary of Autodesk). However, by separating the stylization in a separate file, we can now auto-repair corrupted ShaderFX materials by simply importing the style again!
- *Improved* - UDIMs now supported for all types of textures using the *UDIM group* and using the right channels according to texture type.
- *New* - *Texture layer group* allows to layer textures directly within the ShaderFX material with different blending modes
- *New* - *Fresnel group* allows to easily apply semi-transparent Fresnel reflections to the ShaderFX material.

**Frayed Edges**

- *Improved* - Frayed instances behave properly no matter the rotation order or nested hierarchy of objects
- *Compatibility* - The *Frayed Edges* style should be used only from *Maya 2019* onwards

**Watercolor**
- *Fixed* - Bleeding issue with negative parameter values overwriting bled areas

**Miscellaneous**
- *Fixed* - Configuration node is not deleted anymore when the last connection is removed from it
- *Improved* - No MNPRX script jobs will run unless MNPRX is running in a viewport
- *Improved* - Speed of internet check when activating MNPRX
- *Improved* - Fingerprint of license now based on Mainboard Serial number and not on MAC addresses

---

## August 2020 UPDATE
The August 2020 update brings some exciting new features and improvements to MNPRX. **With over 200 commits** (code changes) over the past 6 months, we have taken our time to also thoroughly test the plugin to ensure a great user experience. Please let us know if you encounter any issues so that we can fix them ASAP!

**Upgrading notes**:  
An update prompt will appear when you try opening scenes that were stylized with a previous version of MNPRX. You can automatically update your scene to the current version of MNPRX from this prompt.
{: .notice--info}

We tried our best to keep the stylization as close as possible to previous versions, but there were simply too many changes (please see below). Mainly the canvas roughness and scale will need to be tweaked to match the previous stylization.

### MNPRX

**Resolution independent styles**
* _New_ - Watercolor, Cutout and Frayed edges now have resolution independent effects. This means that you can render at any resolution, and the effects will remain the same size relative to the subject.
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/Resolution-Independent-Effects.mp4" type="video/mp4">
	</video>
</figure>

**_Substrate_ to _Canvas_**
* _Improved_ - No more obscure words, "substrate" has been renamed to "canvas" throughout the plugin. Older presets that used _substrate_ names will continue to work.

**Infinite Canvas**
* _New_ - We have implemented a new canvas synthesis algorithm that generates infinite and seamless canvases from any texture!
<figure class="pull-center">
	<video autoplay loop muted playsinline>
	  <source src="/images/MNPRX/Infinite-Canvas.mp4" type="video/mp4">
	</video>
</figure>

**Canvas advection**
* _Improved_ - Canvas advection should work now no matter how complex the shape transform hierarchy is.
* _New_ - A regeneration attribute (in seconds) has been added that will allow you to regenerate distorted canvas textures due to advection. This attribute can be animated depending on the action in the scene.

**Custom canvases**
* _New_ - You can synthesize your own canvas texture from any heightmap. Just make sure to put the heightmap in the `textures` directory of MNPRX.

**Canvas tile blend**
* _Improved_ - Canvas tile blend now has histogram preserving blending, keeping the contrast throughout the blended tiles.

**Canvas control**
* _New_ - You can also translate the canvas, in addition to scaling and rotating it
* _Improved_ - Scaling now happens from the center of the viewport

**Temporal Anti-Aliasing**
* _New_ - TAA is now available in all versions of MNPRX

**Bulk attribute**
- *New* - Bulkattr tool is now available in all versions of MNPRX
- *New* - Bulkattr tool (blk) now has its own tool on the shelf
- *New* - There is a reload button right next to texture attributes that allows to easily reload textures
- *Fixed* - Modifying settings with *Auto-refresh* unchecked will not clear the populated UI

**Floating viewport**
- *New* - Floating viewport (float) icon will toggle a floating viewport.
- *New* - Right-click on the floating viewport shelf button to open the floating viewport with different resolutions

**Bloom**
- *New* - Add bloom to your scenes from the configuration node with control over its *intensity*, *size* and *blur*.

**HDR**
- *Improved* - Materials now support HDR lighting

**Highlight**
- *Improved* - Control the highlight *diffusion*, in addition to *roll off* and *transparency*
- *New* - Highlight is available in its own AOV (red channel of *pigmentCtrlTarget*)

**Cutout**
- *New* - Support for cutout masks in cutout materials.

**References**
* _Improved_ - The plugin will automatically save the stylization when references are in the scene (*.json* file with the same name in the directory where the open scene is located). The plugin will also automatically search for it and load the stylization of references when opening scenes.

**This means that stylizing references is now fully supported in MNPRX.**  
Changes to a referenced ShaderFX graph is still not supported by Maya though, so make sure to modify the ShaderFX graph only of non-referenced materials.
{: .notice--info}

**Sequence Renderer**
- *Improved* - Cameras auto-populate whenever you create/delete a camera in the scene and whenever a scene is opened.
- *Improved* - resolution and renderable cameras in the tool now modify the scene settings.
- *Fixed* - Progress bar not working with bigger ranges

**Style presets**
- *Fixed* - Changing between styles sometimes didn't work correctly (deleted the configuration node or showed different canvas sizes)
- *New* - *InViewMessages* for versions of Maya that support it (2019+)
- *New* - Added presets for watercolor, frayed edges and cutout

**Material presets**
- *New* - Inherit material preset will inherit attributes/textures from Maya materials and create an *mnprx_uber* material with these attributes/textures.
- *New* - Streamlined material preset icons

**MNPRX Toolbox**
- *New* - Auto-convert Maya materials will automatically convert all Maya materials in the scene to *mnprx_uber* materials, inheriting attributes and textures.

**Installation**
- *Fixed* - Users not being able to install MNPRX from directories that contained non-ascii characters
- *Fixed* - Problems installing MNPRX when Redshift was installed
- *Fixed* - Opening a scene without activating MNPRX went straight to Non-Commercial version

**Miscellaneous**
- *New* - Adding cast-shadows setting in material
- *Fixed* - Texture resolution (canvas) being clamped to 2048 in Maya 2018
- *Fixed* - The world scale will be automatically inferred upon creation of the configuration node
- *Fixed* - NoiseFX of edge darkening being stretched
- *Fixed* - *Flip-Back-Faces* not updating when importing the stylization
- *Fixed* - Keying of PaintFX not working when no effects were previously painted on objects
- *Fixed* - Roughness not working on alternate canvas
- *Fixed* - Disabled MSAA, as everyone can use TAA now and it was only creating artifacts
- *Fixed* - Disabled scroll on NoiseFX sliders
- *Improved* - Default maxLights of mnprx_uber was raised to 10
- *Improved* - Robustness of material selection (now also supports from selected components)
- *Improved* - Robustness of paintFX with components and multiple materials
- *Improved* - Pass inspector not showing current target
- *Improved* - Only one prompt when loading the plugin for all versions

### New licensing options
**Community license**
- *New* - we have launched a new **_Community_ license on [Patreon](https://www.patreon.com/artineering)** that goes as low as 5€ a month, **including with all features**. This will hopefully ease the entry point for students and artists on a budget that use MNPRX non-commercially (or commercially for higher tiers).

**Demo license**
- *New* - the old non-commercial free version is replaced by the _Demo_ version. This version provides the entire feature set for testing purposes, but is limited to 720p in resolution.

### Stylizations in Nuke
{: .top2}
* _New_ - Watercolor stylization supporting August 2020 release (except for bloom)

---

## February 2020 UPDATE
The February 2020 update concentrates on stability and bug fixes, while at the same time bringing some useful new features into existing tools (PaintFX, NoiseFX, bulkAttr). Oh, and **MNPRX supports Maya 2020 now!**

**Upgrading notes**:  
**[Update the materials in the scene](/software/MNPRX/docs/update/#materials)** for the PaintFX and NoiseFX tools to work with scenes that used previous versions of MNPRX.
{: .notice--info}

### MNPRX

**Demo Scenes**
* _New_ - We are releasing the first set of demo scenes in different styles for you all to experiment with [[download](/software/MNPRX/demo-scenes)].
<figure class="pull-center third">
	<img src="/images/MNPRX/demo-scenes/Spherebot.gif" alt="spherebot-watercolor">
	<img src="/images/MNPRX/demo-scenes/mech-drone.gif" alt="mech-drone-frayed">
	<img src="/images/MNPRX/demo-scenes/walk-cycle.gif" alt="walk-cycle-cutout">
	<figcaption>Demo scenes in different 3D styles</figcaption>
</figure>

**Watercolor**
* _New_ - Control the bleeding size at different distances with the new _Effect Focal Range_ tool, which is enabled within the _config_ node [[docs](/software/MNPRX/docs/config/)].

**Frayed**
* _Fixed_ - White edge darkening when edge darkening was reverted

**Configuration Node** - [[Docs](/software/MNPRX/docs/config/)]
* _New_ - Effect Focal Range to create locators that modify effects at different distances.
* _Fixed_ - Configuration node sometimes not working.

**Materials**
* _New_ - Custom _UDIM_ texture node group for _ShaderFX_ materials [[tutorial](https://www.youtube.com/watch?v=jPTdqG-PjcA&t=87s)].
* _Improved_ - underlaying management of control sets and baking for PaintFX and NoiseFX.  

**PaintFX** - [[Docs](/software/MNPRX/docs/paintfx/)]
* _New_ - Visualize the PaintFX parameters that are painted onto different objects.
* _New_ - Show vertices where PaintFX are being applied to within the brush.
* _New_ - Choose between different brush stamps to apply PaintFX onto objects.

**NoiseFX** - [[Docs](/software/MNPRX/docs/noisefx/)]
* _New_ - Visualize the NoiseFX parameters that are assigned to different materials.
* _Fixed_ - Baked NoiseFX positions not loading after opening a scene

**Bulkattr Tool** - [[Docs](/software/MNPRX/docs/toolbox/#bulk-attribute-)]
* _New_ - Now you can use the bulk attribute tool to modify all the different attributes of selected materials. This speeds up the workflow considerably on complex scenes with multiple objects and many materials.

The Bulkattr tool is available only for **Indie/Studio** subscribers.
{: .notice--info}

**Import/Export tool** - [[Docs](/software/MNPRX/docs/toolbox/)]
* _New_ - Option to export/import from to selected objects only
* _Improved_ - Speed at which stylization is imported into the scene
* _Fixed_ - Progress dialog not showing in-between percentages
* _Fixed_ - Importing/upgrading materials sometimes locking up the Maya UI

**References**
* _Improved_ - Robustness when working with referenced scenes and materials.

We still recommend exporting/importing the stylization to guarantee the art-direction is properly saved. Maya has some known limitations when saving reference edits on meshes and _ShaderFX_ materials.
{: .notice--info}

### Stylizations in Nuke
{: .top2}
* _Fixed_ - Pigment application not working correctly with bleeding

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
* _Fixed_ - The canvas doesn't sometimes dissapear anymore when the resolution changes

**Watercolor**
* _New_ - Added a custom dry-brush color and improved upon the dry-brush effect
* _Fixed_ - Bleeding now appears automatically when new scenes are created or opened

**Hatching**
* _New_ - Hatching and stippling patterns can now be baked onto objects by enabling the deformed setting within the hatching materials.

**Installation**
* _Fixed_ - Installation will automatically delete MNPRX shelves that might have saved themselves locally though Maya's preferences.

**PaintFX**  
* _Fixed_ - Vertex control sets are now created on-demand, drastically reducing scene size.
* _Fixed_ - Unnecessary history nodes are automatically deleted.

**NoiseFX**  
* _New_ - Baking of _NoiseFX_ now allows you to bake the current 3D noise pattern so that it works with animation and deformed objects. NoiseFX with 2D noise is thereby deprecated.
* _New_ - World scale of NoiseFX is now directly linked to the world scale of the scene (_World Scale_ attribute in the _config_ node), making the default scale of each effect work predictably with scenes of different world scales.

**Import/Export**
* _Improved_ - Smaller file sizes for exported styles
* _Improved_ - Progress bar when importing/exporting styles

**MNPRX Shelf**
* _Updated_ - Updated MNPRX info and Support (prev. Feedback) icons to direct users to the related page on our website.

**Documentation**
* _New_ - Frayed [documentation](/styles/frayed/).
* _New_ - Art-direction control [documentation](/software/MNPRX/docs/controls/)
* _New_ - Tutorial on [Avoiding the Shower Door Effect in MNPRX](https://www.youtube.com/watch?v=eMU4GMQNEs0).

### Stylizations in Nuke
{: .top2}
* _New_ - The frayed stylization in Nuke
* _Updated_ - The watercolor stylization in Nuke has been updated to support the December 2019 release of MNPRX.
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

**MNPRX Materials**
* _Fixed_ - Using alpha masks within transparency will not break the object sorting given by Maya anymore.

**Watercolor**
* _New_ - _Edge Darkening_ type control has been added. 'Advanced' edge darkening more faithfully reproduces edge darkening behavior found in traditional watercolors and reduces edges created from gradients. You may switch the type to 'Simple' mode if you still desire to use the old edge darkening approach.
* _New_ - Control over the _Pigment Density_ and _Paper Granulation_ has been separated for better control and nicer paper granulation results. **Because of this, the _Pigment Density_ will need to be reduced to match the perceived pigment concentration that you previously had in stylized scenes (prev. 5.0, new default is 1.0).**

**Installation**
* _Fixed_ - Installing MNPRX will delete any empty lines that the Maya.env file might have had to avoid _Maya_ not recognizing the plugin.

**Configuration Node**  
* _Fixed_ - Bug that didn't save all attributes with the scene.

**PaintFX**  
* _Fixed_ - Bug that sometimes messed up the painting of effects.

**Documentation**
* _New_ - Hatching [documentation](/projects/hatching/).
* _Updated_ - Finished the [**Stylizing a Scene**](./docs/stylizing-scene/) tutorial series, featuring the stylization of a production shot from _Run Totti Run_ by _Shad Bradbury_!
* _New_ - Tutorial on getting the most out of [**Shadow Maps in the Maya Viewport**](https://www.youtube.com/watch?v=j2Oy3djmQZk).

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
* _Fixed_ - Minor bug that didn't show the canvas properly upon changing between textures of different resolutions.

**MNPRX Materials**
* _New_ - _Rim Lights_ setting and attributes have been added to the [uber material](./docs/uber#rim-light).  

**MNPRX Toolbox**
* _New_ - _Bulk Attribute_ tool now available for _Indie/Studio_ licenses. The tool will allow you to change _ShaderFX_ settings in bulk. It will be expanded to change normal attributes in the future, as well.

**Watercolor**
* _Fixed_ - Pigment dilution now also dilutes ambient occlusion.

**MNPRX Shelf**
* _New_ - A point light shelf icon has been included in the _MNPRX_ shelf. Point light support is limited by _Maya_'s _ShaderFX_ framework, so you won't be able to cast point light shadows in _MNPRX materials_.

**Material Presets**  
_New_ - Redesigned and more powerful material presets window. From top to bottom, the updates are as follows:
* _Improved_ - Save presets by pressing enter after writing the name (save button still there if you prefer a mouse)
* _New_ - Load attributes checkbox allows you to not load the attributes in case you are only interested in loading the _NoiseFX_ or textures of an existing preset
* _New_ - Filter presets by name or by material type
* _Improved_ - Double click on a preset to load it on the selected objects

**Style Presets**  
_New_ - Redesigned and more powerful stylization presets window. From top to bottom, the updates are as follows:
* _Improved_ - Save presets by pressing enter after writing the name (save button still there if you prefer a mouse)
* _New_ - Loading options for stylizations, giving control over loading the world scale, attributes, quality and canvases.
* _New_ - Filter presets by name or by stylization
* _Improved_ - Double click on a preset to load it

**Import/Export**
* _Improved_ - Optimized file size when exporting stylization

**Documentation**
* _New_ - Next two tutorials on [Stylizing a Scene](./docs/stylizing-scene/): Matching Materials and Matching Lighting, featuring the stylization of a production shot from _Run Totti Run_ by _Shad Bradbury_.
* _Updated_ - All existing documentation to match the August 2019 release i.e., [MNPRX Shelf](./docs/shelf/), [MNPRX Toolbox](./docs/toolbox/), [Uber Material](./docs/uber/), [Material Presets](./docs/material-presets/) and [Stylization Presets](./docs/style-presets/).

---

## JULY 2019 UPDATE
The July 2019 update of MNPRX includes a completely new [Cutout Stylization](/styles/cutout/), together with our own implementation of _Ground Truth Ambient Occlusion_ (_GTAO_)! These two features, together with a series of smaller new features, improvements and fixes, make the July update a substantial improvement for _MNPRX_. Just make sure to also [update the materials in the scene](/software/MNPRX/docs/update/#materials), to be sure that you are using all the latest features of this update.

### MNPRX

[**Cutout Stylization**](/styles/cutout/)

_New_ - The _Cutout Stylization_ brings real-time cutout rendering of 3D objects and animation directly within _Autodesk Maya_ through _MNPRX_.

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

**Watercolor Stylization**
* _New_ - Ambient occlusion can concentrate pigment density within the watercolor stylization.

**Canvases**
* _New_ - Rotation attribute on each canvas.
* _New_ - Thorough control over the _Alternate Canvas_

**Material Presets**
* _Improved_ - Material presets do not force to load-up materials within the _MNPRX_ renderer anymore, you can use the normal _Viewport 2.0_ with it, if desired.
* _Improved_ - Material presets automatically check and clean connected Shading Engines to work properly with certain material setups.

**MNPRX Materials**
* _Improved_ - The noise created through the _NoiseFX_ tool will not be stretched along one direction anymore.

**MNPRX Shelf**
* _New_ - Double clicking on `mat` will now reload the _Attribute Editor_ of the material, forcing the _ShaderFX_ material to show all its attributes.
* _New_ - Selecting all objects that share the assigned material can now be done directly from the _MNPRX_ shelf by right-clicking on `mat` -> Select objects with material.

**Licensing**
* _New_ - installing MNPRX will check for an existing license and automatically ask the user what to do with it. This will make transitions from _Non-Commercial_ to _Indie/Studio_ much easier by simply re-installing _MNPRX_ and deleting the existing license to enter the new one.

**Documentation**
* _New_ - Cutout stylization [**documentation**](/styles/cutout/).
* _New_ - Tutorial series on [Stylizing a Scene](./docs/stylizing-scene/) in progress, featuring the stylization of a production shot from _Run Totti Run_ by _Shad Bradbury_.
* _New_ - Tutorial for [Rendering a Scene](./docs/rendering-scene/).
* _New_ - Thorough documentation on [Art-direction](./docs/art-direction/), including breakdowns on the [_NoiseFX_](/docs/noisefx/) and [_PaintFX_](docs/paintfx/) tools.
* _New_ - Thorough documentation on the [MNPRX Toolbox](./docs/toolbox/).
* _Updated_ - All existing documentation to match the July 2019 release i.e., [MNPRX Shelf](./docs/shelf/) and [Configuration node](./docs/config/).

### Watercolor stylization in Nuke
{: .top2}

The watercolor stylization is now also available for _Nuke_ in _Indie_ and _Studio_ licenses, allowing to re-create the style and tweak it further in compositing. More details on where to get it and how to take advantage of it can be [found in the documentation](./docs/compositing-nuke/).

---

## JUNE 2019 UPDATE (Public release!)
The June 2019 update of MNPRX is the biggest yet! We've developed many things to improve the overall experience and to continue moving forward with our planned development. Because of this, a re-installation of MNPRX is required on any computer that has a previous installation running. We apologize for this inconvenience, but hope the new features will make up for it.

### MNPRX
{: .bottom05}

[**Viewport rendering**](./docs/rendering)

_New_ - Viewport rendering has been completely re-implemented to be handled entirely through _MNPRX_.

* Render with _Temporal Anti-Aliasing_ (TAA) for progressive super-sampled results.
* Abstracted quality for the viewport, rendered images and image sequences within 5 different modes: _Half_, _Standard_, _FXAA_, _4x SSAA_ and _TAA_.
* Render out images and image sequences in multiple image file formats (_.png, .jpg, .exr, .tif, .iff_).
* Create quick playblasts in all formats supported by your computer.
* Rendered images, image sequences and playblasts should have the same colors that you see in the viewport (except for _.exr_ images which are in linear space).
* Define alpha of the rendered images and image sequences as _None_, _Linear_, or _Premultiplied_ (only within formats that support alpha channels).

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
* _Fixed_ - Memory leak when loading different canvas textures.

**Installation**
* _New_ - MNPRX environment variables are now handled by a plugin distribution module, avoiding clashes with environment variables from the host system.
* _Fixed_ - Installing MNPRX won't modify the existing order of environment variables within the host computer, minimizing clashes that it may have with other installed plugins that may depend on this.

**Licensing**
* _New_ - Using MNPRX now requires a valid license. Upon first use, you will be prompted to either enter the activation code that came with your purchase of _MNPRX Indie/Studio_ or activate _MNPRX Non-Commercial_.
  * Please refer to the [licensing documentation](./docs/licensing) for details.

---

## APRIL 2019 UPDATE

### MNPRX
{: .bottom05}

**MNPR Material**
* _Improved_ - Streamlined _mnpr_uber_ material with [documentation](/software/MNPRX/docs/uber).
* _Improved_ - Streamlined _mnpr_geoproxy_ material with [documentation](/software/MNPRX/docs/proxy).

**MNPRX Shelf**
* _Improved_ - Streamlined _MNPRX_ shelf with [documentation](/software/MNPRX/docs/shelf).
* _New_ - [MNPRX documentation](/software/MNPRX/docs) added under the _MNPRX_ shelf icon.
* _New_ - [MNPRX issue/feedback tracker](https://github.com/artineering-io/MNPRX/issues) added under the _FEEDBACK_ shelf icon.

**Viewport Rendering**
* _Fixed_ - Playblasts using the _rendr_ tool come out with proper color correction again with _Maya_ 2018.3, onwards (fix of MAYA-88922 bug caused a double color correction).

**Documentation**
* _New_ - Thorough documentation on Basics: [Installation](/software/MNPRX/docs/installation), [Updating MNPRX](/software/MNPRX/docs/update), [MNPRX Shelf](/software/MNPRX/docs/shelf).
* _New_ - Thorough documentation on Styles: [Presets](/software/MNPRX/docs/style-presets), [Configuration](/software/MNPRX/docs/conf), [Import/Export](/software/MNPRX/docs/import-export).
* _New_ - Thorough documentation on Materials: [Presets](/software/MNPRX/docs/material-presets), [Uber Material](/software/MNPRX/docs/uber), [Proxies](/software/MNPRX/docs/proxy).

---

## MARCH 2019 UPDATE

### MNPRX
{: .bottom05}

[**Stylization Import/Export tool**](./docs/import-export)

New tool that allows the artist to Import/Export the stylization of either the selected objects or of the entire scene.
The stylization settings that can be exported/imported include:

* Style parameters (mnprConfig node attributes).
* MNPR materials (with NoiseFX and material attributes).
* PaintFX (all painted parameters).
* Proxies (the geometry proxies, their material and painted parameters).

The tool is name-based, but supports the Import/Export between different namespaces. The stylization can also be imported on scenes where there were no prior MNPRX materials, as long as names of the objects remain consistent.

**Viewport Rendering**
* _New_ - Viewport Rendering now also matches the resolution gate, when in use.
* _Fixed_ - Memory leak that used all available system memory when rendering out big image sequences.
* _Fixed_ - Texture samplers not being recognized until the shaders were reloaded i.e., no more weird pixels at the borders of the images.
* _Fixed_ - Assigned canvas not showing when opening a scene from scratch.

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

**Watercolor**
* _Fixed_ - Bleeding when no objects are behind is now working again as expected.

**Usability**
* _New_ - A textured material preset has been added in the _mPre_ tool. Loading this preset will retain the textures of the prior material (i.e., _mnpr_uber_, _lambert_) and set all attributes required for a textured workflow.
* _Improved_ - Creating/Loading a new material will now keep the name of the previously assigned one.

**Licensing**
* _Improved_ - A less aggressive licensing method has been created that will always allow to load and work with MNPRX. However, it won't be possible to render images past the licensing date.

---

## JANUARY 2019 UPDATE

### MNPRX
{: .bottom05}

**MNPR Material**
* _New_ - Art-directable shading has been added to the _mnpr_uber_ material. Artists can now control light directly on the object through _lightmaps_, _paintFX_ or _noiseFX_.
Lightmaps within the material can be activated on demand in the _Settings_ of the material itself. Art-directable shading is found by default within the _paintFX_ and _noiseFX_ tools. Art-directed shading is strongly dependent on the _Diffuse Factor_ attribute. Therefore, an additional _Shade_ attribute has been added to the material to separately control the lighting contribution from lights. It is highly encouraged to read the [documentation](./docs/lighting#lightmaps) to fully understand how art-directable shading can be effectively used.
* _Fixed_ - Issue with depth in semi-transparent objects not rendering and certain depth-dependent stylization effects now working properly.

**PaintFX**
* _Improved_ - Highlight brush that is currently in use.

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

**PaintFX**
* _Fixed_ - Issue of objects appearing white after another object with the same material was being painted.

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
The artist can cancel the render at any time and all targets are saved within one pass.

**Canvases**
* _New_ - Motion-driven canvases (dynamic canvas) that allow for motion coherent canvas-based effects. Activate the _Velocity PV_ attribute in the _mnprConfig_ node to activate it.
* _Improved_ - Controllable canvas tiles through the _Canvas Tile_ attribute.
* _New_ - Smooth/rough transition between tiles by activating the _Canvas Tile Blend_ attribute.
* _New_ - Support for canvas blending between two specified textures with the _Canvas Blend_ attribute.

**Watercolor**
* _Improved_ - No more _Depth Range_ or _Bleeding Threshold_ attribute required for watercolor effects to behave correctly.


---

## SEPTEMBER 2018 UPDATE

### [Watercolor stylization in Nuke](./docs/compositing-nuke)
{: .bottom05}

_New_ - The watercolor stylization pipeline in _The Foundry_'s _Nuke_. This node network allows to recreate the _MNPRX_ watercolor stylization out of render targets exported from _Maya_.

---

## JULY 2018 UPDATE

### MNPRX
{: .bottom05}

**Viewport Rendering**
* _Fixed_ - Edge artefacts in alpha channel when _FXAA_ was on

**Canvases**
* _Improved_ - Extended the range of canvases (papers) to use.
* _Improved_ - Canvases can be downloaded from within the shelf
  ``RMB on _MNPR_ shelf icon -> Download canvases``.

---

## JUNE 2018 - Open-Source release of [MNPR](../Maya-NPR)
