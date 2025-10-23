# -----------------------------------------------------
# OH MY ZSH
# -----------------------------------------------------

# -----------------------------------------------------
# Theme: Prompt 使用跨 shell 通用的 oh-my-posh 替代
# -----------------------------------------------------
# ZSH_THEME="robbyrussell"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# -----------------------------------------------------
# Prompt
#   不知为何，这个放 source $ZSH/oh-my-zsh.sh 后面就会有问题
# -----------------------------------------------------
# eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/EDM115-newline.omp.json)"

# -----------------------------------------------------
# omz 默认配置项
# -----------------------------------------------------
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Auto update settings
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 60

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# -----------------------------------------------------
# plugins
# -----------------------------------------------------
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# 插件列表和具体说明可见：
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
plugins=(
  ## aliases: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
  git
  brew
  eza
  conda
  archlinux

  # auto suggestions
  zsh-autosuggestions
  # highlights
  zsh-syntax-highlighting
  fast-syntax-highlighting
  # <Esc> twice to add 'sudo' before the last command
  sudo
  # load autojump, which can 'j' to frequently used folders
  autojump
  # zsh's vim mode
  # zsh-vi-mode
  # web_search google xxx
  web-search
  # <Alt> + ↑↓←→
  dirhistory
  # if alias exists, suggest it: https://github.com/MichaelAquilina/zsh-you-should-use
  you-should-use
)
export YSU_MESSAGE_POSITION="after"

zstyle ':omz:plugins:eza' 'icons' yes
zstyle ':omz:plugins:eza' 'header' yes
zstyle ':omz:plugins:eza' 'git-status' yes
zstyle ':omz:plugins:eza' 'dirs-first' yes

# zstyle ':omz:plugins:alias-finder' autoload yes
# zstyle ':omz:plugins:alias-finder' longer yes
# zstyle ':omz:plugins:alias-finder' exact yes
# zstyle ':omz:plugins:alias-finder' cheaper yes

# Don't load Oh My Zsh on Linux TTYs
[[ -z "$OMZ_LOAD" && $TTY = /dev/tty* && $OSTYPE = linux* ]] || source "$ZSH/oh-my-zsh.sh"

# -----------------------------------------------------
# Set-up zsh-vi-mode 设置不同模式不同光标
# -----------------------------------------------------
export VI_MODE_SET_CURSOR=true

# -----------------------------------------------------
# Set-up zsh-autosuggestions
# -----------------------------------------------------
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^L' autosuggest-accept
# zsh history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# -----------------------------------------------------
# Set-up FZF key bindings (CTRL R for fuzzy history finder)
# -----------------------------------------------------
source <(fzf --zsh)

# -----------------------------------------------------
# Set-up LANG
# -----------------------------------------------------
export LANG=zh_CN.UTF-8

