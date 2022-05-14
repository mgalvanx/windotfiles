
# When PSScriptRoot is called in a script. It value becomes the directory of the where the script is being run(We are simply renaming this variable to $profiledir)
$profiledir = $PSScriptRoot;

function Test-Administrator  {  
	$user = [Security.Principal.WindowsIdentity]::GetCurrent();
	(New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)  
}

# Edit whole dir, so we can edit included files etc
function edit-powershell-profile {
	vi $profileDir
}

function update-powershell-profile {
	& $profile
}
	
# Adding a module and script folder to $profile
$scripts = "$(split-path $profile)\Scripts"

# Adding Folder To Path In order to use them everywhere
#$env:path += $scripts

# Adding a function and alias in order to use dotfile repo
function config {
  git --git-dir="$HOME\windotfiles" --work-tree="$HOME" @ARGS 
}

# bash function
function bash {
  & 'C:\Program Files\Git\bin\bash.exe'
}

# winget doesn't add vim to path so this is a workaround
function vi {
  & 'C:\Program Files\vim\vim82\vim.exe' @ARGS
}

# Open file with default program
function open($file) {
  Invoke-item $file
}

# Remove When Winget Add Programs To Path
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
## Remove This as Well

foreach ( $includeFile in ("defaults", "unix") ) {
	Unblock-File $profileDir\$includeFile.ps1
. "$profileDir\$includeFile.ps1"
}

set-location $home
write-output "my stuff has been loaded"
