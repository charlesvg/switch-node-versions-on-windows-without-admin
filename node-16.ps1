
function Set-NodePath {
	param (
        $NodePath
    )
	
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
}


Set-NodePath -NodePath "$HOME\tools\node-v16.9.1-win-x64"

