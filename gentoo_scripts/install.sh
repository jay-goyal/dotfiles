cd ~
software="`sed -e 's/#.*$//' -e '/^$/d' ~/dotfiles/gentoo_scripts/software.txt | tr '\n' ' '`"
doas eselect repository enable guru
doas eselect repository enable dm9pZCAq
doas eselect repository enable steam-overlay
doas eselect repository enable zGentoo
doas emerge --ask --update --newuse --deep --autounmask-write $software @world
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -y
rustup component add rust-analyzer
doas grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GENTOO
doas grub-mkconfig -o /boot/grub/grub.cfg
cd dotfiles
stow alacritty dunst htop hypr kitty nvim scripts starship tmux wallpapers waybar wlogout wofi zathura zsh
doas systemctl enable NetworkManager
doas systemctl enable libvirtd
doas systemctl enable greetd
doas systemctl enable supergfxd
doas systemctl enable bluetooth
xdg-user-dirs-update
