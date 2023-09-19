cd ~
software="`sed -e 's/#.*$//' -e '/^$/d' ~/dotfiles/gentoo_scripts/software.txt | tr '\n' ' '`"
sudo eselect repository enable guru
sudo eselect repository enable dm9pZCAq
sudo eselect repository enable steam-overlay
sudo eselect repository enable zGentoo
sudo emerge --ask --update --newuse --deep --autounmask-continue $software @world
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -y
rustup component add rust-analyzer
sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GENTOO
sudo grub-mkconfig -o /boot/grub/grub.cfg
cd dotfiles
stow alacritty dunst htop hypr kitty nvim scripts starship tmux wallpapers waybar wlogout wofi zathura zsh
sudo systemctl enable NetworkManager
sudo systemctl enable libvirtd
sudo systemctl enable greetd
sudo systemctl enable supergfxd
sudo systemctl enable bluetooth
xdg-user-dirs-update
