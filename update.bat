@echo off
cd /d %~dp0
IF EXIST .git (
    echo Already Setup Git
) ELSE (
    echo Seting up Git
    git init .
    git remote add origin "https://github.com/JurkoDev/dark-magic-pack-autoupdate.git"
    git fetch origin
    git checkout -f master 
)
echo Updating
git fetch
git checkout -f origin/master
git checkout master
git pull
