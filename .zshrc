# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/rasmus/.zshrc'

# autoload -Uz compinit
# compinit
# End of lines added by compinstall

# Plugins
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
alias ls="ls --color=auto"
alias ll="ls -lAh"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ip="ip -color=auto"
alias pacman="pacman --color=auto"
alias grupdate="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias sudo="sudo "

# Keybinds
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^H' backward-kill-word
bindkey ';5~' kill-word 

# Variables
export PATH=$PATH:/home/rasmus/.local/bin

# Powerline
powerline-daemon -q
. /usr/share/powerline/bindings/zsh/powerline.zsh
