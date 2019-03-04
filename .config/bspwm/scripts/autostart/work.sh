~/.screenlayout/work_dual.sh &
#feh --bg-fill ~/Pictures/Wallpapers/firewatch_orange.png
feh --bg-fill ~/Pictures/Wallpapers/firewatch_orange.png --bg-fill ~/Pictures/Wallpapers/firewatch_orange.png
dbus-launch compton -CG --config ~/.compton.conf &
polybar work &
polybar work_external &
