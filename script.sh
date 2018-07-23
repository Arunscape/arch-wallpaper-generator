#!/bin/bash

width=${1:-3840}
height=${2:-2160}
logosize=${3:-614}

rm -rf ./wallpapers
mkdir ./wallpapers

function generateWallpaper(){
  text=$1
  local count=$2
  #resize arch logo
  convert -background none -size $logosize Archlinux-icon-crystal-64.svg tmplogo.png

  #output with caption
  convert -size ${width}x${height} canvas:\#111111 tmplogo.png \
    -gravity center -composite \
    -font Courier -pointsize $((logosize/5)) -fill \#eeeeee -annotate +0+$logosize "$text" -gravity center \
    $count.png

  rm tmplogo.png
  mv $count.png ./wallpapers/$count.png
}

count=0
while read -r l; do
  generateWallpaper "$l" $count
  ((count++))
done <lines.txt
