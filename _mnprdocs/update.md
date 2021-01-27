---
layout: documentation
title: Updating MNPRX
type: Docs
excerpt: Documentation on updating MNPRX
tags: [Docs, MNPRX]
comments: true
schema:
redirect_from:
  - /projects/MNPRX/docs/update/
---

It is important to update MNPRX to continue being able to render and benefit from all the latest features. The update from version to version should be seamless and all your presets and previously stylized scenes will continue working with the new version.
{: .top2}

## Replacing MNPRX
The easiest (though messy) way to update MNPRX is by replacing the existing files with the ones from the new version.
1. Download the latest MNPRX version and unzip all files.
1. Close all instances of _Maya_
1. Replace all the existing MNPRX files with the new ones.
1. Start _Maya_ and continue using MNPRX as you always have.

## Fresh Install
If you'd like to keep the old version or start fresh
1. Unzip all files and install the new version of MNPRX from a different directory, following the [installation instructions](../installation#installation).
2. Copy any presets from the `presets` folder of previous installations into the new version.

## Updating materials
{: #materials}
Up until the January 2021 update, the existing _ShaderFX_ materials in the scene needed to be updated to take advantage of new features. A prompt will appear when opening older scenes to do so. However, this can also be done in the _MNPRX shelf_, by right clicking on the _mPre_ tool -> _Update ShaderFX materials_.

<figure class="pull-center">
	<img src="/images/MNPRX/update-shaderfx.png" alt="Updating ShaderFX materials" style="max-width: 100%; width: 300px">
	<figcaption>Right click on the mPre tool -> Update ShaderFX materials.</figcaption>
</figure>

## FAQ
{% include faq/section.html file="updating.md" self-contained=true %}

{% include toc-side %}
