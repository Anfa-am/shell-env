export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"

ZSH_THEME="af-magic"

plugins=(git gitfast history zeus bundler history-substring-search)

source $ZSH/oh-my-zsh.sh
set -o vi

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

bindkey -v
bindkey '^r' history-incremental-search-backward
bindkey '^j' vi-cmd-mode

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

eval "$(ssh-agent -s)"
ssh-add /root/.ssh/id_rsa

export PATH="$PATH:/opt/nvim-linux64/bin"

alias vi=nvim
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
