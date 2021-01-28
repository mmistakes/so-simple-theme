---
layout: documentation
title: Stylization control
type: Docs
excerpt: Breaking down the art-directed control
tags: [Docs, MNPRX]
comments: true
search: true
schema:
---
The stylization pipeline of MNPRX is controlled via a set of *control targets*, which are render targets (images) that locally control the behavior of a particular stylization effect on the screen. The control channels are generated automatically by MNPRX from the user-specified noiseFX and paintFX stylization.
{: .top2}

There are currently four control targets, each containing three control channels (RGB):

- Pigment-based effects (pigmentCtrlTarget in MNPRX)
- Canvas-based effects (canvasCtrlTarget)
- Edge-based effects (edgeCtrlTarget)
- Abstraction-based effects (abstractCtrlTarget)

The control targets are shared between all styles, meaning that they will keep their contents as you switch styles.

As much as possible, the control targets are designed so that their meaning is generic enough to be able to "transfer" cleanly from one style to the other. However, for highly specialized styles, the meaning of the control targets don't directly relate to other styles.

Usually, the way these control targets work is entirely transparent from the user. However, the contents of control targets are relevant if you want to use MNPRX-generated render targets outside of Maya, such as in Nuke.

## Control Target Assignments

This table summarizes how the controls are assigned to specific channels of control targets. See the *Control Details* section below for details on individual control channels.

| Name                | Channel | Generic             | Watercolor              | Frayed                  | Hatching               | Cutout               |
|---------------------|---------|---------------------|-------------------------|-------------------------|------------------------|----------------------|
| Pigment Control     | Red     | Pigment Variation   | -                       | -                       | Noise 1                | -                    |
|                     | Green   | Pigment Application | Granulation - Dry-brush | Granulation - Dry-brush | Noise 2                | -                    |
|                     | Blue    | Pigment Density     | Pigment Density         | Pigment Density         | Noise 3                | -                    |
| Canvas control   | Red     | Distortion          | Canvas Distortion    | Frayed Amplitude        | -                      | Canvas Distortion |
|                     | Green   | U-inclination       | -                       | -                       | Orientation Offset     | -                    |
|                     | Blue    | V-inclination       | -                       | -                       | -                      | -                    |
| Edge control        | Red     | Edge Intensity      | Edge Darkening          | Edge Darkening          | -                      | -                    |
|                     | Green   | Edge Width          | Edge Darkening Width    | Edge Darkening Width    | Hatching Width         | -                    |
|                     | Blue    | Edge Transition     | Gaps and Overlaps       | Gaps and Overlaps       | -                      | -                    |
| Abstraction control | Red     | Light Map           | Light Map               | Light Map               | Noise Blending Factors | Cutout Mask          |
|                     | Green   | Shape               | -                       | -                       | -                      | Color On/Off         |
|                     | Blue    | Blending            | Color Bleeding          | -                       | -                      | -                    |
{: .almost-full-width}

---

### Control Details
{: .top2}

The control values for each effect mostly transition smoothly between -1 and 1 (0 is the default).
The individual detailed values of current effects are found in the table below.

| Name                    | -1 (negative values) | 0                  | +1 (positive values)  |
|:------------------------|:---------------------|:------------------:|----------------------:|
| Granulation - Dry-brush | More granulation     | Global granulation | Dry-brush             |
| Pigment Density         | Diluted color        | Global density     | Denser color          |
| Canvas Distortion    | Not distorted        | Global distortion  | More distortion       |
| Frayed Amplitude        | Not frayed           | Global amplitude   | More amplitude        |
| Gaps and Overlaps       | Gaps                 | -                  | Overlaps              |
| Edge Darkening          | Not darkened         | Global darkening   | Darker                |
| Edge Width              | Thinner       -      | Global width       | Wider                 |
| Color bleeding          | -                    | Not bled           | Bled                  |
| Light Map               | Shade                | -                  | Light                 |
| Hatching Width          | Thinner              | Global width       | Wider                 |
| Hatching Orientation    | Clockwise            | Neutral            | Counter-clockwise     |
| Cutout Mask             | -                    | Cutout             | Not Cutout            |

---

## Artineering stylization control semantics

This part is of interest for artists/developers wanting to create their own styles, following the Artineering stylization control semantics.
Here we detail the generic semantics we use for control targets, to facilitate cross-stylization of scenes and re-usability of art-direction.

### Pigment-based effects

- **Pigment variation**, controls the degree at which the reflected color of a pigment deviates towards one or another color. E.g., green pigmentation that deviates to a more blue or yellow color in certain parts.
- **Pigment application**, controls how the pigment is placed over a canvas. This can be interpreted as the amount or pressure at which pigment is applied to achieve an effect. E.g., pigment granulation (Watercolor/Frayed).
- **Pigment density**, controls the concentration of the pigment placed over a canvas. This is especially relevant to transparent and translucent media ( i.e., watercolor, ink, colored pencils), but can also influence opaque media. E.g., dilution, lightness, saturation.

### Canvas-based effects

- **Canvas distortion**, controls the distortion caused by the canvas roughness on the rendered image. This is especially relevant for fluid media (i.e., watercolor, graffiti).
- **U-inclination** and **V-inclination**, control the inclination of the canvas, which generally affects the direction at which patterns or marks from fluid media evolve. However, generalizing upon this, these parameters are used to define the offset of existing patterns or marks in a horizontal or vertical direction. E.g., bleeding direction, cross-hatching direction, stroke direction.

### Edge-based effects

- **Edge intensity**, controls the edge strength/intensity within the stylized render. E.g., edge darkening (watercolor).
- **Edge width**, controls the edge thickness of the stylized render. E.g., edge darkening width (watercolor), hatching width.
- **Edge transition**, controls the edge transition of the subject in relation to neighboring elements. E.g., gaps and overlaps (watercolor).

### Abstraction-based effects

- **Light Map**, local adjustments of the base illumination term.
- **Shape**, controls the amount of shape abstraction/distortion of the subjects. E.g., hand tremors.
- **Blending**, controls the color blending at different parts of the stylized render. E.g., color bleeding (Watercolor).

{% include toc-side %}
