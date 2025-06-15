@echo off
setlocal

REM ===== Get repo name from current folder =====
for %%I in (.) do set "REPO_NAME=%%~nxI"
set "GITHUB_URL=https://github.com/sharky-2/%REPO_NAME%.git"

REM ===== Get commit message from arguments =====
set "COMMIT_MSG=Auto update"
if not "%~1"=="" (
    set "COMMIT_MSG=%*"
)

REM ===== Initialize Git if needed =====
if not exist ".git" (
    echo Git not initialized. Running git init...
    git init
    git add .
    git commit -m "%COMMIT_MSG%"
    git branch -M master
)

REM ===== Check if remote repo exists, create if not =====
echo Checking if remote repository exists...
gh repo view sharky-2/%REPO_NAME% >nul 2>&1
if errorlevel 1 (
    echo Remote repo not found. Creating on GitHub...
    gh repo create sharky-2/%REPO_NAME% --public --source=. --remote=origin --push
) else (
    echo Remote repo found. Setting remote URL...
    git remote add origin %GITHUB_URL% 2>nul
    git remote set-url origin %GITHUB_URL%
)

REM ===== Add, commit, pull and push =====
echo Adding files...
git add .

echo Committing changes...
git commit --allow-empty -m "%COMMIT_MSG%"

echo Pulling from GitHub (to avoid rejection)...
git pull origin master --allow-unrelated-histories

echo Pushing to GitHub (master)...
git push -u origin master

if errorlevel 1 (
    echo ❌ Push failed. Check repo permissions or GitHub link.
    exit /b 1
)

echo ✅ Push successful!
exit /b 0
