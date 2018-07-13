# Example aliases
alias zshconfig="vim ~/.zshrc"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/opt/kms/bin:$PATH
export EDITOR=vim
export VISUAL=vim

export GOPATH=~/Development/gocode
export PATH=$GOPATH/bin:$PATH

export PATH=~/bin:$PATH

alias mux=tmuxinator
alias escape_returns="/usr/bin/env ruby -e 'p ARGF.read'"
[ -f ~/.aliases ] && source ~/.aliases

ulimit -S -n 2048
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

