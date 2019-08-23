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

## Requirements
* Maya 2017, 2018, 2019 (with updates)
* Windows 10 (Linux [CentOS/RHEL] and Mac upon request for bulk purchases of _Studio_ licenses)
* Modern Graphics Card (2+ GB recommended, more is needed at higher resolutions and scene complexity)


## Get MNPRX
Get a commercial or non-commercial version of MNPRX [here](/software/MNPRX/).


## Installation
The installation of MNPRX is intended to be the least invasive, so you won't need to change anything in _Maya_ or place files in any particular place.
1. Extract the contents of the downloaded _zip_ file anywhere you want e.g., documents, desktop, the project folder, you get the drill.
1. Drag and drop the _install.mel_ file from the extracted content into one of the _Maya_ viewports. The _install.mel_ will then run in the background and automatically add the MNPRX paths in your _Maya.env_ file.
1. If successful, a prompt will appear in _Maya_, asking you to restart the application, please do so to show all changes.
1. Once you open _Maya_ again, the [_MNPRX shelf_](../shelf) will appear alongside the other shelves.
1. To test if everything is working correctly, switch to the _MNPRX shelf_ and click on the test button.
1. If MNPRX has not been activated before, the [activation prompt](/software/MNPRX/docs/licensing/#activating-a-license) will appear.

A video showing this installation process can be seen below:
{% include responsive-embed url="https://www.youtube.com/embed/PQp9-CmLbRU" ratio="16:9" width="90%" %}


## Example Scenes
_MNPRX_ comes with an example scene in the _projects_ folder. However, scenes stylized with the open-source [_MNPR_ release](/software/Maya-NPR) can also be used with _MNPRX_. However, these scenes need to be updated to work with _MNPRX_, as follows.
1. Download the example scenes from [here](https://github.com/semontesdeoca/MNPR/releases/latest)
1. Extract them in a desired folder
1. Set your _Maya project_ to the folder where your example scenes are `Menu, File->Set Project`
1. Open the desired test scene `Menu, File->Open`
1. Update the materials in the scene `right click on the 'mPre' shelf tool->Update ShaderFX materials`.


## FAQ
_**I can't get the system to install using the install.mel file, what can I do?**_<br>
It doesn't usually happen, but if the _install.mel_ installation doesn't work, there are two ways of manually installing MNPRX:

_Solution 1: Temporarily remove the content in the Maya environment file_

1. Copy the existing content of _Maya.env_ to another file.
2. Clear all the environment variables (which you have copied over already for backup) and save the file.
3. Drag and drop the _install.mel_ file again into the _Maya_ viewport -> it should install successfully then.
4. Merge the other environment variables with the new ones in the _Maya.env_ file and save the changes.
5. Restart Maya.

_Solution 2: Insert the system paths manually to the Maya environment_

1. Enter the environment variables (available at the bottom of this page) into Maya. Make sure the shelf path is the first environment variable, replace _#YOURMNPRXPATH#_ with the path where MNPRX is located and _#MAYAVERSION#_ with the version of Maya you are using e.g., 2018, 2019.
1. (Windows only) After entering the environment variables, run this _mel script_ within _Maya_: `setRenderingEngineInModelPanel "DirectX11"`
1. Restart Maya.


**Environment variables on Windows:**
```python
MNPRX_PATH=#YOURMNPRXPATH#;
MAYA_MODULE_PATH=#YOURMNPRXPATH#;
MAYA_VP2_USE_GPU_MAX_TARGET_SIZE=1;
```

**Environment variables on Linux or MacOS**
```python
MNPRX_PATH=#YOURMNPRXPATH#:
MAYA_MODULE_PATH=#YOURMNPRXPATH#:
MAYA_VP2_USE_GPU_MAX_TARGET_SIZE=1:
```

{% include toc-side %}
