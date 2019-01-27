#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

twm &
xclock -geometry 50x50-1+1 &
xterm -geometry 80x50+494+51 &
xterm -geometry 80x20+494-0 &
exec xterm -geometry 80x66+0+0 -name login

#####################################################
###############     Autostart      ##################
#####################################################

# run with reload
#exec_always --no-startup-id al-polybar-session
#exec_always --no-startup-id nitrogen --restore
exec_always --no-startup-id xrdb -load ~/.Xresources
exec_always --no-startup-id ~/.fehbg &

# If you have a numpad you may want to enable this
# exec_always --no-startup-id numlockx on

# run once
exec --no-startup-id xfsettingsd
exec --no-startup-id al-compositor --start
exec --no-startup-id ~/.fehbg &

# needed for super to launch rofi through ksuperkey, see ~/.xprofile
bindsym Mod1+F1 exec --no-startup-id rofi_run -r
