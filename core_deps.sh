#!/usr/bin/env bash

source $HOME/dotfiles/platforms.sh

if is_alinux || is_rhel
then
  # Keep-alive: update existing `sudo` time stamp until the script has finished.
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
  sudo yum update -y
  sudo yum install -y python26
  sudo yum install -y python27
  sudo yum install -y python-devel
  sudo yum install -y ruby-devel
  sudo yum install -y python27-devel
  sudo yum install -y ruby19-devel
  sudo yum install -y golang
  sudo yum install -y git
  sudo yum install -y vim
  sudo yum install -y gcc openssl-devel readline-devel zlib-devel gcc-c++
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

  # Add Epel repo
  if ! (yum repolist | grep epel)
  then
    wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
    sudo rpm -uVh epel-release-6-8.noarch.rpm
    rm epel-release-6-8.noarch.rpm
  fi

  sudo yum install -y mosh
  sudo yum install -y tree

  # Java
  if ! ls /usr/java/jdk1.7*
  then
    echo "Installing Java 1.7"
    curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.rpm > jdk-7u79-linux-x64.rpm
    sudo rpm -Uvh jdk-7u79-linux-x64.rpm
    rm jdk-7u79-linux-x64.rpm
  else
    echo "Java 1.7 already installed"
  fi

  if ! ls /usr/java/jdk1.8*
  then
    echo "Installing Java 1.8"
    curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jdk-8u51-linux-x64.rpm > jdk-8u51-linux-x64.rpm
    sudo rpm -Uvh jdk-8u51-linux-x64.rpm
    rm jdk-8u51-linux-x64.rpm
  else
    echo "Java 1.8 already installed"
  fi
fi

if is_ubuntu
then
  # Keep-alive: update existing `sudo` time stamp until the script has finished.
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
  sudo apt-get install python2.7
  sudo apt-get install rbenv
  sudo apt-get install mosh
fi
