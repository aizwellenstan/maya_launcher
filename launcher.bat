@REM @echo off

set MAYA_VERSION=2023

set PROJNAME=myproj

set OCIO=%~dp0tool\settings\ocio\v5\config.ocio

set MAYA_SHELF_PATH=%~dp0shelves
set MAYA_APP_DIR=%userprofile%\Documents\projects\%PROJNAME%\maya
if not exist %MAYA_APP_DIR% mkdir %MAYA_APP_DIR%

robocopy %~dp0scripts %MAYA_APP_DIR%\scripts\ /it

set MODULE_FOLDER=%MAYA_APP_DIR%\modules
if not exist %MODULE_FOLDER% mkdir %MODULE_FOLDER%

robocopy %~dp0mod %MODULE_FOLDER%\ /it /E /IS /IT

call "C:\Program Files\Autodesk\Maya%MAYA_VERSION%\bin\maya.exe"
