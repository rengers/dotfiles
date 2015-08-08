#!/usr/bin/env bash

# Useful functions to get platforms

function is_osx() {
  [[ "$OSTYPE" =~ ^darwin ]] || return 1
}

function is_ubuntu() {
  [[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1
}

function is_alinux() {
  [[ "$(cat /etc/system-release 2> /dev/null)" =~ 'Amazon Linux' ]] || return 1
}

function get_os() {
for os in osx ubuntu alinux; do
  is_$os; [[ $? == ${1:-0} ]] && echo $os
done
}
