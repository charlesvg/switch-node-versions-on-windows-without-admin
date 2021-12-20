@echo off
set batchPath=%~dp0
WHERE pwsh.exe >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (@powershell.exe -file "%batchPath%install.ps1" -NodeVersion %1) else (@pwsh.exe -file "%batchPath%install.ps1" -NodeVersion %1)
if %errorlevel% == 0 (
	call "%batchPath%anynode.cmd" %1
)
