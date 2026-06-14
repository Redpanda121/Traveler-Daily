@echo off
title Connect Blog to GitHub

cd /d "%~dp0"

echo ========================================
echo Connect this blog to GitHub
echo ========================================
echo.
echo Before continuing:
echo 1. Create an empty PUBLIC repository on GitHub.
echo 2. Do not add a README, .gitignore, or license on GitHub.
echo 3. Copy the repository HTTPS address.
echo.

git remote get-url origin >nul 2>nul
if not errorlevel 1 (
  echo This blog is already connected to:
  git remote get-url origin
  echo.
  pause
  exit /b 0
)

set /p repo=Paste the GitHub repository HTTPS address:

if "%repo%"=="" (
  echo.
  echo No address entered. Canceled.
  pause
  exit /b 1
)

git remote add origin "%repo%"
if errorlevel 1 (
  echo.
  echo Could not add the GitHub address.
  pause
  exit /b 1
)

echo.
echo Saving the publishing setup ...
git add .
git commit -m "prepare blog for GitHub Pages"

echo.
echo Uploading the blog ...
echo Git may open a browser and ask you to sign in to GitHub.
git push -u origin HEAD
if errorlevel 1 (
  echo.
  echo Upload failed. The GitHub address is still saved.
  echo Check your login and internet connection, then run save-git.bat.
  pause
  exit /b 1
)

echo.
echo Upload finished.
echo Now open the repository on GitHub:
echo Settings - Pages - Source - GitHub Actions
echo Then open Actions and run the "Publish blog" workflow.
echo.
pause
