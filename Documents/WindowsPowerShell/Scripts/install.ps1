shopt -s expand_aliases

echo "windotfiles" >> .gitignore
git clone --bare https://gitlab.com/mgalvanx/windotfiles $HOME/windotfiles
alias config='/mingw64/bin/git --git-dir=$HOME/windotfiles --work-tree=$HOME'
config checkout
config config --local status.showUntrackedFiles no

exec powershell
