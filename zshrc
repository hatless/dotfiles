# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jreese"
ZSH_THEME="tjkirch"

eval "$(rbenv init -)"

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(dircycle dirpersist extract colored-man brew themes git ruby osx jira sbt scala knife knife_ssh \
				sublime tmux screen gem dircycle gnu-utils go go-lang supervisor vagrant rbenv rake python pip \
  			rails rake tmuxinator bundler gitignore git-remote-branch git-extras github terminator profiles sudo \
				npm extract encode64 cp copydir copyfile nyan systemd terminalapp themes thor \
				common-aliases command-not-found jsontools postgres \
				vim-interaction vundle systemadmin zsh_reload repo debian atom autoenv autojump colorize colored-man \
				battery web-search extract urltools websearch docker)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/opt/kms/bin:$PATH
export EDITOR=vim
export VISUAL=vim

export GOPATH=~/Development/gocode
export PATH=$GOPATH/bin:$PATH

export PATH=~/bin:$PATH

alias mux=tmuxinator
alias ncr="cd ~/Development/novus-chef-repo"
alias d=cd "~/Development"
source ~/.aliases

ulimit -S -n 2048
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_55.jdk/Contents/Home"
export JAVA_OPTS="-Xmx5g -Xms5g -Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF8 -XX:MaxPermSize=256m -Xms512m -XX:+CMSClassUnloadingEnabled -XX:+UseConcMarkSweepGC ${JAVA_OPTS}"
source $(brew --prefix nvm)/nvm.sh
JIRA_RAPID_BOARD="true"

