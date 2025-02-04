[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi='nvim'
alias src='source ~/.zshrc'

export EDITOR=nvim
export VISUAL=$EDITOR

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

bindkey -v
zstyle :compinstall filename '/home/pohlrabi/.zshrc'

autoload -Uz compinit
compinit

eval $(ssh-agent) >/dev/null

# fzf integration
source <(fzf --zsh)
source <(starship init zsh)
