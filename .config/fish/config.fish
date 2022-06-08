if status is-interactive
    # Commands to run in interactive sessions can go here

    # Powerline
    powerline-daemon -q
    set fish_function_path $fish_function_path "/usr/share/powerline/bindings/fish"
    powerline-setup
end

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
# alias update="paru -Syu --devel && flatpak update"
function update --description 'Update packages from the repos, the AUR and Flatpak'
    paru -Syu --devel && flatpak update
end

# Variables
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
set -x EDITOR micro
set fzf_preview_dir_cmd exa --all --color=always
