---
layout: post
author: santiago
year: 2020
categories: quick-reads
tags: [Maya, Development, Devkit]
title: Building Maya devkit plug-ins, the easy way
tile-title: Building Maya devkit plug-ins, the easy way.
excerpt: Having trouble building Maya devkit plug-ins for simple tests? Let's automate the devkit plug-in building process for Autodesk Maya and spend more time coding, instead.
image:
  path: images/blog/quick-reads/building-maya-devkit-plugins/banner.jpg
  thumbnail: images/blog/quick-reads/building-maya-devkit-plugins/banner.jpg
comments: true
share: true
read_time: true
---
{%- assign imgPath = "/images/blog/quick-reads/building-maya-devkit-plugins" -%}

<!-- Article Banner -->
<figure class="align-center">
	<img src="{{imgPath}}/image.jpg" alt="image">
<figcaption markdown="1">
Image by [Simon Abrams from Unsplash](https://unsplash.com/photos/k_T9Zj3SE8k)
</figcaption>
</figure>

It has always been cumbersome to build and load the C++ plugins available in the Maya devkit and, ever since Maya 2019, the Maya Windows devkit doesn't even include a _Visual Studio Solution_ to build its example plugins with just a few clicks.
Let's not even mention what to do when there are also scripts involved...

As I find myself often building and testing out the plugins in the devkit, I decided to document and share a simple workflow that I use to facilitate this.

<figure class="align-center" style="width:80%">
	<img src="{{imgPath}}/build1.png" alt="Command line building process">
<figcaption markdown="1">
Why couldn't it be as simple as this?
</figcaption>
</figure>

Let's get right to it.

### Requirements
* Autodesk Maya (2019+)
* CMake ([download](https://cmake.org/download/) and install)
* Visual Studio Community 2019 ([download](https://visualstudio.microsoft.com/vs/community/) and install)
* Maya devkit ([download](https://www.autodesk.com/developer-network/platform-technologies/maya))

### Setup
Once you have downloaded and installed everything, we need to extract the contents of the Maya devkit (_devkitBase_ folder) in a directory of your choosing (e.g., `C:\DEV\devkitBase`). From now onwards, we will call this directory `%DEVKITBASE%`.

#### Making sure Maya finds the plugins you build
With the devkit extracted, we need to make sure Maya will be able to find the plugins that we build. For this purpose, we need to add some environment paths to the version of Maya that you are using.

To do this, you need to go to `documents\maya\2020` (change "2020" with the version of Maya you are targeting) and open the _Maya.env_ file in a text editor (Notepad should do just fine). Within _Maya.env_, add the following environment variables, replacing `%DEVKITBASE%` with the directory where your devkitBase folder is in.

```
MAYA_PLUG_IN_PATH=%DEVKITBASE%\build\plug-ins
MAYA_SCRIPT_PATH=%DEVKITBASE%\build\scripts
```

Save and close the text editor. These variables will allow Maya to find the plugins next time you start the program.

### Building plugins
Now that the setup is complete, we need to build the plugin and put the files in the respective folders for Maya to find them. To do this, you can use a small batch script that automates this process. You can [download the _build.bat_ batch script here]({{imgPath}}/build.bat) and place it in `%DEVKITBASE%`.

If you prefer creating the batch file yourself (some _Browsers_ might flag bat files by default as harmful) you can open _Notepad_ and copy/paste the following:

```
@echo %off
rem We make sure the right folder structure exists
set DEVKIT_LOCATION=%~dp0%
if not exist %DEVKIT_LOCATION%\build md build
if not exist %DEVKIT_LOCATION%\build\plug-ins md build\plug-ins
if not exist %DEVKIT_LOCATION%\build\scripts md build\scripts
rem We ask the user for what version of Maya and what to build
set /p M_YEAR=Maya version (year):
set MAYA_LOCATION="C:\Program Files\Autodesk\Maya%M_YEAR%"
set PATH=%PATH%%MAYA_LOCATION%\bin;
set /p PLUGIN_NAME=Plugin name (folder):
cd devkit\plug-ins\%PLUGIN_NAME%
rem We build the plug-in
cmake -H. -B build -G "Visual Studio 16 2019"
cmake --build build
rem We move the build files to our custom build folder
for /R .\build\Debug\ %%f in (*.mll) do copy "%%f" %DEVKIT_LOCATION%\build\plug-ins\
for /R .\ %%f in (*.mel) do copy "%%f" %DEVKIT_LOCATION%\build\scripts\
echo:
echo Plug-in %PLUGIN_NAME% build and copied!
echo:
pause
```

Once pasted, you need to save the file in the `%DEVKITBASE%` directory with the `.bat` extension e.g., `build.bat`.

With the `build.bat` file ready, we can run it. Once opened, the command prompt will appear and ask you for what version of Maya you want to build a plugin.
Just enter the number version of Maya e.g., `2020` and hit _Enter_.

Afterwards, its going to ask you for the plugin name inside of the devkit. You can find all available C++ plugins in `%DEVKITBASE%\devkit\plug-ins`.
Just enter the name of the folder of the plugin e.g., `hwPhongShader`, `fileTexture`, `animExportUtil` and hit _Enter_.

The batch script will then proceed to build the desired plugin and put the build files inside the build folder at the `%DEVKITBASE%`.

<figure class="align-center" style="width:80%">
	<img src="{{imgPath}}/build2.png" alt="Command line building process finished">
<figcaption markdown="1">
Et voilà!
</figcaption>
</figure>

That's it, start Maya again and you should be able to automatically see the plugin in Maya's _Plug-in Manager_ (`Windows->Settings/Preferences->Plug-in Manager`).

### Closing remarks

The build files will reside in the build folder at the `%DEVKITBASE%`, but you can still find the created _Visual Studio Solution_ its plugin folder `%DEVKITBASE%\devkit\plug-ins\YOURPLUGIN\build\Project.sln`. There are plenty of other ways to build Maya devkit plugins, however, this is enough for my testing needs.

I hope this small article makes someone's life a bit easier when building Maya devkit plugins in the future.
If you found this article helpful, let me know in the comments below. I might then do future articles on writing plugins or dev in general.

Until next time!
