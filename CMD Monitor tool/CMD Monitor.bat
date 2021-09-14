@ECHO off
title CMD Monitor
ECHO !-=Welcome to CMD monitoring=-!
ECHO.
:Beginning
ECHO -------------------------
ECHO [1] Hard drive files in directories
ECHO [2] Network information
ECHO [3] Installed Programs
ECHO [4] Installed Drivers
ECHO [5] Task list
ECHO [6] 
ECHO [7] 
ECHO [8] 
ECHO -------------------------
Choice /C 12345678 /N
goto MonitorCMD%errorlevel%



:MonitorCMD1
ECHO.
ECHO.
ECHO.
ECHO -------------------------
tree /f
ECHO -------------------------
Choice /M "Do you want to clear the Command Promps?"
If Errorlevel 2 Goto No
If Errorlevel 1 Goto Yes
:Yes
cls
Goto Beginning
:No
ECHO -------------------------
ECHO.
ECHO.
ECHO.
Goto Beginning

:MonitorCMD2
ECHO.
ECHO.
ECHO.
ECHO -------------------------
ipconfig /all
ECHO -------------------------
Choice /M "Do you want to clear the Command Promps?"
If Errorlevel 2 Goto No
If Errorlevel 1 Goto Yes
:Yes
cls
Goto Beginning
:No
ECHO -------------------------
ECHO.
ECHO.
ECHO.
Goto Beginning

:MonitorCMD3
ECHO.
ECHO.
ECHO.
ECHO -------------------------
wmic product get name
Choice /M "Do you want to clear the Command Promps?"
If Errorlevel 2 Goto No
If Errorlevel 1 Goto Yes
:Yes
cls
Goto Beginning
:No
ECHO -------------------------
ECHO.
ECHO.
ECHO.
Goto Beginning

:MonitorCMD4
ECHO.
ECHO.
ECHO.
ECHO -------------------------
driverquery /v
Choice /M "Do you want to clear the Command Promps?"
If Errorlevel 2 Goto No
If Errorlevel 1 Goto Yes
:Yes
cls
Goto Beginning
:No
ECHO -------------------------
ECHO.
ECHO.
ECHO.
Goto Beginning

:MonitorCMD5
ECHO.
ECHO.
ECHO.
ECHO -------------------------
tasklist /v
Choice /M "Do you want to clear the Command Promps?"
If Errorlevel 2 Goto No
If Errorlevel 1 Goto Yes
:Yes
cls
Goto Beginning
:No
ECHO -------------------------
ECHO.
ECHO.
ECHO.
Goto Beginning