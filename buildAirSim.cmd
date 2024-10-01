@echo off

powershell -command ".\Colosseum\build.cmd"
if %ERRORLEVEL% neq 0 (
    exit /b 1
)


set plugin_folder=.\Unreal\Dronesim\Plugins\AirSim

REM Check if the folder exists
if exist "%plugin_folder%" (
    rmdir /s /q "%plugin_folder%"
)

robocopy .\Colosseum\Unreal\Plugins\AirSim "%plugin_folder%" /E
