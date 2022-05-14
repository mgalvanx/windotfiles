# Like Unix touch, creates new files and updates time on old ones
# PSCX has a touch, but it doesn't make empty files
function touch($file) {
	if ( Test-Path $file ) {
		Set-FileTime $file
	} else {
		New-Item $file -type file
	}
}

function grep($regex, $dir) {
	if ( $dir ) {
		get-childitem $dir | select-string $regex
		return
	}
	$input | select-string $regex
}

function grepv($regex) {
	$input | where-object { !$_.Contains($regex) }
}


function which($name) {
	Get-Command $name | Select-Object -ExpandProperty Definition
}

function sudo(){
	Invoke-Elevated @args
}
