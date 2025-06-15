@echo off
setlocal enabledelayedexpansion

REM Check if inside a Git repo
if not exist ".git" (
    echo Git is not initialized in this folder. Initialize first.
    exit /b 1
)

REM Default commit message
set "commitMsg=Auto sync commit"

REM If arguments provided, combine them into commitMsg
if not "%~1"=="" (
    set "commitMsg="
    :combineLoop
    if "%~1"=="" goto combineDone
    set "commitMsg=!commitMsg! %~1"
    shift
    goto combineLoop
    :combineDone
    set "commitMsg=!commitMsg:~1!"
)

echo Adding all changes...
git add .

echo Committing with message: "%commitMsg%"
git commit -m "%commitMsg%"

echo Pulling latest changes from origin main...
git pull origin main --allow-unrelated-histories

echo Pushing changes to origin main...
git push origin main

if errorlevel 1 (
    echo ❌ Sync failed. Check your repo status or remote.
    exit /b 1
)

echo ✅ Sync successful!
exit /b 0
