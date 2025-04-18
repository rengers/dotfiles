# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Start profilng
#zmodload zsh/zprof

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler gem ruby rake virtualenv golang github docker brew aws rust ssh-agent)

fpath+=~/.zfunc

source $ZSH/oh-my-zsh.sh

export LC_CTYPE="en_US.UTF-8"

# Customize to your needs...
export PATH=/usr/sbin:/usr/bin:/sbin:/bin:$PATH

export PATH="$HOME/scripts:$HOME/_scripts:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

#export PYTHONPATH="$HOME/.local/lib"
#export PYTHON3PATH="/usr/local/lib/python3.7/site-packages"

export LD_LIBRARY_PATH="$HOME/.local/lib"

# Golang
export GOPATH=~/go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Terraform - Source chtf
if [[ -f /usr/local/share/chtf/chtf.sh ]]; then
  source "/usr/local/share/chtf/chtf.sh"
fi

# Source any other .zshrc_ files we find
for f in ~/.zshrc_*; do source $f; done

PATH=/usr/local/sbin:/usr/local/bin:$PATH
PATH=/opt/homebrew/sbin:$PATH
PATH=/opt/homebrew/bin:$PATH

# Load rbenv
eval "$(rbenv init --no-rehash - zsh)"

# Load direnv
eval "$(direnv hook zsh)"

# Enable fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Node
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Java path
if [[ -f jenv ]]; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init - --no-rehash)"
fi
export JAVA_TOOLS_OPTIONS="-Dlog4j2.formatMsgNoLookups=true"



if [[ -f brew ]]; then
  export LLVM="`brew --prefix`/opt/emscripten/libexec/llvm/bin"
fi

# Load rust
source $HOME/.cargo/env

# Gstreamer
export PATH=/Library/Frameworks/GStreamer.framework/Versions/Current/bin:$PATH

#source /usr/local/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh
# Turn off profiling
#zprof

export PATH="$HOME/.toolbox/bin:$PATH"

 . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
