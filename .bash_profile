source ~/.aliases;
source ~/.bash_prompt;
source ~/git-completion.bash;

bind "set completion-ignore-case on";
bind "set show-all-if-ambiguous on";

# . ~/env_home/bin/activate;
export HS_ROOT=$HOME/handshake;
export DEVBOX=justin;
export AWS_DEFAULT_REGION=us-west-2;
# . /usr/local/bin/virtualenvwrapper.sh;
export PYTHONSTARTUP=~/.pythonrc;
export GREP_OPTIONS="--color=always";
export ANDROID_HOME=/usr/local/opt/android-sdk;
export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi';
export LSCOLORS='gxfxcxdxbxegedabagacad';
man() {
env \
LESS_TERMCAP_mb=$(printf "\e[1;31m") \
LESS_TERMCAP_md=$(printf "\e[1;31m") \
LESS_TERMCAP_me=$(printf "\e[0m") \
LESS_TERMCAP_se=$(printf "\e[0m") \
LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
LESS_TERMCAP_ue=$(printf "\e[0m") \
LESS_TERMCAP_us=$(printf "\e[1;32m") \
man "$@"
}
