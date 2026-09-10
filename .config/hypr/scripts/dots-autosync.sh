#!/usr/bin/env bash

DOTS="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# 1. Wait up to 30 seconds for Wi-Fi / network connection
for _ in $(seq 1 15); do
  if ping -c 1 -W 2 github.com &>/dev/null; then
    break
  fi
  sleep 2
done

# If still offline after 30s, abort cleanly without throwing errors
if ! ping -c 1 -W 2 github.com &>/dev/null; then
  exit 0
fi

# 2. Pull remote changes in case you edited from another machine or GitHub web
$DOTS pull --rebase origin main &>/dev/null

# 3. Stage updates to already tracked files only (never stages untracked $HOME clutter)
$DOTS add -u

# 4. If there are changes, commit and push silently
if ! $DOTS diff-index --quiet --cached HEAD --; then
  TIMESTAMP=$(date '+%Y-%m-%d %H:%M')
  $DOTS commit -m "chore(auto-sync): $TIMESTAMP"
  $DOTS push origin main

  # 1 Optional: display a quiet desktop notification on completion
  if command -v notify-send &>/dev/null; then
    notify-send -a "Dotfiles" "GitHub Sync" "Configuration backed up successfully." -i git
  fi
fi
