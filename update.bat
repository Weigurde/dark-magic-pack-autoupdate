@echo off
cd /d %~dp0

REM Check if Git is installed
git --version >nul 2>&1
IF ERRORLEVEL 1 (
    IF EXIST PortableGit (
        echo Portable Git is already extracted.
        set PATH=%cd%\PortableGit\cmd;%PATH%
    ) ELSE (
        IF EXIST PortableGit48.exe (
            echo Portable Git executable found. Skipping download.
        ) ELSE (
            echo Git is not installed. Downloading portable Git...
            powershell -Command "Invoke-WebRequest -Uri 'https://github.com/git-for-windows/git/releases/download/v2.48.1.windows.1/PortableGit-2.48.1-64-bit.7z.exe' -OutFile 'PortableGit48.exe'"
        )
        echo Extracting Git...
        powershell -Command "Start-Process 'PortableGit48.exe' -ArgumentList '-o%cd%\PortableGit', '-y', '-gm2' -NoNewWindow -Wait"
        set PATH=%cd%\PortableGit\cmd;%PATH%
    )
) ELSE (
    echo Git is installed.
)

IF EXIST .git (
    echo Already Setup Git
) ELSE (
    echo Setting up Git
    git init .
    git remote add origin "https://github.com/JurkoDev/dark-magic-pack-autoupdate.git"
    git fetch origin
    git checkout -f master 
)
echo Updating
git fetch
git reset --hard origin/master
git checkout -f master
git checkout master 
git pull
