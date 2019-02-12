[[ -f /etc/bash/bashrc ]] && . /etc/bash/bashrc

# Exit if non-interactive
[[ $- != *i* ]] && return
if [[ $SSH_CLIENT ]]; then
    if which tmux >/dev/null 2>&1; then
        test -z "$TMUX" && (tmux attach || tmux new-session)
    fi
fi

# For spectrwm
if [[ -f /usr/lib64/libswmhack.so ]]; then
    LD_PRELOAD='/usr/lib64/libswmhack.so'
else
    unset LD_PRELOAD
fi
complete -cf sudo  # complete sudo commands
set -o vi  # vim bindings for shell
shopt -s cdspell  # correct spelling on cd

# Path
export GOROOT="/usr/lib/go"
export GOPATH=$HOME/go  # Set go path for go development
PATH="/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/sbin:/usr/sbin"
[[ -d "/opt/bin" ]] && PATH="$PATH:/opt/bin"
[[ -d "/opt/android-sdk-update-manager/platform-tools" ]] && PATH="/opt/android-sdk-update-manager/platform-tools:$PATH"
[[ -d "/opt/android-sdk-update-manager/tools" ]] && PATH="/opt/android-sdk-update-manager/tools:$PATH"
[[ -d "/usr/games/bin" ]] && PATH="/usr/games/bin:$PATH"
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"
[[ -d "$GOPATH/bin" ]] && PATH="$GOPATH/bin:$PATH"
[[ -d "/usr/local/heroku/bin" ]] && PATH="/usr/local/heroku/bin:$PATH"
[[ -d "$HOME/.config/composer/vendor/bin" ]] && PATH="$HOME/.config/composer/vendor/bin:$PATH"
export PATH

# Editor and Pager
EDITOR="vim"
export EDITOR
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
PAGER="less -FirSwX"
MANPAGER="$PAGER"
export PAGER MANPAGER

# Sane background for kernel menuconfig
export MENUCONFIG_COLOR=blackbg

[[ -f $HOME/.pentadactylrc.$HOSTNAME ]] && export PENTADACTYL_INIT=":source $HOME/.pentadactylrc.$HOSTNAME"

# Prompt and window title of X terminals
[[ -f $HOME/.bash_prompt ]] && source $HOME/.bash_prompt

# Aliases
[[ -f $HOME/.bash_aliases ]] && source $HOME/.bash_aliases

# Get some bash completion
# Use eselect bashcomp to manage symlinks
[[ -f /etc/profile.d/bash-completion.sh ]] && source /etc/profile.d/bash-completion.sh

# Completions not managed via Gentoo
[[ -f $HOME/.bash_comp ]] && source $HOME/.bash_comp

# rvm settings
[[ -f $HOME/.bash_rvm ]] && source $HOME/.bash_rvm

# Custom functions
[[ -f $HOME/.bash_functions ]] && source $HOME/.bash_functions

# Anything specific to this host
[[ -f $HOME/.bashrc_extra ]] && source $HOME/.bashrc_extra

# added by travis gem
[[ -f $HOME/.travis/travis.sh ]] && source $HOME/.travis/travis.sh

# enable autojump if available
[[ -s /usr/share/autojump/autojump.bash ]] && source /usr/share/autojump/autojump.bash

[[ -f /usr/bin/fortune ]] && command fortune firefly calvin futurama hitchhiker

export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"

export GPG_TTY=`tty`

# google cloud
[[ -f "$HOME/.gc/google-cloud-sdk/path.bash.inc" ]] && source "$HOME/.gc/google-cloud-sdk/path.bash.inc"

which direnv &> /dev/null && eval "$(direnv hook bash)"
