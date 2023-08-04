# Dot Files

This is a collection of configuration files for various programs I use.

## Installation
In order to install the dotfiles, clone this repository and run `stow` to your `$HOME` or `$XDG_CONFIG_HOME`:
```bash
git clone https://github.com/ivysochyn/dot-files.git dotfiles
cd dotfiles
```

For example, to symlink neovim configuration just run:
```bash
stow -t $HOME nvim
```

This will create symlinks to the nvim configuration files in home directory.

## Programs
The following programs are configured in this repository:
- [Neovim](https://neovim.io/)
- [git](https://git-scm.com/)
- [tmux](https://github.com/tmux/tmux/wiki)
