#!/usr/bin/env bash

# Check if the special workspace is currently active on any monitor
IS_OPEN=$(hyprctl monitors -j | grep '"name": "special:scratchpad"')

if [ -n "$IS_OPEN" ]; then
    # Currently open -> toggle it closed
    hyprctl dispatch 'hl.dsp.workspace.toggle_special("scratchpad")'
else
    # Currently closed -> launch if missing
    if ! hyprctl clients -j | grep -q '"class": "kitty-drop"'; then
        uwsm app -- kitty --app-id kitty-drop --class kitty-drop &
        sleep 0.15
    fi
    # Toggle it open
    hyprctl dispatch 'hl.dsp.workspace.toggle_special("scratchpad")'
fi
