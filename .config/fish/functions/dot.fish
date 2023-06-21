function dot --wraps 'git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' --description 'Wrapper for git to manage dotfiles'
  git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv;
end

