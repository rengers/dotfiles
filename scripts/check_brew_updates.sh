#!/bin/bash

# Check for updates and redirect output to a variable
updates=$(/opt/homebrew/bin/brew outdated 2>/dev/null)

# Check if updates are empty
if [ -z "$updates" ]; then
  # No updates available
    echo "" > /Users/rengers/.brew_updates_cache
else
  # Updates available
    echo "📦" > /Users/rengers/.brew_updates_cache
fi

