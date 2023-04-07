#!/bin/bash

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
hostname=$(hostname)
hostresources=$userresources.$hostname
prefix=/home/tim/gentoo

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

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?* ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

if [ -f $HOME/bin/xstartup.${hostname} ]; then
    $HOME/bin/xstartup.${hostname}
fi

if [ -d /usr/share/fonts/terminus ]; then
    xset +fp /usr/share/fonts/terminus/
fi

if [ -d /usr/share/fonts/X11/misc ]; then
    xset +fp /usr/share/fonts/X11/misc/
fi

if [ -d $prefix/usr/share/fonts/terminus ]; then
    xset +fp $prefix/usr/share/fonts/terminus/
fi

exec dbus-launch --exit-with-session spectrwm 2&> $HOME/.spectrwm.log
