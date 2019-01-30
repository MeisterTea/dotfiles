#! /bin/sh

displays=$(xrandr -q | grep ' connected' | awk '{print $1}')
echo $displays
displaysCount=$(echo "$displays" | wc -l)
if [ "$displaysCount" -eq 1 ]; then
  if [ "$displays" = 'eDP1' ]; then 
    bspc monitor 'eDP1' -d 壱 弐 参 肆 伍 陸 漆 捌 玖 拾
  else
    bspc monitor "$displays" -d 壱 弐 参 肆 伍 陸 漆 捌 玖 拾
  fi
else
  for display in $displays
  do
    if [ "$display" = 'eDP1' ]; then
      bspc monitor "$display" -d 壱 弐 参 肆 伍
    else
      bspc monitor "$display"  -d 陸 漆 捌 玖 拾
    fi
  done
fi
