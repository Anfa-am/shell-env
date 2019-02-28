export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="af-magic"

plugins=(git gitfast history zeus ssh-agent bundler zsh-syntax-highlighting history-substring-search brew)

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR='nvim'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

bindkey -v
bindkey '^r' history-incremental-search-backward
bindkey '^j' vi-cmd-mode

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

alias vi=nvim

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
PATH=/usr/local/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
export PATH="/home/linuxbrew/.linuxbrew/opt/node@10/bin:$PATH"
