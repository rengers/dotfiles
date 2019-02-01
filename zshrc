# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

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
plugins=(git bundle gem rails ruby rake virtualenv go hub docker brew)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/lib/lightdm/lightdm:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

export PATH="$HOME/scripts:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export PYTHONPATH="$HOME/.local/lib"
export LD_LIBRARY_PATH="$HOME/.local/lib"

# Golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Terraform - Source chtf
if [[ -f /usr/local/share/chtf/chtf.sh ]]; then
  source "/usr/local/share/chtf/chtf.sh"
fi

# Source any other .zshrc_ files we find
for f in ~/.zshrc_*; do source $f; done

PATH=/usr/local/sbin:/usr/local/bin:$PATH

# Load rbenv
eval "$(rbenv init - zsh)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Load direnv
eval "$(direnv hook zsh)"

# Aliases
alias gs='git status'
alias gd='git diff'
alias gc='git commit'
alias sz='source ~/.zshrc'
alias nim='nvim'
alias ez='nim ~/.zshrc'
