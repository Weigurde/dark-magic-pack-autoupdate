@echo off
cd /d %~dp0

REM Check if Python is installed

rem echo Downloading gui.py...
rem powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/JurkoDev/dark-magic-pack-autoupdate/refs/heads/master/gui.py' -OutFile 'gui.py'"


echo Downloading updategit.bat...
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/JurkoDev/dark-magic-pack-autoupdate/refs/heads/master/updategit.bat' -OutFile 'updategit.bat'"


rem echo Downloading gui.exe...
rem powershell -Command "Invoke-WebRequest -Uri 'https://github.com/JurkoDev/dark-magic-pack-autoupdate/raw/refs/heads/master/gui.exe' -OutFile 'gui.exe'"


rem echo Executing gui.exe...
rem start gui.exe
