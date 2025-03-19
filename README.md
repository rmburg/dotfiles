# Setup

```bash
git init --bare ~/.dotfiles
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dot remote add origin git@github.com:rmburg/dotfiles.git
dot fetch origin
dot switch <laptop/desktop>
```
