@echo off
setlocal

REM Check if inside a Git repo
if not exist ".git" (
    echo Git is not initialized in this folder. Run react -push first.
    exit /b 1
)

REM Check if at least one argument after -commit exists
if "%~2"=="" (
    echo Please provide a commit message.
    echo Usage: react -commit Your commit message here
    exit /b 1
)

REM Combine all args after -commit into one variable
set "commitMsg="
:loop
if "%~2"=="" goto done
set "commitMsg=%commitMsg% %~2"
shift
goto loop
:done

REM Trim leading space
set "commitMsg=%commitMsg:~1%"

echo Adding all changes...
git add .

echo Committing with message: "%commitMsg%"
git commit -m "%commitMsg%"

exit /b %errorlevel%
