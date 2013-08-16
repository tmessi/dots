[[ -f /etc/bash/bashrc ]] && . /etc/bash/bashrc

# complete sudo commands
complete -cf sudo

# vim bindings for shell
set -o vi
shopt -s cdspell


# Path
PATH="/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/sbin:/usr/sbin"
test -d "/opt/bin" &&
PATH="$PATH:/opt/bin"
test -d "/opt/android-sdk-update-manager/platform-tools" &&
PATH="/opt/android-sdk-update-manager/platform-tools:$PATH"
test -d "/opt/android-sdk-update-manager/tools" &&
PATH="/opt/android-sdk-update-manager/tools:$PATH"
test -d "/usr/games/bin" &&
PATH="/usr/games/bin:$PATH"
test -d "$HOME/bin" &&
PATH="$HOME/bin:$PATH"
test -d "$HOME/bin/eclipse" &&
PATH="$HOME/bin/eclipse:$PATH"
export PATH


# Editor and Pager
EDITOR="vim"
export EDITOR
if [ -f /usr/bin/most ]; then
    PAGER="most"
    alias less='most'
else
    PAGER="less -FirSwX"
    unalias less &> /dev/null
fi
MANPAGER="$PAGER"
export PAGER MANPAGER


# Prompt
PS1='\$ '
parse_git_branch ()
{
    git branch 2> /dev/null | grep '*' | sed 's#*\ \(.*\)#(git::\1)#'
}
export PS1="\$(parse_git_branch)$PS1"


# Silly sudo
alias mount='sudo mount'
alias umount='sudo umount'
alias emerge='sudo emerge'
alias eix='sudo eix -F'
alias eix-sync='sudo eix-sync'
alias eix-update='sudo eix-update'
alias rc-update='sudo rc-update'
alias revdep-rebuild='sudo revdep-rebuild'
alias salt='sudo salt'

# Program defaults
alias bwm-ng='bwm-ng -I %ram0,ram1,ram2,ram3,ram4,ram5,ram6,ram7,ram8,ram9,ram10,ram11,ram12,ram13,ram14,ram15,sda,sdb,sdc,md0,lo,sit0'
alias preview='feh -g 700x700 -d'
alias mkisofs-qick='mkisofs -R -l -J'
alias cdrecord='cdrecord dev=5,0,0'

# To keep typos alive
alias snv="svn"
alias cim="vim"
alias bim="vim"
alias svim="vim"
alias suod="sudo"
alias sduo="sudo"

# For spectrwm
unset LD_PRELOAD
