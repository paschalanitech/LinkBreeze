
@echo off
cd /d "%~dp0"

start "LinkBreeze Server" cmd /k "npm.cmd run dev"

timeout /t 8 /nobreak >nul

start "" http://localhost:3000
