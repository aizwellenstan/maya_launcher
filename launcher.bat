@REM @echo off
set MAYA_VERSION=2022

set PROJNAME=myproj

set OCIO=M:\config.ocio

set MAYA_SHELF_PATH=%~dp0shelves
set MAYA_APP_DIR=%userprofile%\Documents\projects\%PROJNAME%\maya
if not exist %MAYA_APP_DIR% mkdir %MAYA_APP_DIR%

robocopy %~dp0scripts %MAYA_APP_DIR%\scripts\ /j /it

set MODULE_FOLDER=%MAYA_APP_DIR%\modules
if not exist %MODULE_FOLDER% mkdir %MODULE_FOLDER%

:: Check if the local version file exists
if not exist "%MODULE_FOLDER%\ver.txt" (
    echo Local version file not found. Updating module.
    robocopy %~dp0mod %MODULE_FOLDER%\ /j /it /E /IS
    goto maya
)

set /p nver=<%~dp0mod\ver.txt
set /p lver=<%MODULE_FOLDER%\ver.txt
if "%nver%" == "%lver%" (
echo no need update
) else (
    robocopy %~dp0mod %MODULE_FOLDER%\ /j /it /E /IS
)

:maya
call "C:\Program Files\Autodesk\Maya%MAYA_VERSION%\bin\maya.exe"
