@echo off
title Save Blog to Git

cd /d "%~dp0"

echo ========================================
echo Save blog changes to Git
echo ========================================
echo.

if not exist ".git" (
  echo ERROR: .git folder not found.
  echo Please put this bat file in your Git repository root folder.
  echo.
  pause
  exit /b 1
)

echo Current Git status:
git status --short
echo.

set /p message=Enter commit message, or press Enter to use update-blog:

if "%message%"=="" (
  set message=update-blog
)

echo.
echo Running git add ...
git add .

echo.
echo Running git commit ...
git commit -m "%message%"
if errorlevel 1 (
  echo.
  echo Nothing new was saved, or Git reported an error.
  echo Please read the message above.
  echo.
  pause
  exit /b 1
)

git remote get-url origin >nul 2>nul
if errorlevel 1 (
  echo.
  echo Saved on this computer.
  echo GitHub is not connected yet, so it was not uploaded.
) else (
  echo.
  echo Uploading to GitHub ...
  git push -u origin HEAD
  if errorlevel 1 (
    echo.
    echo Saved on this computer, but upload failed.
    echo Please check your internet connection or GitHub login.
  ) else (
    echo.
    echo Saved and uploaded. GitHub Pages will update the website automatically.
  )
)

echo.
echo Recent commits:
git log --oneline -5

echo.
pause
