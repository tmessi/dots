[[ -f /etc/bash/bashrc ]] && . /etc/bash/bashrc

# Exit if non-interactive
[[ $- != *i* ]] && return

unset LD_PRELOAD  # For spectrwm
complete -cf sudo  # complete sudo commands
set -o vi  # vim bindings for shell
shopt -s cdspell  # correct spelling on cd

# Path
export GOPATH=$HOME/go  # Set go path for go development
PATH="/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/sbin:/usr/sbin"
[[ -d "/opt/bin" ]] && PATH="$PATH:/opt/bin"
[[ -d "/opt/android-sdk-update-manager/platform-tools" ]] && PATH="/opt/android-sdk-update-manager/platform-tools:$PATH"
[[ -d "/opt/android-sdk-update-manager/tools" ]] && PATH="/opt/android-sdk-update-manager/tools:$PATH"
[[ -d "/usr/games/bin" ]] && PATH="/usr/games/bin:$PATH"
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"
[[ -d "$GOPATH/bin" ]] && PATH="$GOPATH/bin:$PATH"
export PATH

# Editor and Pager
EDITOR="vim"
export EDITOR
PAGER="less -FirSwX"
MANPAGER="$PAGER"
export PAGER MANPAGER


# Prompt and window title of X terminals
[[ -f $HOME/.bash_prompt ]] && source $HOME/.bash_prompt

# Aliases
[[ -f $HOME/.bash_aliases ]] && source $HOME/.bash_aliases

# Get some bash completion
# Use eselect bashcomp to manage symlinks
[[ -f /etc/profile.d/bash-completion.sh ]] && source /etc/profile.d/bash-completion.sh

# rvm settings
[[ -f $HOME/.bash_rvm ]] && source $HOME/.bash_rvm

# Custom functions
[[ -f $HOME/.bash_functions ]] && source $HOME/.bash_functions

# Anything specific to this host
[[ -f $HOME/.bashrc_extra ]] && source $HOME/.bashrc_extra

[[ -f /usr/bin/fortune ]] && command fortune 95% calvin firefly
