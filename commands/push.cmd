@echo off
setlocal

REM ===== Get repo name from current folder =====
for %%I in (.) do set "REPO_NAME=%%~nxI"
set "GITHUB_URL=https://github.com/sharky-2/%REPO_NAME%.git"

REM ===== Create .gitignore if it doesn't exist =====
if not exist ".gitignore" (
    echo Creating default .gitignore...
    (
        echo # Ignore node_modules
        echo node_modules/
        echo 
        echo # Ignore log files
        echo *.log
        echo 
        echo # Ignore OS files
        echo Thumbs.db
        echo .DS_Store
        echo 
        echo # Ignore editor files
        echo *.swp
        echo *.swo
        echo .vscode/
    ) > .gitignore
)

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

REM ===== Check and add remote origin =====
git remote get-url origin >nul 2>&1
if errorlevel 1 (
    echo Adding remote origin %GITHUB_URL%
    git remote add origin %GITHUB_URL%
) else (
    echo Remote origin exists. Updating URL...
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
