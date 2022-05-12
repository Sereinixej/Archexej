pacman -S grub efibootmgr os-prober
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
# Warning: os-prober will not be executed to detect other bootable partition
edit /etc/default/grub GRUB_DISABLE_OS_PROBER=false
exit
umount -a
reboot now
