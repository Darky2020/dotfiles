export CLICOLOR=1
export HOMEBREW_NO_AUTO_UPDATE=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
alias ll="ls -alG"

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '(%b) '

setopt PROMPT_SUBST
PROMPT='%B%F{#5ff964}%*%f%b %B%F{#bbd37b}${vcs_info_msg_0_}%f%b%B%F{#6872fe}%~%f%b$ '

alias vim="nvim"

export LC_CTYPE="en_US.UTF-8"
