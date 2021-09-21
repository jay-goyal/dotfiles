cd ~
sudo pacman -S rustup base-devel --needed
rustup install stable
git clone https://aur.archlinux.org/paru-git.git ~/paru
cd paru
makepkg -si
software="`sed -e 's/#.*$//' -e '/^$/d' ~/dotfiles/arch_scripts/software.txt | tr '\n' ' '`"
ext=(
acestojanoski.ace-palenight
esbenp.prettier-vscode
matklad.rust-analyzer
PKief.material-icon-theme
PKief.material-product-icons
ritwickdey.LiveServer
vscodevim.vim
)
paru -S $software --needed
for ex in $ext
do
code --install-extension $ex
done
sudo systemctl enable NetworkManager
cp -r ~/dotfiles/.config ~/
cp -r ~/dotfiles/.xinitrc ~/
cp -r ~/dotfiles/.zprofile ~/
cp -r ~/dotfiles/.zshenv ~/
cp -r ~/dotfiles/.zshrc ~/
cp -r ~/dotfiles/wallpapers ~/
xdg-user-dirs-update