[[ -f /etc/bash/bashrc ]] && . /etc/bash/bashrc

complete -cf sudo

# vim bindings for shell
set -o vi

PATH="/opt/android-sdk-update-manager/platform-tools:/opt/android-sdk-update-manager/tools:/home/tim/bin:/home/tim/bin/eclipse:/usr/games/bin:$PATH"

PS1='\$ '
parse_git_branch ()
{
    git branch 2> /dev/null | grep '*' | sed 's#*\ \(.*\)#(git::\1)#'
}
export PS1="\$(parse_git_branch)$PS1"

export LD_PRELOAD=
export PATH

# Laziness
alias mount='sudo mount'
alias umount='sudo umount'
alias emerge='sudo emerge'
alias eix='sudo eix -F'
alias eix-sync='sudo eix-sync'
alias rc-update='sudo rc-update'
alias revdep-rebuild='sudo revdep-rebuild'
alias salt='sudo salt'

# Program defaults
alias bwm-ng='bwm-ng -I %ram0,ram1,ram2,ram3,ram4,ram5,ram6,ram7,ram8,ram9,ram10,ram11,ram12,ram13,ram14,ram15,sda,sdb,sdc,md0,lo,sit0'
alias preview='feh -g 700x700 -d'
alias mkisofs-qick='mkisofs -R -l -J'
alias cdrecord='cdrecord dev=5,0,0'

# Because most is less
alias less='most'

# To keep typos alive
alias snv="svn"
alias cim="vim"
alias bim="vim"
alias suod="sudo"
alias sduo="sudo"
