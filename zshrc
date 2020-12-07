#!/usr/bin/env zsh

ZSH_DISABLE_COMPFIX="true"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/a206588409/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

if [[ $(uname -a | grep Darwin) ]]; then
    export BREWBASE=/usr/local
    source "$HOME/.sdkman/bin/sdkman-init.sh"
else
    export BREWBASE=~/.linuxbrew
fi

source ${BREWBASE}/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source ${BREWBASE}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath=(${BREWBASE}/share/zsh-completions $fpath)

export ZPLUG_HOME=${BREWBASE}/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'chrissicool/zsh-256color', from:github
zplug 'qianxinfeng/zsh-vscode', from:github
zplug 'skx/sysadmin-util', from:github
zplug 'tysonwolker/iterm-tab-colors', from:github
zplug 'ytet5uy4/pctl'
zplug 'zpm-zsh/autoenv', from:github
zplug "zpm-zsh/colors"
zplug "zpm-zsh/colorize"
zplug "reegnz/jq-zsh-plugin"
zplug "~/workspace/spaceship-prompt", use:spaceship.zsh, from:local, as:theme
zplug "Dbz/zsh-kubernetes", from:github
zplug "djui/alias-tips"
zplug "gerges/oh-my-zsh-jira-plus", from:github
zplug "laggardkernel/zsh-thefuck", from:github
zplug "lukechilds/zsh-nvm"
zplug "pbar1/zsh-terraform"
zplug "blimmer/zsh-aws-vault"
zplug "plugins/aws", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/dircycle", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/jira", from:oh-my-zsh
zplug "plugins/vagrant", from:oh-my-zsh
zplug "plugins/wd", from:oh-my-zsh
zplug "unixorn/tumult.plugin.zsh", from:github

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo
        zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="$HOME/.nvm"

alias jcli="java -jar ~/Downloads/jenkins-cli.jar -s http://localhost:8080"
alias byod="networksetup -switchtolocation 'NBCU Non-Proxy' && networksetup -setairportnetwork en0 'NBCU_BYOD'"
alias corp="networksetup -switchtolocation 'NBCU AutoProxy' && networksetup -setairportnetwork en0 'NBCU_Corp'"

eval $(thefuck --alias)

#export http_proxy="http://proxy.anbcge.nbcu.com:80"
#export https_proxy="http://proxy.anbcge.nbcu.com:80"
export PATH=$HOME/go/bin:$PATH
export PATH="${BREWBASE}/sbin:$PATH"
export PCTL_PROXY_ADDRESS=proxy.inbcu.com PCTL_PROXY_PORT=80
test -e "jx" && source <(jx completion zsh)
fpath=($fpath ~/.zsh/completion)

[ -f ~/.kube/ranchercli ] && export RANCHER_TOKEN=$(cat ~/.kube/ranchercli)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="/home/stevekoppelman/.linuxbrew/bin:$PATH"
#export KUBECONFIG=~/.kube/config:~/.kube/config.dev-eks-cluster:~/.kube/config.dev-rancher:~/.kube/config.dev-nbcnewstools
kubeconfigs=(~/.kube/config*)
export KUBECONFIG=$(echo $kubeconfigs | tr ' ' ':')

command -v "eksctl" > /dev/null && source <(eksctl completion zsh)
command -v "lsd" > /dev/null && alias ls='lsd'
command -v "svcat" > /dev/null && source <(svcat completion zsh)
command -v "helm" > /dev/null && source <(helm completion zsh)
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/SteveKoppleman/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/SteveKoppleman/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/SteveKoppleman/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/SteveKoppleman/google-cloud-sdk/completion.zsh.inc'; fi

# pyenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
eval "$(pyenv init -)"

set -k
# To enable zsh auto-completion, run: eval "$(/usr/local/bin/akamai --zsh)"
# We recommend adding this to your .zshrc file
_akamai_cli_bash_autocomplete() {
    local cur opts base
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts=$( ${COMP_WORDS[@]:0:$COMP_CWORD} --generate-auto-complete )
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}

complete -F _akamai_cli_bash_autocomplete akamai

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

