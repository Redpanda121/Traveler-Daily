@echo off
title Start Hugo Blog

cd /d "%~dp0"

echo ========================================
echo Start Hugo local server
echo ========================================
echo.
echo Current folder:
echo %cd%
echo.

where hugo >nul 2>nul
if errorlevel 1 (
  echo ERROR: hugo command not found.
  echo Please check whether Hugo has been added to PATH.
  echo.
  pause
  exit /b 1
)

if not exist "hugo.toml" (
  echo ERROR: hugo.toml not found in current folder.
  echo Please put this bat file in your Hugo blog root folder.
  echo.
  pause
  exit /b 1
)

echo Hugo version:
hugo version
echo.

echo Opening browser...
start "" "http://127.0.0.1:1313/"

echo.
echo Hugo server is starting.
echo Open this URL if the browser does not open automatically:
echo http://127.0.0.1:1313/
echo.
echo Press Ctrl+C in this window to stop the server.
echo.

hugo server -D --bind 127.0.0.1 --baseURL http://127.0.0.1:1313/

echo.
echo Hugo server stopped.
pause
