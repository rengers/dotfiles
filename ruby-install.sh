#!/usr/bin/env bash
set -x

# Initialize rbenv in shell
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# Requires both rbenv and ruby-build to be installed
(rbenv --version && rbenv install --version) || exit 1

# Get latest stable cruby version
LATEST_CRUBY_VERSION=`rbenv install -l | sed -n '/^[[:space:]]*[0-9]\{1,\}\.[0-9]\{1,\}\.[0-9]\{1,\}[[:space:]]*$/ h;${g;p;}'`

# Only install if the version is not present
if (rbenv versions | grep $LATEST_CRUBY_VERSION)
then
  echo "CRuby $LATEST_CRUBY_VERSION already installed!"
else
  echo "Installing CRuby $LATEST_CRUBY_VERSION..."
  rbenv install $LATEST_CRUBY_VERSION
fi
