alias zshrc="nvim ~/.dotfiles/zsh/"

alias echo_path='echo $PATH | tr ":" "\n"'

# Arch Linux
alias pacs="sudo pacman -S"
alias pacr="sudo pacman -Rs"
alias parus="paru -S"
alias parur="paru -Rs"
alias mirrorlist="sudo nvim /etc/pacman.d/mirrorlist"

# git config
alias gconf='git config user.name "loyage";git config user.email "792058350@qq.com"'
alias ggconf='git config --global user.name "loyage";git config --global user.email "792058350@qq.com"'

# eza -> ls
if command -v eza &>/dev/null; then
  alias ls='eza --icons'
  alias la='eza -A --icons'
  alias lt='eza -T --icons'
  alias lta='eza -T -A --icons'
  alias ll='eza -l --git --icons --header'
  alias lla='eza -l --git -A --icons --header'
fi

# bat -> cat
if command -v bat &>/dev/null; then
  alias cat='bat'
fi

# zoxide -> cd
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh --cmd cd)"
fi

# cd ..
alias ..='cd ..'
alias ...='cd ../..'


# cp -i -> cp; mv -i -> mv
# 交互模式 -i 可以防止在复制过程中意外覆盖文件。
alias cp='cp -i'
alias mv='mv -i'
# scp中断续传
alias scp='rsync -avP --partial'

# grep
alias grep='grep --color'

# git
alias gs='git status'

# lazygit
alias lg='lazygit'

# conda
alias act="conda activate"
alias deact="conda deactivate"
alias conrem="conda remove -n --all"

# for ssh in kitty
if [ "$TERM" = "xterm-kitty" ]; then
  alias ssh="kitten ssh"
fi

# better yazi
function yi() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# 快速创建 ssh 密钥
gensshkey() {
    if [ -z "$1" ]; then
        echo "Usage:"
        echo "  ssh-ck server-<server_name>   # Generate key for connecting to a specific server"
        echo "  ssh-ck github-<github_account> # Generate key for connecting to a GitHub account"
        return 1  # Exit with an error code to indicate incorrect usage
    fi

    user_host=$(whoami)@$(hostname)
    ssh-keygen -f "$HOME/.ssh/$1" -t rsa -N '' -C "$user_host to $1"
}

# tmux
alias ta='tmux attach-session -t'
alias tn='tmux new -s'
alias tk='tmux kill-session -t'

# fzf 加强版 cd nvim git_branch
alias fcd='cd "$(find . -type d | fzf --border --height 60% --preview="ls -la {}")"'
alias fnv='nvim "$(find . -type f | fzf --border --height 60% --preview="cat {}")"'
alias gcb='git branch | fzf --border --height 60% | cut -c 3- | xargs git checkout'

# nvidia-smi
alias smi='watch -n 2 -d nvidia-smi'
