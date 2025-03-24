# dotfiles

Loyage's dotfiles.

## Install

```bash
git clone https://github.com/Loyage/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

⚠️ The next step will cover your own configs right now. Refer to `install.conf.yaml`  for which configs will be cover.

```bash
sudo ./install
```

🖥️ Zsh configuration is set to `~/.zshrc_custom` , to activate it, please add `source ~/.zshrc_custom` at the end of `~/.zshrc` .

```bash
if [ -f ~/.zshrc_custom ]; then
    source ~/.zshrc_custom
fi
```

## Software recommended

This dotfiles is not aimed to help you installing softwares, it's just dotfiles.

You should install them by your environment, but without installing them won't affect normal use (I guess).

- [Kitty](https://sw.kovidgoyal.net/kitty/) : The fast, feature-rich, GPU based terminal emulator.
- MapleMonoNerdFontNFCN
- oh-my-posh
- [Neovim](https://neovim.io/) : hyperextensible Vim-based text editor.
- [Yazi](https://yazi-rs.github.io/) : Blazing fast terminal file manager written in Rust, based on async I/O.
- [Lazygit](https://github.com/jesseduffield/lazygit) : A simple terminal UI for git commands
- [eza](https://github.com/eza-community/eza) : A modern replacement for ls.
- [bat](https://github.com/sharkdp/bat) : A cat clone with syntax highlighting and Git integration.
- fzf
- tmux
- fastfetch
- zoxide
- zsh
  * oh-my-zsh
    + fast-syntax-highlighting

## In some situation

- hyprland
  * ml4w
- waybar
- fontconfig
