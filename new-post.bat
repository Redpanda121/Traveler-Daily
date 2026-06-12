@echo off
title New Hugo Post

cd /d "%~dp0"

echo ========================================
echo Create a new diary post
echo ========================================
echo.

if not exist "hugo.toml" (
  echo ERROR: hugo.toml not found.
  echo Please put this bat file in your Hugo blog root folder.
  echo.
  pause
  exit /b 1
)

set /p filename=Enter file name, for example diary-005-today:

if "%filename%"=="" (
  echo No file name entered. Canceled.
  echo.
  pause
  exit /b 1
)

hugo new "content/posts/%filename%.md"

echo.
echo Created:
echo content\posts\%filename%.md
echo.
pause
