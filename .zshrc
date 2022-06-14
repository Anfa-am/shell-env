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

plugins=(git gitfast history zeus ssh-agent bundler history-substring-search)

source $ZSH/oh-my-zsh.sh
set -o vi

export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR='nvim'
alias pio=~/.platformio/penv/bin/pio
alias onshape=google-chrome-stable --start-fullscreen --app=https://cad.onshape.com/documents
alias netflix=google-chrome-stable --start-fullscreen --app=https://netflix.com

bindkey -v
bindkey '^r' history-incremental-search-backward
bindkey '^j' vi-cmd-mode

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

export PATH=/home/anfa/Projects/kaldi/tools/python:${PATH}
export IRSTLM=/home/anfa/Projects/kaldi/tools/irstlm
export PATH=${PATH}:${IRSTLM}/bin
export PATH=$PATH:/home/anfa/Projects/kaldi/tools/kaldi_lm
export PATH=$PATH:/home/anfa/Projects/kaldi/tools/kaldi_lm
alias vi=nvim

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
PATH=/usr/local/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
#export PATH="/home/linuxbrew/.linuxbrew/opt/node@10/bin:$PATH"

export ANDROID_HOME=~/Android/Sdk
#export PATH=$PATH:$JAVA_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/anfa/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/anfa/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/anfa/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/anfa/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias battery=acpi -i

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/anfa/google-cloud-sdk/path.zsh.inc' ]; then . '/home/anfa/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/anfa/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/anfa/google-cloud-sdk/completion.zsh.inc'; fi
