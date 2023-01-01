cd ~
sudo pacman -S rustup base-devel --needed
rustup install stable
git clone https://aur.archlinux.org/paru-git.git ~/paru
cd ~/paru
makepkg -si
software="`sed -e 's/#.*$//' -e '/^$/d' ~/dotfiles/arch_scripts/software.txt | tr '\n' ' '`"
paru -S $software --needed
sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=ARCH
sudo grub-mkconfig -o /boot/grub/grub.cfg
cp -r ~/dotfiles/.config ~/
cp -r ~/dotfiles/.dwm ~/
cp -r ~/dotfiles/wallpapers ~/
cp ~/dotfiles/.xinitrc ~/
cp ~/dotfiles/.zshenv ~/
cp ~/dotfiles/.zshrc ~/
sudo cp ~/dotfiles/auto-cpufreq.conf /etc/
sudo systemctl enable NetworkManager
sudo systemctl enable sddm
sudo systemctl enable libvirtd
sudo systemctl enable power-profiles-daemon.service
sudo systemctl enable supergfxd
sudo systemctl enable auto-cpufreq
mkdir ~/.emacs.d
cp ~/dotfiles/.emacs.d/emacs.png ~/.emacs.d 
xdg-user-dirs-update
