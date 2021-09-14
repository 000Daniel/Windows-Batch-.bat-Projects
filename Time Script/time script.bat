@echo off
mode con:cols=30 lines=4
title Time and Date
color 8

:TimeCount
cls
echo %time%   %date%
timeout /t 1
TimeCount;
goto TimeCount