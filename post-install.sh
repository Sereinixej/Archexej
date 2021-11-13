
arch-chroot /mnt

# set timezone

# set locales

# hostname

# initramfs
mkinitcpio -P

# root pwd
passwd

# install bootloader
# grub

# install additional pacman packages

pacman -S networkmanager plasma sddm konsole steam discord virtualbox libreoffice-fresh --noconfirm

# install yay

cd ~
git clone "https://aur.archlinux.org/yay.git"
cd ${HOME}/yay
makepkg -si --noconfirm

# install aur software

PKGS=(
'awesome-terminal-fonts'
'spotify'
'tlpui'
'visual-studio-code-bin'
'multimc-bin'
'brave-bin' # Brave Browser
'dxvk-bin' # DXVK DirectX to Vulcan
'ttf-droid'
'ttf-hack'
'ttf-meslo' # Nerdfont package
'ttf-roboto'
)

for PKG in "${PKGS[@]}"; do
    yay -S --noconfirm $PKG
done

# enable services

systemctl enable sddm
systemctl enable NetworkManager



echo "post installation finished"
