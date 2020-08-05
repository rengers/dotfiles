#!/usr/bin/env bash
set -x

if [ ! -f ~/.cargo/bin/rustc ]; then
  echo "Installing Rustup..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
  echo "Rust already installed, skipping..."
fi
