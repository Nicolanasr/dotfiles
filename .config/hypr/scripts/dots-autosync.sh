#!/usr/bin/env bash

# 1.Log all output to ~/.cache/dots-autosync.log for easy debugging
LOGFILE="$HOME/.cache/dots-autosync.log"
mkdir -p "$HOME/.cache"
exec >>"$LOGFILE" 2>&1

echo "=== Sync Started: $(date) ==="

# 2.Tell Git where your SSH key is directly (bypasses missing ssh-agent at login)
export GIT_SSH_COMMAND="ssh -i $HOME/.ssh/id_ed25519 -o IdentitiesOnly=yes -o StrictHostKeyChecking=accept-new"

DOTS="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# 3. Wait up to 30s for network connection
CONNECTED=false
for i in $(seq 1 15); do
  if ssh -q -T -o ConnectTimeout=2 git@github.com 2>&1 | grep -q "successfully authenticated"; then
    CONNECTED=true
    break
  fi
  sleep 2
done

if [ "$CONNECTED" = false ]; then
  echo "Network or GitHub unreachable after 30s. Exiting."
  exit 0
fi

# 4. Pull remote changes
$DOTS pull --rebase origin main

# 5. Stage tracked modifications
$DOTS add -u

# 6. Commit and push if there are changes
if ! $DOTS diff-index --quiet --cached HEAD --; then
  TIMESTAMP=$(date '+%Y-%m-%d %H:%M')
  $DOTS commit -m "chore(auto-sync): $TIMESTAMP"
  $DOTS push origin main
  echo "Changes pushed successfully."

  if command -v notify-send &>/dev/null; then
    notify-send -a "Dotfiles" "GitHub Sync" "Configuration backed up successfully." -i git
  fi
else
  echo "Working tree clean, nothing to commit."
fi

echo "=== Sync Finished ==="
