@echo off
if not exist "starwarsjedifallenorder.exe" (
@cd /d "%~dp0"
)
Setlocal EnableDelayedExpansion

title Star Wars Jedi: Fallen Order

Echo Checking access level...

net session >Nul 2>&1

if %errorLevel% == 0 (
Echo Now setting up wrong date...
set realdate=%date:.=-%
date 01-12-2019

Echo Loading timeout...

set file=launcher_timeout.cfg

if not exist "launcher_timeout.cfg" (
set /A timeout=60
) else (
set /P timeout=<!file!
)

if "!timeout!" LSS "1" (
set /A timeout=60
)

Echo Running game...
start starwarsjedifallenorder.exe

Echo Waiting for game will launched and we can reset time to real...
timeout /T !timeout! /NOBREAK

Echo Resetting time...
goto date

) Else (
echo Error: run as Admin!
pause
goto exit
)


:date
date %realdate%


:exit
Echo Done!