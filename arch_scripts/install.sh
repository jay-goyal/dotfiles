su jay
cd ~
sudo pacman -S rustup
rustup install stable
git clone https://aur.archlinux.org/paru-git.git ~/paru
cd paru
makepkg -si
SOFTWARE="`sed -e 's/#.*$//' -e '/^$/d' software.txt | tr '\n' ' '`"
paru -S $SOFTWARE
