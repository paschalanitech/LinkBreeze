
@echo off
title LinkBreeze Admin
cd /d "C:\Users\COM\LinkBreeze"

echo Checking LinkBreeze server...

curl.exe -s -o nul http://localhost:3000/login

if errorlevel 1 (
    echo Starting LinkBreeze...
    start "LinkBreeze Server" cmd /k "cd /d C:\Users\COM\LinkBreeze && npm.cmd run dev"
)

echo Waiting for LinkBreeze to start...

set /a tries=0

:wait
curl.exe -s -o nul http://localhost:3000/login

if not errorlevel 1 goto openadmin

set /a tries+=1
if %tries% geq 30 goto failed

timeout /t 2 /nobreak >nul
goto wait

:openadmin
echo Opening Admin Dashboard...
start "" http://localhost:3000/login
exit

:failed
echo LinkBreeze did not start. Check the server window.
pause
