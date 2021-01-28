
#### I deleted the construction history, how can I still animate PaintFX?
<div markdown="1">
Animating _PaintFX_ requires the construction history created with the vertex color sets to keyframe the values. You will need to recover the required construction history.
1. Export the _PaintFX_ with the [Import/Export Tool](../import-export/).
2. Delete the _PaintFX_ using the [MNPRX Toolbox](../toolbox).
3. Add history -> `Edit Mesh->Transform`
3. Import the _PaintFX_ back in with the [Import/Export Tool](../import-export/).
The construction history will be in place and you can now animate the _PaintFX_ values.
</div>
