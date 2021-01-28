
#### Can I change the type of noise that NoiseFX uses?
<div markdown="1">
Yes, but you will need to modify the material within the _ShaderFX_ graph to do so.
1. Remember which attribute is being modified within the material's _Stylization (procedural)_ section when modifying the desired _NoiseFX_ values.
1. Open the [_ShaderFX graph_](../uber#shaderfx-graph) within the desired material.
1. Change the _CustomGraph_ node at the top-level from `false` to `true`. This will avoid overwriting your changes upon a _ShaderFX_ update.
1. Navigate to: `Material -> ForwardRenderPasses -> Color-DiffusePass -> Control Sets -> Procedural Control -> X Procedural`, where `X` is the procedural attribute that modifies the desired effect.
1. Depending on what kind of noise algorithm you use, you can hook up your own nodes within the _Noise2D_ or _Noise3D_ node.
</div>

#### Can I add support of NoiseFX to my own custom ShaderFX materials?
<div markdown="1">
Yes, you can add support of _NoiseFX_ to your own custom _ShaderFX_ materials.
1. Import the _mnpr_controlSets.sfx_ file (found on the _shaders_ folder of your _MNPRX_ installation), which contains all the nodes required to support _NoiseFX_.
1. Plug them as the last targets of a _Multi Pixel Shader_ node (4,5,6,7) for the styles to interpret them correctly.
You can take existing _MNPRX_ materials as reference, the control sets can be found within the _ShaderFX_ graph editor -> `Material -> ForwardRenderPasses -> Color-DiffusePass`.
</div>
