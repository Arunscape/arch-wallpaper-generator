#!/bin/bash

width=$1
height=$2
logosize=$3
text=$4

#resize arch logo

convert -background none -size $logosize Archlinux-icon-crystal-64.svg tmplogo.png



convert -size ${width}x${height} canvas:\#111111 tmplogo.png \
  -gravity center -composite \
  -font Courier -pointsize $((logosize/5)) -fill \#eeeeee -annotate +0+$logosize "$4" -gravity center \
  out.png


rm tmplogo.png
