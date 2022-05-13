# Make powershell actually usable for vi mode
Set-PSReadlineOption -EditMode vi

# Adding a module and script folder to $profile
$scripts = "$(split-path $profile)\Scripts"
$modules = "$(split-path $profile)\Modules"

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

# adding vim Function
#function vi {
#  & 'C:\Program Files\vim\vim82\vim.exe' @
#}

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