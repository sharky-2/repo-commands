@echo off
setlocal

REM === Main Command Dispatcher ===

:: Use UTF-8 to support ANSI escape sequences
chcp 65001 >nul

:: Get the ESC character (ASCII 27)
for /F %%a in ('"prompt $E & for %%b in (1) do rem"') do set "ESC=%%a"

:: Define color sequences
set "NAME=%ESC%[32m"
set "CALL=%ESC%[33m"
set "COMMAND=%ESC%[36m"
set "RESET=%ESC%[0m"

:: Check if argument is empty
if "%~1"=="" (
    echo Usage:
    echo   %CALL%"repo%RESET% %COMMAND%"-new"%RESET% %NAME%"project-name"%RESET%
    echo   %CALL%"repo%RESET% %COMMAND%"-edit"%RESET%
    echo   %CALL%"repo%RESET% %COMMAND%"-push"%RESET%
    echo   %CALL%"repo%RESET% %COMMAND%"-commit"%RESET% %NAME%"message"%RESET%
    echo   %CALL%"repo%RESET% %COMMAND%"-sync"%RESET% %NAME%"optional commit message"%RESET%
    echo   %CALL%"repo%RESET% %COMMAND%"-clone"%RESET% %NAME%"repository-url"%RESET%
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
    REM Pass remaining arguments (only commit message expected)
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