
source install.conf
arch-chroot /mnt

# set timezone
ln -sf /usr/share/zoneinfo/Europe/Vienna /etc/localtime
hwclock --systohc

# set locales
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
localectl --no-ask-password set-keymap de

# hostname
echo $hostname >> /etc/hostname

# initramfs
mkinitcpio -P

# root user
passwd
sudo su

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
