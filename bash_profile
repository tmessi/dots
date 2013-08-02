[[ -f ~/.bashrc ]] && . ~/.bashrc

# If X has not started, and this is tty1, startx through ssh-agent.
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    ssh-agent startx
    logout
fi
