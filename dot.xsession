#!/bin/sh

# /usr/share/doc/xfree86-common/examples/xsession

xhost +
/usr/bin/xmodmap .Xmodmap

export BROWSER='google-chrome'

# see /etc/x11/xinit/xinput.d/fcitx
#export XMODIFIERS="@im=fcitx"
#export GTK_IM_MODULE="fcitx"
#export QT_IM_MODULE="fcitx"

# stop warning messages
export NO_AT_BRIDGE=1 

/usr/bin/xterm -e tmux &
/usr/bin/emacs --daemon &
/usr/bin/google-chrome --no-startup-window &
#/bin/systemd --user &

[ -f /usr/bin/redshift ] && /usr/bin/redshift &
# [ -f /usr/bin/xcompmgr ] && /usr/bin/xcompmgr -cCfF -I-.02 -O-.04 -D0001 -t-5 -l-5 -r4.2 -o.82 &
# [ -f /usr/bin/rescuetime ] && /usr/bin/rescuetime &

[[ $XDG_VTNR -eq 8 ]] && exec /etc/alternatives/x-window-manager
