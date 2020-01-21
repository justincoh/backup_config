[ -n "$PS1" ] && source ~/.zprofile;
source ~/.git-prompt.sh
#
# case insensitive autocompletion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# git autocompletion
zstyle ':completion:*:*:git:*' script ~/.git-completion.zsh
fpath=(~/$fpath)
autoload -Uz compinit && compinit

# fpath=(~/.zsh $fpath)
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="/Users/JCohen/.ebcli-virtual-env/executables:$PATH"
export PATH="/usr/local/bin/node:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
