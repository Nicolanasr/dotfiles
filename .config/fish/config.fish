# Starter fish config for a machine that does not already have one.
# Personal aliases belong here; the rice lives in conf.d/nothing.fish.
if status is-interactive
    set fish_greeting
end

fish_add_path -p ~/.local/bin
alias dots='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# 1. Remind you whenever a new Kitty window or tab opens
function fish_greeting
    if test (command git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME status --porcelain 2>/dev/null | wc -l) -gt 0
        set_color brblack
        echo -n "󰊢 dotfiles: "
        set_color yellow
        echo "uncommitted changes pending (run 'dots-sync')"
        set_color normal
    end
end

# 2. One-command sync helper to stage, commit, and push in one go
function dots-sync -d "Stage modified configs, commit, and push to GitHub"
    set -l msg $argv[1]
    if test -z "$msg"
        set msg "chore(sync): "(date '+%Y-%m-%d %H:%M')
    end

    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add -u
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit -m "$msg"
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME push origin main
end
