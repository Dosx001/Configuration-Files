#!/bin/bash
timedatectl set-ntp true
efi="n\n\n\n+512M\nt\n1\n"
swap="n\n\n\n+2G\nt\n\n19\n"
root="n\n\n\n\nt\n\n23\n"
echo -e "g\n$efi$swap${root}w\n" | fdisk /dev/sda

mkfs.ext4 /dev/sda3
mkswap /dev/sda2
mkfs.fat -F32 /dev/sda1

mount /dev/sda3 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
swapon /dev/sda2

pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt /bin/bash <<"EOT"
ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
hwclock --systohc

sed -i "s/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/1" /etc/locale.gen
locale-gen

hostname="ArchTest"

echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo $hostname > /etc/hostname

echo "127.0.0.1\tlocalhost\n::1\t\tlocalhost\n127.0.0.1\t$hostname.localdomain $hostname" > /etc/hosts

mkinitcpio -P

passwd
EOT
