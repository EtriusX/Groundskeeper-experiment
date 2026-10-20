@echo off
cd /d "%~dp0"
set PORT=3001
where node >nul 2>&1
if errorlevel 1 (
 echo Node.js is not installed or not in PATH. Install Node.js LTS and reopen this file.
 pause
 exit /b 1
)
echo.
echo Groundskeeper COMPLETE COLLECTION showdown (4 rounds, no centerpiece selection)
echo Open http://localhost:3001 in your browser.
echo Keep this window open while testing.
echo.
start "" "http://localhost:3001"
node server.js
pause
