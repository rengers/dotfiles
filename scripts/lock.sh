#!/bin/sh
set -e
#i3lock --nofork --show-failed-attempts --ignore-empty-password --tiling --image='/path/to/img.png'
i3lock-fancy-rapid 7 3 --nofork --show-failed-attempts --ignore-empty-password --tiling
xset dpms
