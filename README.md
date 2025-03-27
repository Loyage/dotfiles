# dotfiles

Loyage's dotfiles.

## 安装方法

> [!WARNING]
> 不推荐读者使用以下方法安装，该章节仅作原理介绍。  
建议读者在阅读配置文件具体内容后，取己所需，独立构建自己的dotfiles。
该 dotfiles 不会帮助你安装任何软件，仅仅是提供配置文件。

```bash
git clone https://github.com/Loyage/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

The next step will cover your own configs right now. Refer to `install.conf.yaml`  for which configs will be cover.

```bash
sudo ./install
```

🖥️ Zsh configuration is set to `~/.zshrc_custom` , to activate it, please add `source ~/.zshrc_custom` at the end of `~/.zshrc` .

```bash
if [ -f ~/.zshrc_custom ]; then
    source ~/.zshrc_custom
fi
```

## 有关内容介绍

简要说明一下该 dotfiles 涉及的软件以及选择它们的原因：

- [Kitty](https://sw.kovidgoyal.net/kitty/) : 终端模拟器  
  * 跨 macos，linux 平台，而 iterm 无法在 linux 中使用。
  * 颜值高，支持光标动画。
  * GPU 加速，理论性能更好（暂时没体验出来）。
- [MapleFont](https://github.com/subframe7536/Maple-font) : 等宽字体
  * 新颖，相较于 JetBrainsFont 等传统等宽字体支持更多种连字符。
  * 斜体的花体字豪堪，当然也有人不喜欢，这个根据个人喜好来就好。
- [zsh](https://www.zsh.org/) : shell
  * 比 bash 更强大，[ohmyzsh](https://ohmyz.sh/) 插件丰富。
  * fish 等 shell 虽然功能更多，但不完全兼容 bash 语法比较蛋疼。
- [oh-my-posh](https://ohmyposh.dev/) : Prompt 美化
  * ohmyzsh 的主题仅在 zsh 中有效，oh-my-posh 的配置文件则可以跨 shell。
  * [starship](https://starship.rs/) 也是一个不错的选择。
- [NeoVim](https://neovim.io/) : 编辑器
  * 相比 Vim 更现代，插件更丰富。
  * [LazyVim](https://www.lazyvim.org/) 提供了开箱即用的预配置，并采用了科学的插件管理模式。
- [Yazi](https://yazi-rs.github.io/) : TUI 文件资源管理器
  * 快捷键和 Vim 逻辑一致，操作更高效。
  * 可以配合 nvim 使用。
  * Mac 下的 Finder 太难用了。
- [LazyGit](https://github.com/jesseduffield/lazygit) : TUI git 工具
  * 快捷键和 Vim 逻辑一致，操作更高效。
  * 可以配合 nvim 使用。
  * 这个是真好用，既高效（相较于指令）又美观（相较于其他GUI git）。
- 其他终端工具：
  * [eza](https://github.com/eza-community/eza) : enhanced `ls`
  * [bat](https://github.com/sharkdp/bat) : enhanced `cat`
  * [fzf](https://github.com/junegunn/fzf) : enhanced `find`
  * [zoxide](https://github.com/ajeetdsouza/zoxide) : enhanced `cd`
  * [tealdeer](https://github.com/tealdeer-rs/tealdeer) : faster `tldr` (better `man`)
  * [fastfetch](https://github.com/fastfetch-cli/fastfetch) : system information fetcher

仅在 Linux 中有效：
- hyprland
  * ml4w
- waybar
- fontconfig
