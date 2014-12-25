#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
hostname=$(hostname)
hostresources=$userresources.$hostname

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    /usr/bin/xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    /usr/bin/xmodmap $sysmodmap
fi

if [ -f $userresources ]; then
    /usr/bin/xrdb -merge $userresources
fi

if [ -f $hostresources ]; then
    /usr/bin/xrdb -merge $hostresources
fi

if [ -f $usermodmap ]; then
    /usr/bin/xmodmap $usermodmap
fi

if [ -f $HOME/bin/xstartup ]; then
    $HOME/bin/xstartup
fi

xset +fp /usr/share/fonts/terminus/

exec /usr/bin/spectrwm 2&> $HOME/.spectrwm.log
