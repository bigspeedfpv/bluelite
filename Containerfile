FROM quay.io/fedora/fedora-coreos:stable

COPY etc /etc
COPY usr /usr
COPY firstboot-setup /usr/bin

RUN rpm-ostree install fish neovim tailscale zoxide git \
                       kitty clipse hyprland hyprpaper hyprpicker \
		       xdg-desktop-portal-hyprland slurp wl-clipboard \
		       egl-wayland

RUN systemctl enable flatpak-system-update.timer
RUN rm -rf /tmp/* /var/*
RUN ostree container commit
RUN ostree prune --refs-only
