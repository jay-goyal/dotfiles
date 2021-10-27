cd ~
sudo pacman -S rustup base-devel --needed
rustup install stable
git clone https://aur.archlinux.org/paru-git.git ~/paru
cd ~/paru
makepkg -si
git clone https://github.com/supermindsv1/super-dmenu.git ~/super_dmenu
cd ~/super_dmenu
sudo make install
software="`sed -e 's/#.*$//' -e '/^$/d' ~/dotfiles/arch_scripts/software.txt | tr '\n' ' '`"
paru -S $software --needed
sudo systemctl enable NetworkManager
sudo systemctl enable lightdm
sudo systemctl enable libvirtd
cp -r ~/dotfiles/.config ~/
cp -r ~/dotfiles/wallpapers ~/
cp ~/dotfiles/.xinitrc ~/
cp ~/dotfiles/.zshenv ~/
cp ~/dotfiles/.zshrc ~/
sudo cp ~/dotfiles/jay.jpg /var/lib/AccountsService/icons/jay.jpg
xdg-user-dirs-update
