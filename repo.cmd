@echo off
setlocal

REM === Main Command Dispatcher ===

if "%1"=="" (
    echo Usage:
    echo   repo -new "project-name"
    echo   repo -edit
    echo   repo -push
    echo   repo -commit "message"
    echo   repo -sync "optional commit message"
    echo   repo -clone "repository-url"
    exit /b 1
)
REM Store the commands folder path
set "cmdfolder=%~dp0commands"

if "%1"=="-new" (
    shift
    call "%cmdfolder%\new.cmd" %*
    exit /b %errorlevel%
)

if "%1"=="-edit" (
    call "%cmdfolder%\edit.cmd"
    exit /b %errorlevel%
)

if "%1"=="-push" (
    REM Remove the first argument (-push)
    shift
    REM Now %1 = branch, %2 = commit message (if any)
    call "%cmdfolder%\push.cmd" %*
    exit /b %errorlevel%
)

if "%1"=="-commit" (
    shift
    call "%cmdfolder%\commit.cmd" %*
    exit /b %errorlevel%
)

if "%1"=="-sync" (
    shift
    call "%cmdfolder%\sync.cmd" %*
    exit /b %errorlevel%
)

if "%1"=="-clone" (
    shift
    call "%cmdfolder%\clone.cmd" %2
    exit /b %errorlevel%
)

echo Unknown command: %1
exit /b 1