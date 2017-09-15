# vim: set filetype=sh :

# ls
if [[ -f /usr/bin/ls++ ]]; then
    alias ls='ls -F --color=auto'    #colors
    alias l='ls++ --potsf -F'    #colors
    alias ll='ls++ --potsf -ah'  #long list
    alias la='ls++ --potsf -A'  #show hidden
    alias lx='ls++ --potsf -B'  #sort by sextension
    alias lk='ls++ --potsf -Sr'  #sort by size biggest last
    alias lc='ls++ --potsf -tcr' #sort by and show chagne times
    alias lu='ls++ --potsf -tur' #sort by and show access time
    alias lt='ls++ --potsf -tr'  #sort by date
    alias lm='ls++ --potsf -a |more'          #pipe through more
    alias lr='ls++ --potsf -R'                #recursive
else
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
fi

# short cuts
alias tree='tree -Csuh'          #alternative to recursive ls
alias df='df -kTh'
alias path='echo -e ${PATH//:/\\n}'
alias grep='grep --color=auto'
alias igrep='grep -i'
alias rgrep='grep -R --exclude-dir=vendor'
alias rigrep='grep -i -R --exclude-dir=vendor'
alias mkpatch='diff -Naur'
alias open="xdg-open"

[[ -f /usr/bin/mpv ]] && alias mplayer="mpv"

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
alias salt-key='sudo salt-key'
alias salt-cloud='sudo salt-cloud'
alias salt-run='sudo salt-run'
alias salt-call='sudo salt-call'
alias hald='sudo hald --daemon=yes --verbose=yes'

# Program defaults
alias tmux='tmux -2'
alias bwm-ng='bwm-ng -I %ram0,ram1,ram2,ram3,ram4,ram5,ram6,ram7,ram8,ram9,ram10,ram11,ram12,ram13,ram14,ram15,sda,sdb,sdc,md0,lo,sit0'
alias preview='feh -g 700x700 -d'
alias mkisofs-qick='mkisofs -R -l -J'
alias bundleupdate='vim -c PluginUpdate -c qa'
alias pluginupdate='vim -c PluginUpdate -c qa'
alias vobcopy='vobcopy -v -m -F 16 /mnt/tmp'

# To keep typos alive
alias snv="svn"
alias cim="vim"
alias bim="vim"
alias svim="vim"
alias vom="vim"
alias ivm="vim"
alias imv="vim"
alias im="vim"
alias suod="sudo"
alias sduo="sudo"
alias vm="mv"
alias got='git'

[[ $(which hub 2> /dev/null) ]] && alias git="hub"

# Django shortcuts
alias runserver="./manage.py runserver"
alias prunserver="./manage.py runserver 0.0.0.0:8000"

alias flip-table='echo "(╯°□°）╯︵ ┻━┻"'
alias set-table='echo "┬──┬ ノ( ゜-゜ノ)"'

alias cp-hash="git rev-parse HEAD | tr -d '\n' | xclip"
alias cp-short="git rev-parse --short HEAD | tr -d '\n' | xclip"
