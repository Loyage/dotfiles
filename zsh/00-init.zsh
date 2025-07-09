# -----------------------------------------------------
# PATHs
# -----------------------------------------------------
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH" # For npm in nix
export PATH="/usr/lib/ccache/bin:$PATH"

# -----------------------------------------------------
# Exports
# -----------------------------------------------------
export EDITOR=nvim
export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"

# -----------------------------------------------------
# Carapace
# -----------------------------------------------------
if command -v carapace &>/dev/null; then
  export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
  zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
  source <(carapace _carapace)
fi
