# Setup

```bash
git init --bare ~/.dotfiles
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dot remote add origin git@github.com:Narcha/dotfiles.git
dot pull origin main
dot switch <laptop/desktop>
```
