#!/usr/bin/env bash

# Formatted list of all active keybindings and descriptions
BINDS=$(cat << 'LIST'
󰌌 Super + Return             Launch Terminal (Kitty)
󰌌 Super + ` (grave)           Toggle Dropdown Scratchpad
󰌌 Super + Q                   Close active window
󰌌 Super + Alt + Space         Toggle window floating
󰌌 Super + F                   Toggle fullscreen
󰌌 Super + D                   Toggle fake fullscreen (mode 1)
󰌌 Super + Shift + V           Toggle layout split direction
󰌌 Super + Escape              Kill unresponsive window (hyprctl kill)

󰌌 Super + [Arrow / H J K L]   Change focus direction
󰌌 Super + Alt + [Arrows/HJKL] Resize active window pane
󰌌 Super + Shift + [Arrows/HJKL] Move window inside layout
󰌌 Super + Ctrl + Shift + [L/R]  Move window to next/previous monitor workspace
󰌌 Super + [1-9]               Focus workspace (1 to 9)
󰌌 Super + Shift + [1-9]       Move window to workspace (1 to 9)
󰌌 Super + Ctrl + [1-9]        Relative workspace navigation
󰌌 Super + S                   Toggle special workspace
󰌌 Super + Shift + S           Move window to special workspace
󰌌 Alt + Tab                   Cycle next window
󰌌 Super + Tab                 Open Noctalia window switcher

󰌌 Super + Space               Open Noctalia app launcher
󰌌 Super + E                   Open File Manager (Dolphin)
󰌌 Super + W                   Open Web Browser
󰌌 Super + T                   Open Text Editor
󰌌 Super + C                   Open Calculator
󰌌 Super + Z                   Open Noctalia Settings
󰌌 Super + X                   Open Noctalia Control Center
󰌌 Super + A                   Open Notifications panel
󰌌 Super + V                   Open Clipboard manager
󰌌 Super + Shift + W           Open Wallpaper selector
󰌌 Super + Period              Open Emoji picker
󰌌 Super + Alt + C             Open Session power menu
󰌌 Super + Ctrl + L            Lock screen session
󰌌 Ctrl + Shift + Escape       Open System Monitor (btop)

󰌌 Super + P                   Pick color from screen (Hyprpicker)
󰌌 Print                       Screenshot region
󰌌 Super + Print               Screenshot fullscreen
󰌌 Super + Plus / Minus        Zoom screen in / out
󰌌 Super + R                   Show this keybinding cheatsheet
LIST
)

# Open using whichever menu runner is installed on your system
if command -v rofi &> /dev/null; then
    echo "$BINDS" | rofi -dmenu -i -p "Keybindings" -theme-str 'window {width: 650px;} listview {lines: 18;}'
elif command -v wofi &> /dev/null; then
    echo "$BINDS" | wofi --dmenu --prompt "Keybindings" --width 650 --lines 18
elif command -v fuzzel &> /dev/null; then
    echo "$BINDS" | fuzzel --dmenu --prompt "Keybindings: " --width 55
elif command -v tofi &> /dev/null; then
    echo "$BINDS" | tofi --prompt-text "Keybindings: "
else
    # Fallback to Kitty floating popup if no menu runner is found
    uwsm app -- kitty --class kitty-drop -e bash -c "echo '$BINDS' | less"
fi
EOF

chmod +x ~/.config/hypr/scripts/keybinds.sh
