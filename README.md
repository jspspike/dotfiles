# dotfiles

A repo to handle config files. Uses a bare repo to easily download and place files into necessary locations. Script below taken from [Pin3appl3/dotfiles](https://github.com/P1n3appl3/dotfiles) to download dotfiles, set up `config` alias to interact with git repo and hide untracked files

```
git clone --bare git@github.com:jspspike/dotfiles.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```
