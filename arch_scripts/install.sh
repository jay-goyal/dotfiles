cd ~
sudo pacman -S rustup base-devel --needed
rustup install stable
git clone https://aur.archlinux.org/paru-git.git ~/paru
cd ~/paru
makepkg -si
software="`sed -e 's/#.*$//' -e '/^$/d' ~/dotfiles/arch_scripts/software.txt | tr '\n' ' '`"
yarn_pkg="`sed -e 's/#.*$//' -e '/^$/d' ~/dotfiles/arch_scripts/npm-pkg.txt | tr '\n' ' '`"
paru -S $software --needed
yarn global add $yarn_pkg
refind-install
git clone https://github.com/jay-goyal/super_dmenu.git ~/super-dmenu
cd ~/super-dmenu
sudo make clean install
git clone https://github.com/jay-goyal/super-dwm.git ~/super-dwm
cd ~/super-dwm
sudo make clean install
cp -r ~/dotfiles/.config ~/
cp -r ~/dotfiles/.dwm ~/
cp -r ~/dotfiles/wallpapers ~/
cp ~/dotfiles/.xinitrc ~/
cp ~/dotfiles/.zshenv ~/
cp ~/dotfiles/.zshrc ~/
sudo cp ~/dotfiles/auto-cpufreq.conf /etc/
sudo systemctl enable NetworkManager
sudo systemctl enable lightdm
sudo systemctl enable libvirtd
sudo systemctl enable power-profiles-daemon.service
sudo systemctl enable supergfxd
sudo systemctl enable auto-cpufreq
mkdir ~/.emacs.d
cp ~/dotfiles/.emacs.d/emacs.png ~/.emacs.d 
xdg-user-dirs-update
