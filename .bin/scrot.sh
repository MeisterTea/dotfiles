#! /bin/sh

#FILEURI='~/Pictures/screenshot/%Y-%m-%d-%T-screenshot.png'
FILEURI='test'

scrot -e 'mv "$f" "FILEURI"'

# scrot -q 100  -e "mv $f "$fileUri" | printf $fileUri | xclip -selection clipboard" && notify-send "Screenshot taken"

