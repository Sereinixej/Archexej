lsblk
cfdisk /dev/the_disk_to_be_partitioned
mkfs.ext4 /dev/root_partition
mkswap /dev/swap_partition
mkfs.fat -F 32 /dev/efi_system_partition
mount /dev/root_partition /mnt
mount /dev/efi_system_partition /mnt/boot
swapon /dev/swap_partition
