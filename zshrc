#!/usr/bin/env zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

alias vlj='curl -X POST  -F "jenkinsfile=<Jenkinsfile" http://localhost:8080/pipeline-model-converter/validate'

autoload -Uz compinit
compinit
# End of lines added by compinstall

if $(uname -a | grep linux); then
				export BREWBASE=/usr/local
else
				export BREWBASE=~/.linuxbrew
fi

source ${BREWBASE}/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source ${BREWBASE}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath=(${BREWBASE}/share/zsh-completions $fpath)

export ZPLUG_HOME=${BREWBASE}/opt/zplug 
source $ZPLUG_HOME/init.zsh

zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/aws",   from:oh-my-zsh
zplug "plugins/brew",   from:oh-my-zsh
zplug "plugins/dircycle",   from:oh-my-zsh
zplug "plugins/docker",   from:oh-my-zsh
zplug "plugins/jira",   from:oh-my-zsh
zplug "plugins/vagrant",   from:oh-my-zsh
zplug "plugins/wd",   from:oh-my-zsh
zplug "~/workspace/spaceship-prompt", use:spaceship.zsh, from:local, as:theme
zplug 'chrissicool/zsh-256color', from:github
zplug 'qianxinfeng/zsh-vscode', from:github
zplug 'zpm-zsh/autoenv', from:github
zplug "Dbz/zsh-kubernetes", from:github
zplug "gerges/oh-my-zsh-jira-plus", from:github
zplug 'tysonwolker/iterm-tab-colors', from:github
zplug 'chrissicool/zsh-256color', from:github
zplug "lukechilds/zsh-nvm"
zplug 'ytet5uy4/pctl'
zplug 'skx/sysadmin-util', from:github
zplug "djui/alias-tips"

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="$HOME/.nvm" && . "/usr/local/opt/nvm/nvm.sh"

alias jcli="java -jar ~/Downloads/jenkins-cli.jar -s http://localhost:8080"
alias byod="networksetup -switchtolocation 'NBCU Non-Proxy' && networksetup -setairportnetwork en0 'NBCU_BYOD'"
alias corp="networksetup -switchtolocation 'NBCU AutoProxy' && networksetup -setairportnetwork en0 'NBCU_Corp'"

test -e "lsd" && alias ls='lsd'

#export http_proxy="http://proxy.anbcge.nbcu.com:80"
#export https_proxy="http://proxy.anbcge.nbcu.com:80"
export PATH=$HOME/go/bin:$PATH
export PATH="${BREWBASE}/sbin:$PATH"
source "$HOME/.sdkman/bin/sdkman-init.sh"
export PCTL_PROXY_ADDRESS=proxy.inbcu.com PCTL_PROXY_PORT=80
test -e "jx" && source <(jx completion zsh)
fpath=($fpath ~/.zsh/completion)

[ -f ~/.kube/ranchercli ] && export RANCHER_TOKEN=$(cat ~/.kube/ranchercli)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
#export KUBECONFIG=~/.kube/config:~/.kube/config.dev-eks-cluster:~/.kube/config.dev-rancher:~/.kube/config.dev-nbcnewstools
kubeconfigs=(~/.kube/config*)
export KUBECONFIG=$(echo $kubeconfigs | tr ' ' ':')

test -e "eksctl" && source <(eksctl completion zsh)
test -e "svcat" && source <(svcat completion zsh)
test -e "helm" && source <(helm completion zsh)
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/SteveKoppleman/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/SteveKoppleman/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/SteveKoppleman/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/SteveKoppleman/google-cloud-sdk/completion.zsh.inc'; fi
