echo "windotfiles" >> .gitignore
git clone --bare https://gitlab.com/mgalvanx/windotfiles $HOME/windotfiles
function get-dotfiles { git --git-dir="$HOME\windotfiles" --work-tree="$HOME"}
Set-Alias -Name config -Value get-dotfiles
config checkout
config config --local status.showUntrackedFiles no

powershell
