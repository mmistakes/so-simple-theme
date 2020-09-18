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