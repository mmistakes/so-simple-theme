---
layout: documentation
title: Frequently Asked Questions
type: Docs
excerpt: Frequently Asked Questions about MNPRX
tags: [Docs, MNPRX]
comments: true
search: true
schema:
---
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

### About MNPRX

<div class="accordion" markdown="1">

#### What is MNPRX?
MNPRX is a real-time stylized renderer plugin (currently only for Autodesk Maya™) with an intuitive toolset for art-direction at different levels-of-control. Check out the available styles in our growing style library [here](/software/MNPRX/#page-title).

#### Can I use MNPRX commercially?
Yes, with the MNPRX Indie Version (for private individuals and teams/small companies up to 10 employees) or MNPRX Studio Version (for big teams and companies with 11 employees and above), which can be purchased [here](/software/MNPRX/#getit).

#### Will MNPRX work on my system?
Currently, MNPRX is only available for Windows 10. For Linux (CentOS) and Mac, we can build MNPRX upon request for bulk purchases (more than 10+ licenses).

#### Is my computer strong enough to run MNPRX smoothly?
To run MNPRX smoothly, a modern graphics card (2+ GB is recommended). For higher resolutions and scene complexity, more is needed.

#### Can I transfer a license to another computer (floating license)?
Yes, this is possible, but only after 24 hours have passed from a previous activation. Read more about it [here](/software/MNPRX/docs/licensing/#license-migration).

#### Can I change back to the normal viewport?
<div markdown="1">
<figure class="pull-right">
	<img src="/images/faq/change-renderer.png" alt="Changing renderer in the viewport">
	<figcaption>All viewport renderers are listed here.</figcaption>
</figure>
Yes, just change the viewport renderer from MNPRX to Viewport 2.0.
</div>

</div> <!-- end About MNPRX -->

### NoiseFX and PaintFX

<div class="accordion" markdown="1">

#### I deleted the construction history, how can I still animate PaintFX?
<div markdown="1">
Animating _PaintFX_ requires the history created with the vertex color sets to keyframe the values. To recover the required construction history, you can:
1. Export the _PaintFX_ with the [Import/Export Tool](../import-export/).
2. Delete the _PaintFX_ using the [MNPRX Toolbox](../toolbox).
3. Add history
3. Import the _PaintFX_ back in with the [Import/Export Tool](../import-export/).
The construction history will be in place and you can now animate the _PaintFX_ values.
</div>
</div>  <!-- end NoiseFX and PaintFX -->


### Troubleshooting MNPRX

<div class="accordion" markdown="1">

#### My scene is all white once I load MNPRX
<div markdown="1"> 
There are many reasons why this might be happening, we'll list them up from most to less frequent
* The [world scale](/software/MNPRX/docs/config/#world-scale) is not properly set up for the scene.
* The scene might have been created with an older version of MNPRX and you need to [update the materials](/software/MNPRX/docs/update/#materials).
* Your GPU may be running out of memory. This is unlikely, but can happen if a lot of textures are in the scene.  
You may [clamp the resolution of the textures](https://knowledge.autodesk.com/support/maya/learn-explore/caas/CloudHelp/cloudhelp/2018/ENU/Maya-Rendering/files/GUID-8BAA3B98-F6C5-48F4-834F-14A551836B34-htm.html) to help alleviate this problem.
</div>

#### Some objects are missing when I render
Your GPU may be running out of memory. This can happen if you are rendering at big resolutions on a weak GPU or if a lot of textures are in the scene. You may [clamp the resolution of the textures](https://knowledge.autodesk.com/support/maya/learn-explore/caas/CloudHelp/cloudhelp/2018/ENU/Maya-Rendering/files/GUID-8BAA3B98-F6C5-48F4-834F-14A551836B34-htm.html) to help alleviate this problem.

</div>  <!-- end Troubleshooting MNPRX -->

If you don't find your question here, feel free to reach out to us through the [Artineers](http://community.artineering.io) community



<!-- accordion widget documentation: https://api.jqueryui.com/accordion/-->
<script> $( ".accordion" ).accordion({
   collapsible: true,
   animate: 100,
   heightStyle: "content"
   });
</script>

