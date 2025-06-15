@echo off
setlocal

if "%~1"=="" (
    echo Usage: clone.cmd repository-path
    echo Example: clone.cmd sharky-2/mouse-dot-effect
    exit /b 1
)

set REPO=%1
set URL=https://github.com/%REPO%.git

echo Cloning repository: %URL%
git clone "%URL%"
if errorlevel 1 (
    echo Failed to clone repository %URL%
    exit /b 1
)

echo Clone completed successfully.
exit /b 0
