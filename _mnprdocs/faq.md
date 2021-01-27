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
{% include faq/_header.html %}

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

#### How can I cancel my subscription to avoid being rebilled?
You can cancel your MNPRX subscription by clicking on the `Manage Your Orders` link within the email that you get from _FastSpring_ (our e-commerce platform). After cancelling, you can continue using MNPRX with the license that you purchased until the subscription expires. Afterwards, the license will return to Non-Commercial.

#### Can I change back to the normal viewport?
<div markdown="1">
<figure class="pull-right">
	<img src="/images/faq/change-renderer.png" alt="Changing renderer in the viewport">
	<figcaption>All viewport renderers are listed here.</figcaption>
</figure>
Yes, just change the viewport renderer from MNPRX to Viewport 2.0.
</div>

</div> <!-- end About MNPRX -->

### Installation
{% include faq/installation.md %}

### NoiseFX and PaintFX

<div class="accordion" markdown="1">

#### I deleted the construction history, how can I still animate PaintFX?
<div markdown="1">
Animating _PaintFX_ requires the construction history created with the vertex color sets to keyframe the values. You will need to recover the required construction history.
1. Export the _PaintFX_ with the [Import/Export Tool](../import-export/).
2. Delete the _PaintFX_ using the [MNPRX Toolbox](../toolbox).
3. Add history -> `Edit Mesh->Transform`
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

#### When working with many semi-transparent objects, they flicker from frame to frame
<div markdown="1">
This is due to a _Maya_ bug that we have reported to _Autodesk_ ([MAYA-105672](https://forums.autodesk.com/t5/maya-programming/object-sorting-of-transparent-objects-not-working-with-mrt/td-p/9597898)). Fortunately, there is a workaround that will get depth sorting of transparent objects working with MNPRX.
1. Navigate to this folder `C:\Program Files\Autodesk\Maya20XX\bin\ScriptFragment` (replace the 'XX' with the version of Maya you are using in production).
2. Open up the `mayaTransparentDrawPass.xml` file with a text editor that has administrator privileges.
3. Search for this line `<If value="@sortTransparent" />` and comment it out like this: `<!--<If value="@sortTransparent" />-->`
4. Comment out the _EndIf_ just underneath like this `<!--<EndIf />-->`
5. Save the file and restart _Maya_ to have depth sorting of transparent objects working with MNPRX.
</div>

#### The MNPRX shelf doesn't show any buttons/icons
<div markdown="1">
Because Maya automatically saves shelf files, using different versions of Maya with MNPRX can invalidate the shelf on older versions of Maya. This makes the buttons/icons disappear. Thankfully, it's easy to solve this:
1. Make sure all versions of Maya are closed
2. Go to `Documents/maya/20XX/prefs/shelves` (replace XX with the version of Maya that you are using)
3. Delete any `shelf_MNPRX.mel` file that might exist there
4. Go to the shelves folder within the MNPRX directory: `MNPRX/shelves`
5. Replace the `shelf_MNPRX.mel` with a clean shelf file from the `MNPRX.zip` file that you downloaded
6. Start Maya again and the shelf buttons should be there again
</div>

#### Objects are not casting shadows
<div markdown="1">
<figure class="pull-right">
	<img src="/images/faq/enabling-shadows.png" alt="Enabling viewport shadows">
	<figcaption>Enable viewport shadows here.</figcaption>
</figure>
Make sure to enable shadows in the viewport. We have done a video tutorial on [Working with Shadow Maps in the Maya Viewport](https://www.youtube.com/watch?v=j2Oy3djmQZk), which explains how to make the most out of Maya's shadow maps.
</div>

#### Some objects are missing when I render
Your GPU may be running out of memory. This can happen if you are rendering at big resolutions on a weak GPU or if a lot of textures are in the scene. You may [clamp the resolution of the textures](https://knowledge.autodesk.com/support/maya/learn-explore/caas/CloudHelp/cloudhelp/2018/ENU/Maya-Rendering/files/GUID-8BAA3B98-F6C5-48F4-834F-14A551836B34-htm.html) to help alleviate this problem.

#### Batch render completes without rendering anything
Maya's *Render*→*Batch Render* tool is broken when MNPRX is in the *MAYA_MODULE_PATH* environment variable. This even happens when the plugin is unloaded, which seems quite odd (if you know why this is happening, we'd love to hear how we can fix this).  
As an alternative, if you are using another renderer, please consider using *Render*→*Render Sequence* instead or batch rendering from the command line.  
If you really need to use the *Batch Render* tool within Maya, temporarily delete the **MNPRX variables from the *Maya.env* file, use the *Batch Render* tool and either place the variables back or re-install MNPRX.

</div>  <!-- end Troubleshooting MNPRX -->

If you don't find your question here, feel free to reach out to us through the [Artineers](https://www.reddit.com/r/artineers/) community

{% include faq/_footer.html %}
