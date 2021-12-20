@echo off
set batchPath=%~dp0
if "%1" == "install" (
	call "%batchPath%..\install.cmd" %2
) else (
	if "%1" == "use" (
		call "%batchPath%..\use.cmd" %2
	) else (
		if "%1" == "list" (
			call "%batchPath%..\list.cmd"
		) else (
			echo Error, you should type nvm install ^<version^> or nvm use ^<version^> or nvm list
			echo.
			echo Example:
			echo.
			echo      nvm list
			echo      nvm install v17.3.0
			echo      nvm use v17.3.0
			echo.
		)
	)
)