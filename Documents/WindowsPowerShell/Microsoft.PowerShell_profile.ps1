# Make powershell actually usable for vi mode
Set-PSReadlineOption -EditMode vi

# Adding a module and script folder to $profile
$scripts = "$(split-path $profile)\Scripts"
$modules = "$(split-path $profile)\Modules"

# Adding Folder To Path In order to use them everywhere
$env:path += $scripts
