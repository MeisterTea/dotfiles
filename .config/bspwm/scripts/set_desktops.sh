#! /bin/sh

#bspc monitor eDP1 -d 壱 弐 参 肆 伍 陸 漆 捌 玖 拾

displays=$(xrandr -q | grep ' connected' | awk '{print $1}')
displaysCount=$(echo "$displays" | wc -l)
if [ "$displaysCount" -eq 1 ]; then
  bspc monitor eDP1 -d 壱 弐 参 肆 伍 陸 漆 捌 玖 拾
else
  for display in $displays
  do
    if [ $display -eq 'DP2-1' ]; then
      bspc monitor DP2-1 -d 壱 弐 参 肆 伍
    else
      bspc monitor eDP1  -d 陸 漆 捌 玖 拾
      exit 0
    fi
  done
fi
