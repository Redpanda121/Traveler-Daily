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

echo.
echo Recent commits:
git log --oneline -5

echo.
pause
