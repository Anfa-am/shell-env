# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# ZSH_THEME="af-magic"

plugins=(git gitfast history zeus bundler history-substring-search)

source $ZSH/oh-my-zsh.sh
set -o vi

export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR='nvim'
alias pio=~/.platformio/penv/bin/pio
alias onshape=google-chrome-stable --start-fullscreen --app=https://cad.onshape.com/documents
alias netflix=google-chrome-stable --start-fullscreen --app=https://netflix.com
alias z=zellij

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
PATH=/usr/local/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
#export PATH="/home/linuxbrew/.linuxbrew/opt/node@10/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# ssh-add /Users/anfa/.ssh/id_ed25519
ssh-add /Users/anfa/.ssh/id_rsa

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/anfa/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/anfa/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/anfa/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/anfa/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
