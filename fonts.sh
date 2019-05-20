#!/usr/bin/env bash

set -x
echo "Installing patched fonts"

# Pull down the font repo
git clone https://github.com/powerline/fonts.git

cd fonts && ./install.sh
