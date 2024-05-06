param (
	$NodeVersion,
    $Arch = 64
)
Write-Output "Attempting to install node $NodeVersion ($Arch-bit)"

<#
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

#>

function DownloadFile($url, $targetFile)

{

   $uri = New-Object "System.Uri" "$url"

   $request = [System.Net.HttpWebRequest]::Create($uri)

   $request.set_Timeout(15000) #15 second timeout

   $response = $request.GetResponse()

   $totalLength = [System.Math]::Floor($response.get_ContentLength()/1024)

   $responseStream = $response.GetResponseStream()

   $targetStream = New-Object -TypeName System.IO.FileStream -ArgumentList $targetFile, Create

   $buffer = new-object byte[] 5000KB

   $count = $responseStream.Read($buffer,0,$buffer.length)

   $downloadedBytes = $count

   while ($count -gt 0)

   {

       $targetStream.Write($buffer, 0, $count)

       $count = $responseStream.Read($buffer,0,$buffer.length)

       $downloadedBytes = $downloadedBytes + $count

       Write-Progress -activity "Downloading file '$($url.split('/') | Select -Last 1)'" -status "Downloaded ($([System.Math]::Floor($downloadedBytes/1024))K of $($totalLength)K): " -PercentComplete ((([System.Math]::Floor($downloadedBytes/1024)) / $totalLength)  * 100)

   }

   Write-Progress -activity "Finished downloading file '$($url.split('/') | Select -Last 1)'"

   $targetStream.Flush()

   $targetStream.Close()

   $targetStream.Dispose()

   $responseStream.Dispose()

}

try {
	$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
	if (-Not (Test-Path -Path "$scriptPath\versions")) {
		New-Item -Path "$scriptPath" -Name "versions" -ItemType "directory" | Out-Null
	}
    if ($Arch = 64) {
        $ArchVersion = "x64"
    } elseif ($Arch = 32) {
        $ArchVersion = "x86"
    } else {
        $ArchVersion = "x64"
    }
	DownloadFile "https://nodejs.org/dist/$NodeVersion/node-$NodeVersion-win-$ArchVersion.zip" "$env:TEMP\out.zip"
	Expand-Archive -Force $env:TEMP\out.zip -DestinationPath "$scriptPath\versions\"
	Remove-Item -Force $env:TEMP\out.zip
	Write-Output "Succesfully installed node $NodeVersion ($Arch-bit)"
	exit 0
} catch {
	Write-Output "Unable to download node $NodeVersion ($Arch-bit). Are you sure it exists?"
	exit 1
}
