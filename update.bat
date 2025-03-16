@echo off
cd /d %~dp0

REM Check if Python is installed
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
    "%cd%\PortablePython\python" gui.py
) ELSE (
    echo Python is installed.
    REM Run the Python GUI script using system Python
    python gui.py
)