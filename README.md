# Setup

```
git init --bare ~/.dotfiles
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dot config status.showUntrackedFiles no
dot remote add origin git@github.com:rmburg/dotfiles.git
dot pull origin main
