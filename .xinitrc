#!/bin/sh

# Start some nice programs

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Wallpaper
feh --bg-scale /home/Dion/.wallpaper-serenity-light.jpg &

# Bar
polybar --config=/home/Dion/.config/polybar/config.ini top &
polybar --config=/home/Dion/.config/polybar/config.ini bottom &

# Compositing
picom -c --config /home/Dion/.config/picom/picom.conf --experimental-backend &

# Launch Window Manager
exec openbox
