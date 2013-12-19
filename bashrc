[[ -f /etc/bash/bashrc ]] && . /etc/bash/bashrc

if [[ $- != *i* ]]; then
    return
fi

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
if [ -z "$SSH_CLIENT" ]; then
    PS1='\[\e[0m\]\$ '
else
    PS1='\[\e[0;31m\]\h\[\e[0m\]\$ '
fi
parse_git_dirty ()
{
    [[ $(/usr/bin/git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
parse_vcs_branch ()
{
    if [ -d .git ]; then
        /usr/bin/git branch 2> /dev/null | grep '*' | sed "s/*\ \(.*\)/$(parse_git_dirty)\1/"
    elif [ -d .hg ]; then
        /usr/bin/hg branch 2> /dev/null
    fi
}
export PS1="\[\e[0;36m\]\$(parse_vcs_branch)$PS1"


# Aliases
alias ls='ls -F --color=auto'    #colors
alias l='ls -F --color=auto'    #colors
alias ll='ls -lsah --color=auto'  #long list
alias la='ls -AF --color=auto'  #show hidden
alias lx='ls -lXB --color=auto'  #sort by sextension
alias lk='ls -lSr --color=auto'  #sort by size biggest last
alias lc='ls -ltcr --color=auto' #sort by and show chagne times
alias lu='ls -ltur --color=auto' #sort by and show access time
alias lt='ls -ltr --color=auto'  #sort by date
alias lm='ls -al |more'          #pipe through more
alias lr='ls -lR'                #recursive
alias tree='tree -Csuh'          #alternative to recursive ls
alias df='df -kTh'
alias path='echo -e ${PATH//:/\\n}'
alias grep='grep --color=auto'

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
alias hald='sudo hald --daemon=yes --verbose=yes'

# Program defaults
alias bwm-ng='bwm-ng -I %ram0,ram1,ram2,ram3,ram4,ram5,ram6,ram7,ram8,ram9,ram10,ram11,ram12,ram13,ram14,ram15,sda,sdb,sdc,md0,lo,sit0'
alias preview='feh -g 700x700 -d'
alias mkisofs-qick='mkisofs -R -l -J'
alias cdrecord='cdrecord dev=5,0,0'
alias bundleupdate='vim -c BundleUpdate -c qa'

# To keep typos alive
alias snv="svn"
alias cim="vim"
alias bim="vim"
alias svim="vim"
alias suod="sudo"
alias sduo="sudo"
alias vm="mv"

# For spectrwm
unset LD_PRELOAD

# Get some bash completion
# Use eselect bashcomp to manage symlinks
[[ -f /etc/profile.d/bash-completion.sh ]] && source /etc/profile.d/bash-completion.sh

if [ -f /usr/bin/fortune ]; then
    command fortune 95% calvin firefly
fi

[[ -f $HOME/.bashrc_extra ]] && source $HOME/.bashrc_extra
