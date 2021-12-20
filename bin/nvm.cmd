@echo off
set batchPath=%~dp0
if "%1" == "install" (
	call "%batchPath%..\install.cmd" %2
) else (
	if "%1" == "use" (
		call "%batchPath%..\use.cmd" %2
	) else (
		echo Error, you should type nvm install ^<version^> or nvm use ^<version^>.
		echo.
		echo Example:
		echo.
		echo      nvm install v17.3.0
		echo      nvm use v17.3.0
		echo.
	)
)