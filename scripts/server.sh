#!/bin/bash

kindle=kindle

p=$(dirname "$0")

convert ~/.config/i3/grafana.png -rotate 90 $p/grafana.png
$p/png8.sh $p/grafana.png $p/_grafana.png
scp -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no $p/_grafana.png $kindle:/tmp/screen.png > /dev/null
ssh -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no $kindle /mnt/us/extensions/screen/bin/screen.sh update > /dev/null
