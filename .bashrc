set -o vi


# My aliases
alias config='/mingw64/bin/git --git-dir=$HOME/windotfiles --work-tree=$HOME'
alias in='cd $HOME/Nextcloud/notes/0_Inbox'

# Ignore Windows NTUSER file in gitbash
LS_COMMON="-hG"
LS_COMMON="$LS_COMMON --color=auto"
LS_COMMON="$LS_COMMON -I NTUSER.DAT\* -I ntuser.dat\*"

test -n "$LS_COMMON" &&
alias ls="command ls $LS_COMMON"
alias ll="ls -l"
alias la="ls -a"
alias lal="ll -a"

# Adds all file that have been modified
#alias gaf="config status | grep -i 'modified' | cut -d : -f 2"
