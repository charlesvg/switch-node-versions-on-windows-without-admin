param (
	$NodeVersion
)
Write-Output "Attempting to install node $NodeVersion"

try {
	Invoke-WebRequest -OutFile $env:TEMP\out.zip -Uri https://nodejs.org/dist/$NodeVersion/node-$NodeVersion-win-x64.zip
	Expand-Archive -Force $env:TEMP\out.zip -DestinationPath "$HOME\tools\"
	Write-Output "Succesfully installed node $NodeVersion"
	exit 0
} catch {
	#then convert the status code enum to int by doing this
	$statusCodeInt = [int]$_.Exception.Response.StatusCode
	Write-Output "It looks like $NodeVersion does not exist. (Error code $statusCodeInt)"
	exit 1
}

