cd ~
sudo pacman -S rustup base-devel --needed
rustup install stable
git clone https://aur.archlinux.org/paru-git.git ~/paru
cd paru
makepkg -si
SOFTWARE="`sed -e 's/#.*$//' -e '/^$/d' ~/dotfiles/arch_scripts/software.txt | tr '\n' ' '`"
paru -S $SOFTWARE --needed
sudo systemctl enable NetworkManager
xdg-user-dirs-update
