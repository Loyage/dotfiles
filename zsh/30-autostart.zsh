# -----------------------------------------------------
# AUTOSTART
# -----------------------------------------------------

# -----------------------------------------------------
# Pywal
# -----------------------------------------------------
if [ -f ~/.cache/wal/sequences ]; then
  \cat ~/.cache/wal/sequences
fi

# -----------------------------------------------------
# Fastfetch
# -----------------------------------------------------
if [[ $(tty) == *"pts"* ]]; then
    fastfetch --config examples/13
else
    echo
    if [ -f /bin/qtile ]; then
        echo "Start Qtile X11 with command Qtile"
    fi
    if [ -f /bin/hyprctl ]; then
        echo "Start Hyprland with command Hyprland"
    fi
fi
