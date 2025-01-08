FROM quay.io/fedora/fedora-silverblue:41

COPY etc /etc
COPY usr /usr
COPY firstboot-setup /usr/bin

RUN rpm-ostree override remove firefox firefox-langpacks
RUN rpm-ostree override remove gnome-control-center-filesystem f41-backgrounds-gnome \
		               gnome-menus gnome-app-list gnome-online-accounts \
			       gnome-desktop3 gnome-desktop4 gnome-settings-daemon \
			       gnome-session gnome-bluetooth-libs gnome-keyring \
			       gnome-bluetooth gnome-software gnome-keyring-pam \
			       gnome-control-center gnome-session-wayland-session \
			       gnome-shell gnome-shell-extension-common \
			       gnome-shell-extension-apps-menu \
			       gnome-shell-extension-launch-new-instance \
			       gnome-shell-extension-places-menu \
			       gnome-shell-extension-window-list \
			       gnome-classic-session gnome-browser-connector \
			       gnome-shell-extension-background-logo \
			       gnome-initial-setup gnome-system-monitor \
			       NetworkManager-ssh-gnome gnome-software-rpm-ostree \
			       NetworkManager-vpnc-gnome NetworkManager-openconnect-gnome \
			       NetworkManager-pptp-gnome gnome-tour gnome-color-manager \
			       gnome-user-share gnome-backgrounds gnome-remote-desktop \
			       fros-gnome pinentry-gnome3 gnome-epub-thumbnailer \
			       desktop-backgrounds-gnome gnome-user-docs \
			       fedora-chromium-config-gnome mutter gdm gvfs-goa \
			       libgdata nautilus xdg-desktop-portal-gnome \
			       evolution-data-server evolution-data-server-langpacks \
			       msgraph

RUN rpm-ostree install fish neovim tailscale zoxide eza git \
                       ghostty clipse hyprland hyprpaper hyprpicker \
		       xdg-desktop-portal-hyprland slurp wl-clipboard \
		       egl-wayland

RUN systemctl enable flatpak-system-update.timer
RUN rm -rf /tmp/* /var/*
RUN ostree container commit
RUN ostree prune --refs-only
