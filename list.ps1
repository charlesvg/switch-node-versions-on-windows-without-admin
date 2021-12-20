$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
Write-Output "Installed node versions:"
Write-Output ""
Get-ChildItem -Path "$scriptPath\versions" -Name |
	Select-String -Pattern "(\n?node-v)(?<version>.+)-win" |
	Foreach-Object {
		$version = $_.Matches[0].Groups[2].Value
        Write-Output "    v$version"
    }
Write-Output ""