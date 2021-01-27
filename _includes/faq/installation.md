
#### I can't install 'only for me'
<div markdown="1">
If the user-based installation doesn't work, you can manually enter the required environment variable in the _Maya.env_ file.

1. Open the `Maya.env` file usually found in `Documents/maya/2020/Maya.env` with a text editor (make sure its the _Maya.env_ file of the version of Maya you want to install in)
1. Enter this environment variable: `MAYA_MODULE_PATH=_#YOURMNPRXPATH#_` (replace _#YOURMNPRXPATH#_ with the path where MNPRX is located)
1. (Windows only) After entering the environment variables and restarting Maya, run this _mel script_ within _Maya_: `setRenderingEngineInModelPanel "DirectX11"`
1. Restart Maya.
</div>

#### I can't install 'for ALL users'
<div markdown="1">
The installation for all users requires administrator rights in the computer where you are installing MNPRX in. This is because we need to put the _module_ file within _Program Files_.
To do this manually, follow the steps below:

1. Duplicate the _MNPRX.mod_ file within the MNPRX folder and open the duplicate with a text editor.
1. Change all `./` with the path to the MNPRX folder (with forward slashes) and save.
1. (Windows) Copy the edited MNPRX.mod and paste it in `C:/Program Files/Common Files/Autodesk Shared/Modules/Maya/2020` (paste it in the Maya version that you want to install MNPRX in).
1. (Windows) Run this _mel script_ within _Maya_: `setRenderingEngineInModelPanel "DirectX11"`
1. Restart Maya.
</div>
