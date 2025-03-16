@echo off
cd /d %~dp0

REM Check if Python is installed

echo Checking if gui.py is present...
IF NOT EXIST gui.py (
    echo Downloading gui.py...
    powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/JurkoDev/dark-magic-pack-autoupdate/refs/heads/master/gui.py' -OutFile 'gui.py'"
)

echo Checking if updategit.bat is present...
IF NOT EXIST updategit.bat (
    echo Downloading updategit.bat...
    powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/JurkoDev/dark-magic-pack-autoupdate/refs/heads/master/updategit.bat' -OutFile 'updategit.bat'"
)
echo Checking if Python is installed...
python --version >nul 2>&1
IF ERRORLEVEL 1 (
    IF EXIST PortablePython (
        echo Portable Python is already extracted.
    ) ELSE (
        IF EXIST PortablePython.zip (
            echo Portable Python zip found. Skipping download.
        ) ELSE (
            echo Python is not installed. Downloading portable Python...
            powershell -Command "Invoke-WebRequest -Uri 'https://www.python.org/ftp/python/3.9.7/python-3.9.7-embed-amd64.zip' -OutFile 'PortablePython.zip'"
        )
        echo Extracting Python...
        powershell -Command "Expand-Archive -Path 'PortablePython.zip' -DestinationPath 'PortablePython'"
    )
    REM Run the Python GUI script using portable Python
    "%cd%\PortablePython\pip" install tkinter
    "%cd%\PortablePython\python" gui.py
) ELSE (
    echo Python is installed.
    REM Run the Python GUI script using system Python
    pip install tkinter
    python gui.py
)