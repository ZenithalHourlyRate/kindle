#!/bin/bash

kindle=kindle
src=~/.config/i3/grafana.png

p=$(dirname "$0")

convert $src -rotate 90 $p/grafana.png
$p/png8.sh $p/grafana.png $p/_grafana.png
scp -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no $p/_grafana.png $kindle:/tmp/screen.png > /dev/null
ssh -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no $kindle /mnt/us/extensions/screen/bin/screen.sh update > /dev/null
