#!/bin/bash
hostname=dosx
read -p 'Password: ' -r pass
if [[ -z $pass ]]; then
  pass="pass"
fi
timedatectl set-ntp true

swap=$(free --giga | grep Mem | awk '{print $2}')
if [[ $swap -le 2 ]]; then
	swap="+$((swap * 3))G"
elif [[ $swap -le 8 ]]; then
	swap="+$(swap)G"
elif [[ $swap -ge 16 ]]; then
	swap=+512M
else
	swap="+$((swap * 1 / 2))G"
fi

if [[ -d /sys/firmware/efi ]]; then
	efi="n\n\n\n+512M\nt\n1\n"
	swap="n\n\n\n${swap}\nt\n\n19\n"
	root="n\n\n\n\nt\n\n23\n"
	echo -e "g\n$efi$swap${root}w\n" | fdisk /dev/sda

	mkfs.ext4 /dev/sda3
	mount /dev/sda3 /mnt
	mkswap /dev/sda2
	swapon /dev/sda2
	mkfs.fat -F32 /dev/sda1
	mkdir /mnt/efi
	mount /dev/sda1 /mnt/efi
else
	swap="n\n\n\n\n${swap}\nt\n82\n"
	root="n\n\n\n\n\n"
	echo -e "$swap${root}w\n" | fdisk /dev/sda

	mkfs.ext4 /dev/sda2
	mount /dev/sda2 /mnt
	mkswap /dev/sda1
	swapon /dev/sda1
fi

if grep -q -m 1 hypervisor < /proc/cpuinfo; then
	mirco=''
elif grep -q -m 1 AMD < /proc/cpuinfo; then
	mirco=amd-ucode
else
	mirco=intel-ucode
fi

packages=(
	linux
	linux-firmware
	base-devel
	grub
	xorg-server
	xorg-xinit
	networkmanager
	"$mirco"
	i3-gaps
	i3status-rust
	i3lock
)

pacstrap /mnt "${packages[@]}"
genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt /bin/bash <<EOT
ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
hwclock --systohc

sed -i "s/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/" /etc/locale.gen
locale-gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo $hostname > /etc/hostname

echo "127.0.0.1	localhost
::1		localhost
127.0.0.1	$hostname.localdomain $hostname" > /etc/hosts
systemctl enable NetworkManager

mkinitcpio -P
if [[ $(fdisk -l | grep efi) ]]; then
  pacman -S efibootmgr
  grub-install --target=x86_64-efi --efi-directory=efi --bootloader-id=GRUB
else
  grub-install --target=i386-pc /dev/sda
fi
grub-mkconfig -o /boot/grub/grub.cfg

EOT
(
	echo $pass
	echo $pass
) | passwd
