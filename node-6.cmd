@echo off
set batchPath=%~dp0
powershell.exe -file "%batchPath%node-6.ps1"
call refreshenv.cmd

SET ACTUAL_VERSION=
FOR /F %%I IN ('node -v') DO @SET "ACTUAL_VERSION=%%I"

@echo Now using node %ACTUAL_VERSION%