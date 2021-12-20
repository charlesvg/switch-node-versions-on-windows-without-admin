@echo off
set batchPath=%~dp0
powershell.exe -file "%batchPath%use.ps1" -NodeVersion %1

if %errorlevel% == 1 (
	echo Node version %1 is not installed.
	echo Install it by typing
	echo.
	echo      nvm install %1
	goto END
) else (
	:: Weird race conditions happen if you inline multiple commands here, instead we use goto
	goto REFRESHANDPRINT
)

:REFRESHANDPRINT
call %batchPath%refreshenv.cmd"

SET ACTUAL_VERSION=
FOR /F %%I IN ('node -v') DO @SET "ACTUAL_VERSION=%%I"

@echo Now using node %ACTUAL_VERSION%

:END