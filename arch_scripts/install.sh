cd ~
sudo pacman -S rustup base-devel --needed
rustup install stable
git clone https://aur.archlinux.org/paru-git.git ~/paru
cd ~/paru
makepkg -si
git clone https://github.com/jay-goyal/super-dmenu.git ~/super-dmenu
cd ~/super-dmenu
sudo make clean install
git clone https://github.com/jay-goyal/super-dwm.git ~/super-dwm
cd ~/super-dwm
sudo make clean install
software="`sed -e 's/#.*$//' -e '/^$/d' ~/dotfiles/arch_scripts/software.txt | tr '\n' ' '`"
paru -S $software --needed
sudo systemctl enable NetworkManager
sudo systemctl enable lightdm
sudo systemctl enable libvirtd
cp -r ~/dotfiles/.config ~/
cp -r ~/dotfiles/.dwm ~/
cp -r ~/dotfiles/wallpapers ~/
cp ~/dotfiles/.xinitrc ~/
cp ~/dotfiles/.zshenv ~/
cp ~/dotfiles/.zshrc ~/
sudo cp ~/dotfiles/jay.jpg /var/lib/AccountsService/icons/jay.jpg
xdg-user-dirs-update
