#!/bin/bash

width=${1:-3840}
height=${2:-2160}
logosize=${3:-614}


function generateWallpaper(){
  text=$1
  #resize arch logo
  convert -background none -size $logosize Archlinux-icon-crystal-64.svg tmplogo.png

  #output with caption
  convert -size ${width}x${height} canvas:\#111111 tmplogo.png \
    -gravity center -composite \
    -font Courier -pointsize $((logosize/5)) -fill \#eeeeee -annotate +0+$logosize "$text" -gravity center \
    out.png

  rm tmplogo.png
}

generateWallpaper "btw I use Arch"
