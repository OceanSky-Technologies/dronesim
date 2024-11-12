@echo off

powershell -command ".\Colosseum\build.cmd --RelWithDebInfo"
if %ERRORLEVEL% neq 0 (
    exit /b 1
)

set plugin_folder=.\Unreal\Dronesim\Plugins\AirSim

REM Check if the folder exists
REM if exist "%plugin_folder%" (
REM     rmdir /s /q "%plugin_folder%"
REM )

robocopy .\Colosseum\Unreal\Plugins\AirSim "%plugin_folder%" /E
