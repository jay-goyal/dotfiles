cd ~
sudo pacman -S rustup base-devel --needed
rustup install stable
git clone https://aur.archlinux.org/paru-git.git ~/paru
git clone https://github.com/plexus/chemacs2.git ~/.emacs.d
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.doom-emacs
cd paru
makepkg -si
software="`sed -e 's/#.*$//' -e '/^$/d' ~/dotfiles/arch_scripts/software.txt | tr '\n' ' '`"
ext=(
whizkydee.material-palenight-theme
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
cp -r ~/dotfiles/wallpapers ~/
cp -r ~/dotfiles/.emacs.d ~/
cp ~/dotfiles/.xinitrc ~/
cp ~/dotfiles/.zprofile ~/
cp ~/dotfiles/.zshenv ~/
cp ~/dotfiles/.zshrc ~/
xdg-user-dirs-update
