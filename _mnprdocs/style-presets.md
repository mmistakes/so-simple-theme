---
layout: documentation
title: Stylization presets
type: Docs
excerpt: Creating and loading stylization presets
tags: [Docs, MNPRX]
comments: true
schema:
redirect_from:
  - /projects/MNPRX/docs/style-presets/
---
_Stylization presets_ allow artists to easily switch between styles and stylization parameters within MNPRX. This tool can be opened by clicking on the `style` [shelf icon](../shelf).
{: .top2}

<figure class="align-center">
	<img src="/images/MNPRX/style-2.png" alt="Stylization presets window" style="max-width: 350px">
	<figcaption>The Stylization presets window will look similar to this, depending on which presets you have available.</figcaption>
</figure>

A stylization preset contains all the available attributes found in the [style configuration node](../config) (the node that gets selected when you press the `conf` [shelf icon](../shelf)), together with a small thumbnail of the current view.


## Saving presets
You can save as many presets as you want and these can be created at the top of the _Stylization presets_ window.
1. Name the current preset as desired in the highlighted text field
2. Press `Enter` or click on the `Save` button on the right
3. A new preset will appear in the list with all attributes found in the [style configuration node](../config).

When you save a preset with the same name as an existing one, the previously existing preset will be overwritten.
{: .notice--warning}


## Loading presets
Presets can be loaded into the current scene at any time.
1. Select the preset that you would like to load
2. Double click on the preset icon or click on the `Load` button at the bottom left

{% include aio-hint.html %} Use the **Filter presets** field to filter presets by name, and the drop-down on the right to filter by style.

Above the _Filter presets_ section, the loading options give you more refined control over the loading process:

* **Load world scale** - Whether to load the _world scale_ setting from the style. By default this is unchecked and the current world scale will be preserved when loading the style.
* **Load quality** -  Whether to load the _quality_ setting from the style. If this is unchecked, the current quality setting will be preserved when loading the style.
* **Load attributes** - Whether to load the main attributes of the style preset. This is on by default, but you can uncheck this option if you want to load only the substrates.
* **Load substrates** - Whether to load the substrate-related settings. If this is unchecked, the current substrate settings will be preserved when loading the style.


## Deleting presets
Presets can be deleted at any time.
1. Select the preset that you would like to delete
2. Click on the `Delete` button at the bottom right

 A deleted preset cannot be recovered by undoing changes.
 {: .notice--warning}

## Refreshing presets
Each stylization preset is saved under `MNPRX/presets/styles` as a _\*.json_ and _\*.jpg_ file. Each individual installation will have their own presets, but these can also be shared if MNPRX is stored in a network folder.

If you or someone else adds/deletes/modifies presets within the presets folder, you need to refresh the _Stylization presets_ window to grab the changes made: click on the `Refresh` button at the bottom.

{% include toc-side %}
