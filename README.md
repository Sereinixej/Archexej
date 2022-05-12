# Archexej
# Installation Guide:
## https://wiki.archlinux.org/title/Installation_guide

# BASICS

loadkeys de-latin1

ls /sys/firmware/efi/efivars

ip link

ping archlinux.org

timedatectl set-ntp true

lsblk

cfdisk /dev/the_disk_to_be_partitioned

mkfs.ext4 /dev/root_partition

mkswap /dev/swap_partition

mkfs.fat -F 32 /dev/efi_system_partition

mount /dev/root_partition /mnt

mount /dev/efi_system_partition /mnt/boot

swapon /dev/swap_partition

# CONFIGURATION

pacstrap /mnt base base-devel linux-lts linux-lts-headers linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

nano /etc/locale.gen

echo LANG=en_US.UTF-8 > /etc/locale.conf export LANG=en_US.UTF-8

ln -sf /usr/share/zoneinfo/Europe/Vienna /etc/localtime

echo KEYMAP=de-latin1 > /etc/vconsole.conf

echo hostname > /etc/hostname

locale-gen

hwclock --systohc

pacman -S networkmanager

systemctl enable networkmanager

nano /etc/pacman.conf

pacman -Sy

mkinitcpio -P

passwd

useradd -m -g users -G wheel,storage,power -s /bin/bash aljos

passwd aljos

pacman -S sudo

EDITOR=nano visudo -> uncomment %wheel ALL=(ALL) ALL

# GRUB

pacman -S grub efibootmgr os-prober

grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB

grub-mkconfig -o /boot/grub/grub.cfg

## Warning: os-prober will not be executed to detect other bootable partition
edit /etc/default/grub GRUB_DISABLE_OS_PROBER=false

exit

umount -a

reboot now

# POST-INSTALLATION

sudo pacman -S xorg-server xorg-xinit xorg-server-utils

sudo pacman -S mesa

sudo pacman -S nvidia lib32-nvidia-utils

sudo pacman -S xf86-input-synaptics

sudo pacman -S ttf-dejavu

sudo pacman -S ufw

sudo pacman -S gnome

sudo systemctl enable gdm.service

sudo systemctl enable ufw.service

sudo pacman -S zsh

chsh -s /usr/bin/zsh

git clone https://aur.archlinux.org/paru-bin.git

cd paru

makepkg -si
