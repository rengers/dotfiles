#!/usr/bin/env bash

# Initialize rbenv in shell
eval "$(rbenv init -)"

# Requires both rbenv and ruby-build to be installed
(rbenv --version && ruby-build --version) || exit 1

# Get latest stable cruby version
LATEST_CRUBY_VERSION=`ruby-build --definitions | grep -E "^[0-9\.]+$" | sort | tail -n 1`

# Install using rbenv ruby-build
rbenv install $LATEST_CRUBY_VERSION
