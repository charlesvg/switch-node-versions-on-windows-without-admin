param (
	$NodeVersion
)
function Set-NodePath {
	param (
        $NodePath
    )
	
	if (Test-Path -Path $NodePath) {
		$modpath = [Environment]::GetEnvironmentVariable('PATH', 'User')
		$modpath = $modpath.Split(";")
		# Create empty array
		$newpath = @()
		for ($i=0; $i -lt $modpath.length; $i++) {
			if ($modpath[$i] -like '*node*win*') {
			} else {
				$newpath = $newpath + $modpath[$i]
			}
			
		}
		$newpath = $newpath + $NodePath
		$bla = [String]::Join(';',$newpath)
		
		[Environment]::SetEnvironmentVariable("PATH", $bla, 'User')
		return 0
	} else {
		return 1
	}
	

}

$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
$returnCode = (Set-NodePath -NodePath "$scriptPath\versions\node-$NodeVersion-win-x64")
exit $returnCode
