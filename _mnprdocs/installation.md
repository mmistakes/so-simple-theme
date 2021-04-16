---
layout: documentation
title: Installing MNPRX
type: Docs
excerpt: Documentation on installing MNPRX
tags: [Docs, MNPRX]
comments: true
schema:
redirect_from:
  - /projects/MNPRX/docs/installation/
---

## Download MNPRX
**Get a commercial or non-commercial version of MNPRX [here](/software/MNPRX/#getit).**  
Make sure to also take a look at the system requirements below:

| Requirements      | Minimum    | Recommended | Notes                                                                                   |
|-------------------|------------|-------------|-----------------------------------------------------------------------------------------|
| **Autodesk Maya** | 2018.7     | 2020.4      | 2018, 2019, 2020 and 2022 are supported                                                       |
| **OS**            | Windows 10 | Windows 10  | Linux and Mac versions developed for interested Studios, [contact us](/agency/#contact) |
| **VRAM**          | 2 GB       | 8 GB        | Higher resolutions and scene complexity require more VRAM                               |
| **Memory**        | 8 GB       | 16 GB       | As much as your Maya scene requires                                                     |
{: .aio-table}

## Installation
1. Extract the contents of the downloaded _zip_ file anywhere you want e.g., documents, desktop, a shared drive, you get the drill.
1. Drag and drop the _install.mel_ file from the MNPRX folder into one of the _Maya_ viewports.
1. The installation window will appear (see image below).
1. Install MNPRX from this folder _'only for you'_ or install MNPRX from this directory _'for ALL users'_ (requires admin rights)
1. If successful, a prompt will appear in _Maya_, asking you to restart the application, please do so to show all changes.
1. Once you open _Maya_ again, the [_MNPRX shelf_](../shelf) will appear alongside the other shelves.
1. To test if everything is working correctly, switch to the _MNPRX shelf_ and click on the `test` button.
1. If MNPRX has not been activated before, the [activation prompt](/software/MNPRX/docs/licensing/#activating-a-license) will appear.

<figure class="pull-center">
  <img src="/images/MNPRX/installation-plain.png" alt="MNPRX Installation">
</figure>

Installations for a single user will ALWAYS take precedence over installations for all users. Make sure to uninstall MNPRX if you have a previous 'single user' installation and want to use the installation for 'all users', instead.
{: .notice--info}

## Upgrading from Demo license
If you previously activated a Demo version and wish to activate another license, follow these steps:
1. Delete the `MNPRX.lic` file found in:
  * "Only for you" installations -> `Documents/maya/MNPRX.lic`
  * "For all users" installations -> `Program Files/Common Files/Autodesk Shared/Modules/Maya/MNPRX.lic`
2. Start or restart Maya if already opened
3. Load MNPRX and activate it with your license key

## Demo Scenes
You can [download demo scenes](/software/MNPRX/demo-scenes) for _MNPRX_ in a variety of styles. To open them up, follow the instructions below.
1. Download the desired demo scene
1. Extract the files in a desired folder
1. Set your _Maya project_ to the folder where your demo scene is `Menu, File->Set Project`
1. Open the demo scene `Menu, File->Open`
1. Update the scene if required by the prompt after opening.

## FAQ
{% include faq/section.html file="installation.md" self-contained=true %}

{% include toc-side %}
