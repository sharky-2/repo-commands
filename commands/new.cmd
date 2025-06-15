@echo off
if "%~2"=="" (
    echo Please provide the app name.
    echo Usage: react -new "app-name"
    exit /b 1
)

REM Use second argument as app name
npx create-react-app "%~2"
exit /b %errorlevel%
