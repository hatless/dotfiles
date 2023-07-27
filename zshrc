#!/usr/bin/env zsh

# Fig pre block. Keep at the top of this file.
# [[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

ZSH_DISABLE_COMPFIX="true"
OP_BIOMETRIC_UNLOCK_ENABLED=true

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "${HOME}/.zshrc"

# autoload -Uz compinit
# compinit
# End of lines added by compinstall
# autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit


# pyenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
if which pyenv > /dev/null; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi

if [[ $(uname -a | grep Darwin) ]]; then
    export BREWBASE=/usr/local
else
    export BREWBASE=~/.linuxbrew
fi

# load zgenom

test -f "${HOME}/.zgenom/zgenom.zsh" || \
    git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"

source "${HOME}/.zgenom/zgenom.zsh"

# Check for plugin and zgenom updates every 7 days
# This does not increase the startup time.
zgenom autoupdate

source ${BREWBASE}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath=(${BREWBASE}/share/zsh-completions $fpath)

# if the init script doesn't exist
if ! zgenom saved; then
    echo "Creating a zgenom save"
    zgenom load 'chrissicool/zsh-256color'
    zgenom load 'qianxinfeng/zsh-vscode'
    zgenom load 'skx/sysadmin-util'
    zgenom load 'tysonwolker/iterm-tab-colors'
    zgenom load 'ytet5uy4/pctl'
    zgenom load 'zpm-zsh/autoenv'
    zgenom load "zpm-zsh/colors"
    zgenom load "zpm-zsh/colorize"
    zgenom load "reegnz/jq-zsh-plugin"
    zgenom load "Dbz/zsh-kubernetes"
    zgenom load "djui/alias-tips"
    zgenom load "lukechilds/zsh-nvm"
    zgenom load "pbar1/zsh-terraform"
    zgenom load "blimmer/zsh-aws-vault"
    zgenom load "mdumitru/git-aliases"

    # zgenom ohmyzsh "plugins/aws"
    # zgenom ohmyzsh "plugins/brew"
    # zgenom ohmyzsh "plugins/dircycle"
    # zgenom ohmyzsh "plugins/docker"
    # zgenom ohmyzsh "plugins/git"
    # zgenom ohmyzsh "plugins/wd"
    zgenom save
fi

export NVM_DIR="$HOME/.nvm"

alias byod="networksetup -switchtolocation 'NBCU Non-Proxy' && networksetup -setairportnetwork en0 'NBCU_BYOD'"
alias corp="networksetup -switchtolocation 'NBCU AutoProxy' && networksetup -setairportnetwork en0 'NBCU_Corp'"
alias jcli="java -jar ~/jenkins-cli.jar -webSocket -auth @${HOME}/.jcli"
alias pj='npx projen'

#export http_proxy="http://proxy.anbcge.nbcu.com:80"
#export https_proxy="http://proxy.anbcge.nbcu.com:80"
export PATH=$HOME/go/bin:$PATH
export PATH="${BREWBASE}/sbin:$PATH"
export PCTL_PROXY_ADDRESS=proxy.inbcu.com PCTL_PROXY_PORT=80
fpath=($fpath ~/.zsh/completion)

[ -f ~/.kube/ranchercli ] && export RANCHER_TOKEN=$(cat ~/.kube/ranchercli)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="/home/stevekoppelman/.linuxbrew/bin:$PATH"

export VAULT_ADDR="https://vault.nbcnewstools.net/"

command -v "eksctl" > /dev/null && source <(eksctl completion zsh)
command -v "lsd" > /dev/null && alias ls='lsd'
command -v "svcat" > /dev/null && source <(svcat completion zsh)
command -v "helm" > /dev/null && source <(helm completion zsh)
command -v "goenv" > /dev/null && eval "$(goenv init -)"
command -v "sdkman" > /dev/null && source "$HOME/.sdkman/bin/sdkman-init.sh"


if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
    ##### WHAT YOU WANT TO DISABLE FOR WARP - BELOW
    command -v "starship" > /dev/null && eval "$(starship init zsh)"
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
    ##### WHAT YOU WANT TO DISABLE FOR WARP - ABOVE
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi

set -k
eval "$(/usr/local/bin/akamai --zsh)"

# To enable zsh auto-completion, run: eval "$(/usr/local/bin/akamai --zsh)"
# We recommend adding this to your .zshrc file
# _akamai_cli_bash_autocomplete() {
#     local cur opts base
#     COMPREPLY=()
#     cur="${COMP_WORDS[COMP_CWORD]}"
#     opts=$( ${COMP_WORDS[@]:0:$COMP_CWORD} --generate-auto-complete )
#     COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
#     return 0
# }

# complete -F _akamai_cli_bash_autocomplete akamai

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"


# # Fig post block. Keep at the bottom of this file.
# [[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/a206588409/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
