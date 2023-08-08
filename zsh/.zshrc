# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

DISABLE_MAGIC_FUNCTIONS="true"
COMPLETION_WAITING_DOTS="true"

# ZSH_THEME=af-magic
ZSH_THEME="powerlevel10k/powerlevel10k"

export ZSH=$HOME/.oh-my-zsh

export NPM_PACKAGES="/home/zejr/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules${NODE_PATH:+:$NODE_PATH}"

export PATH="/usr/local/go:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="$NPM_PACKAGES/bin:$PATH"

unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
# export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"


source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_profile
source /Users/ZeJr/.docker/init-zsh.sh || true # Added by Docker Desktop

. $HOME/.asdf/asdf.sh

plugins=(zsh-autosuggestions zsh-syntax-highlighting zsh-vi-mode asdf zsh-navigation-tools git kubectl)

# if [ -z "$TMUX" ]
# then
#     tmux attach -t TMUX || tmux new -s TMUX
# fi


if [ -f '/Users/ZeJr/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ZeJr/Downloads/google-cloud-sdk/path.zsh.inc'; fi

if [ -f '/Users/ZeJr/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ZeJr/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
