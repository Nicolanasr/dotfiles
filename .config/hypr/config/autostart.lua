-- Auto-start config
-- if you dont use UWSM add your auto start programs here, otherwise use XDG autostart https://wiki.archlinux.org/title/XDG_Autostart

hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("noctalia")
	hl.exec_cmd("xhost +SI:localuser:root")
	hl.exec_cmd("uwsm app -- kitty --class kitty-drop")
	hl.exec_cmd("uwsm app -- hypridle")
	hl.exec_cmd("uwsm app -- swaybg -i /home/nicolas/Documents/wallpaper/sheng-l-q2dUSl9S4Xg-unsplash.jpg -m fill")
end)
