#!/usr/bin/env bash

PACKAGES=(
  "eza"        # better ls
  "bat"        # better cat
  "zoxide"     # better cd
  "gomi"       # better rm
  "yazi"       # tui file manager
  "fzf"        # fuzzy finder
  "zellij"     # zellij terminal multiplexer
  "carapace"   # shell completion framework
  "vivid"      # color management
  "lazygit"    # git UI
  "oh-my-posh" # shell prompt
)

# --- Helper Functions ---
msg() {
  echo -e "\n\e[32m[INFO]\e[0m $1"
}

error() {
  echo -e "\n\e[31m[ERROR]\e[0m $1" >&2
  exit 1
}

# --- Main Logic ---
main() {
  local manager
  local install_cmd
  local packages_to_install=()

  # 1. Detect the package manager
  if command -v brew &>/dev/null; then
    manager="brew"
    install_cmd="brew install"
  elif command -v apt-get &>/dev/null; then
    manager="apt"
    install_cmd="sudo apt-get install -y"
    msg "Updating package lists with apt..."
    sudo apt-get update
  elif command -v pacman &>/dev/null; then
    manager="pacman"
    install_cmd="sudo pacman -S --noconfirm"
  else
    error "No supported package manager found (apt, pacman, brew, dnf, zypper)."
  fi

  msg "Detected package manager: $manager"

  # 2. Check which packages are already installed
  for pkg in "${PACKAGES[@]}"; do
    # Handle special cases for command names
    local check_cmd=$pkg
    if [[ "$pkg" == "fd-find" ]]; then
      check_cmd="fdfind"
    elif [[ "$pkg" == "bat" ]] && ! command -v bat &>/dev/null; then
      # If 'bat' command doesn't exist, maybe it's 'batcat' (for Ubuntu/Debian)
      check_cmd="batcat"
    fi

    if command -v "$check_cmd" &>/dev/null; then
      echo "  - $pkg (command: $check_cmd) is already installed. Skipping."
    else
      msg "Package '$pkg' is not installed. Adding to the list."
      packages_to_install+=("$pkg")
    fi
  done

  # 3. Install the missing packages
  if [ ${#packages_to_install[@]} -gt 0 ]; then
    msg "Starting installation for: ${packages_to_install[*]}"
    # Using an array for the command is safer.
    read -ra cmd_parts <<<"$install_cmd"
    "${cmd_parts[@]}" "${packages_to_install[@]}"
  else
    msg "All specified packages are already installed."
  fi

  # 4. Post-installation notes
  msg "Script finished."
  msg "Notes:"
  echo "  - For yazi to have full functionality (especially previews), you might need to install additional dependencies like 'ffmpegthumbnailer', 'unar', and 'jq'."
  echo "  - For fzf, you might want to run its installation script to get key bindings and fuzzy completion: \$(brew --prefix)/opt/fzf/install or similar."
  echo "  - If you see missing icons in yazi or other tools, consider installing a Nerd Font."
}

# --- Run Script ---
# Use set -e to exit on errors
set -e
main
set +e
