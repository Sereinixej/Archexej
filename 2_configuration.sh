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
