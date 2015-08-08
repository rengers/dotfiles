#!/usr/bin/env bash

# Initialize rbenv in shell
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# Requires both rbenv and ruby-build to be installed
(rbenv --version && ruby-build --version) || exit 1

# Get latest stable cruby version
LATEST_CRUBY_VERSION=`ruby-build --definitions | grep -E "^[0-9\.]+$" | sort | tail -n 1`

# Only install if the version is not present
(rbenv versions | grep $LATEST_CRUBY_VERSION) && echo "CRuby $LATEST_CRUBY_VERSION already installed!" && exit 0

# Install using rbenv ruby-build
echo "Installing CRuby $LATEST_CRUBY_VERSION..."
rbenv install $LATEST_CRUBY_VERSION
