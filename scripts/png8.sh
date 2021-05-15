#!/bin/bash
# need imagemagick as dependency
# need kindle_colors.gif
# usage: ./png8.sh input output.png

resolution=1264x1680

p=$(dirname "$0")

convert $1 -filter LanczosSharp -resize $resolution -background black -gravity center -extent $resolution -colorspace Gray -dither FloydSteinberg -remap $p/kindle_colors.gif -quality 75 -define png:color-type=0 -define png:bit-depth=8 $2
