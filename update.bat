@echo off
cd /d %~dp0

REM Check if Python is installed

echo Downloading gui.py...
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/JurkoDev/dark-magic-pack-autoupdate/refs/heads/master/gui.py' -OutFile 'gui.py'"


echo Downloading updategit.bat...
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/JurkoDev/dark-magic-pack-autoupdate/refs/heads/master/updategit.bat' -OutFile 'updategit.bat'"


echo Downloading gui.exe...
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/JurkoDev/dark-magic-pack-autoupdate/raw/refs/heads/master/gui.exe' -OutFile 'gui.exe'"


echo Executing gui.exe...
start gui.exe