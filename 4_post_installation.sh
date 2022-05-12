sudo pacman -S xorg-server xorg-xinit xorg-server-utils
sudo pacman -S mesa
sudo pacman -S nvidia lib32-nvidia-utils
sudo pacman -S xf86-input-synaptics
sudo pacman -S ttf-dejavu
sudo pacman -S ufw
sudo systemctl enable ufw.service
sudo pacman -S zsh
chsh -s /usr/bin/zsh
git clone https://aur.archlinux.org/paru-bin.git
cd paru
makepkg -si
## GNOME
sudo pacman -S gnome 
sudo systemctl enable gdm.service
## KDE
sudo pacman -S plasma
sudo pacman -S gdm
sudo systemctl enable gdm.service
sudo pacman -S kde-applications
