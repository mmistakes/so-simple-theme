---
layout: documentation
title: Installing MNPRX
type: Docs
excerpt: Documentation on installing MNPRX
tags: [Docs, MNPRX]
comments: true
schema:
---

## Requirements
* Maya 2017, 2018, 2019
* Windows 10, MacOS and Linux (CentOS)
* Modern Graphics Card (Support for DirectX 11 or OpenGL 4.0, onwards)


## Get MNPRX
* _MNPRX_ is the professional version of [_MNPR_](/projects/Maya-NPR).
* It is provided upon request and customized to your production requirements.
* [Get in touch with me](/about) if you are interested in using it for your animated production.


## Installation
{: #installation}
The installation of MNPRX is intended to be the least invasive, so you won't need to change anything in _Maya_ or place files in any particular place.
1. Extract the contents of the MNPRX zip file anywhere you want e.g., documents, desktop, the project folder, you get the drill.
1. Drag and drop the _install.mel_ file from the MNPR folder into one of the _Maya_ viewports. The _install.mel_ will then run in the background and automatically add the MNPRX paths in your _Maya.env_ file.
1. If successful, a prompt will appear in _Maya_, asking you to restart the application, please do so to show all changes.
1. Once you open _Maya_ again, the [_MNPRX shelf_](../shelf) will appear alongside the other shelves.
1. To test if everything is working correctly, switch to the _MNPRX shelf_ and click on the test button

A video showing this installation process can be seen below:
{% include responsive-embed url="https://www.youtube.com/embed/PQp9-CmLbRU" ratio="16:9" %}


## Example Scenes
Example scenes can be found within the open-source [_MNPR_ release](/projects/Maya-NPR). _MNPR_ scenes need to be updated to work with MNPRX, as follows.
1. Download the example scenes from [here](https://github.com/semontesdeoca/MNPR/releases/latest)
1. Extract them in a desired folder
1. Set your _Maya project_ to the folder where your example scenes are `Menu, File->Set Project`
1. Open the desired test scene `Menu, File->Open`
1. Update the materials in the scene `right click on the _mPre_ shelf tool->Update ShaderFX materials`.


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
MAYA_SHELF_PATH=#YOURMNPRXPATH#\shelves;
MNPR_PATH=#YOURMNPRXPATH#;
MAYA_PLUG_IN_PATH=#YOURMNPRXPATH#\plugins\#MAYAVERSION#\win;
PYTHONPATH=#YOURMNPRXPATH#\scripts;
MAYA_SCRIPT_PATH=#YOURMNPRXPATH#\scripts;
XBMLANGPATH=#YOURMNPRXPATH#\icons;
MAYA_VP2_USE_GPU_MAX_TARGET_SIZE=1;
```

**Environment variables on MacOS**
```python
MAYA_SHELF_PATH=#YOURMNPRXPATH#/shelves:
MNPR_PATH=#YOURMNPRXPATH#:
MAYA_PLUG_IN_PATH=#YOURMNPRXPATH#/plugins/#MAYAVERSION#/mac:
PYTHONPATH=#YOURMNPRXPATH#/scripts:
MAYA_SCRIPT_PATH=#YOURMNPRXPATH#/scripts:
XBMLANGPATH=#YOURMNPRXPATH#/icons:
MAYA_VP2_USE_GPU_MAX_TARGET_SIZE=1:
```

**Environment variables on Linux**
```python
MAYA_SHELF_PATH=#YOURMNPRXPATH#/shelves:
MNPR_PATH=#YOURMNPRXPATH#:
MAYA_PLUG_IN_PATH=#YOURMNPRXPATH#/plugins/#MAYAVERSION#/linux:
PYTHONPATH=#YOURMNPRXPATH#/scripts:
MAYA_SCRIPT_PATH=#YOURMNPRXPATH#/scripts:
XBMLANGPATH=#YOURMNPRXPATH#/icons%B:
MAYA_VP2_USE_GPU_MAX_TARGET_SIZE=1:
```

{% include toc-side %}
