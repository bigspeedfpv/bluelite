if [[ "$(id -u)" -gt "0" ]] && [[ -d "$HOME" ]]; then
		if [[ ! -e "$HOME"/.config/system/firstboot-done ]]; then
				mkdir -p "$HOME"/.config/autostart
				cp -f /etc/skel/.config/autostart/firstboot-setup.desktop "$HOME"/.config/autostart
		fi
fi
