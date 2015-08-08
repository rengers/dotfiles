#!/usr/bin/env bash

# Initialize rbenv in shell
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# Requires both rbenv and ruby-build to be installed
(rbenv --version && rbenv install --version) || exit 1

# Get latest stable cruby and jruby version
LATEST_CRUBY_VERSION=`rbenv install --list | grep -E "^\s+[0-9\.]+$" | sort | tail -n 1`
LATEST_JRUBY_VERSION=`rbenv install --list | grep -E "^\s+jruby-[0-9\.]+$" | sort | tail -n 1`

# Only install if the version is not present
if (rbenv versions | grep $LATEST_CRUBY_VERSION)
then
  echo "CRuby $LATEST_CRUBY_VERSION already installed!"
else
  echo "Installing CRuby $LATEST_CRUBY_VERSION..."
  rbenv install $LATEST_CRUBY_VERSION
fi

if (rbenv versions | grep $LATEST_JRUBY_VERSION)
then
  echo "JRuby $LATEST_JRUBY_VERSION already installed!"
else
  echo "Installing JRuby $LATEST_JRUBY_VERSION..."
  rbenv install $LATEST_JRUBY_VERSION
fi
