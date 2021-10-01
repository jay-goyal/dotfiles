cd ~
sudo pacman -S rustup base-devel --needed
rustup install stable
git clone https://aur.archlinux.org/paru-git.git ~/paru
cd paru
makepkg -si
software="`sed -e 's/#.*$//' -e '/^$/d' ~/dotfiles/arch_scripts/software.txt | tr '\n' ' '`"
paru -S $software --needed
sudo systemctl enable NetworkManager
sudo systemctl enable lightdm
cp -r ~/dotfiles/.config ~/
cp -r ~/dotfiles/wallpapers ~/
cp -r ~/dotfiles/.emacs.d ~/
cp ~/dotfiles/.xinitrc ~/
cp ~/dotfiles/.zshenv ~/
cp ~/dotfiles/.zshrc ~/
xdg-user-dirs-update
