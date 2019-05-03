#!/bin/bash

# Edit locales (language, time zone, etc)
vi /etc/locale.gen
if [[ -N /etc/locale.gen ]]; then
	locale-gen
fi
echo LANG=en_US.UTF-8 >/etc/locale.conf
export LANG=en_US.UTF-8

echo "What region do you live in? "
read -r region
echo "What city do you live in? "
read -r city
ln -s /usr/share/zoneinfo/"$region"/"$city" /etc/localtime

hwclock --systohc --utc

# Configure repository to use multilib
vi /etc/pacman.conf
if [[ -N /etc/pacman.conf ]]; then
	pacman -Syu
fi

# Configure hostname
echo "What hostname do you want your computer to have? "
read -r hostname
echo "$hostname" >/etc/hostname

echo "Are you currently using ethernet? (y/n) "
read -r is_on_ethernet
if [[ $is_on_ethernet =~ ^[Yy]$ ]]; then
	systemctl enable dhcpcd@enp0s3.service
else
	echo "It is encouraged that you install Arch Linux using a wired internet connection."
fi

# Set up root passwords and users
pacman -S sudo bash-completion
echo "Enter password for ROOT"
passwd
echo "What will your username be? "
read -r username
useradd -m -g users -G wheel,storage,power -s /bin/bash "$username"
passwd "$username"
EDITOR=nano visudo

# Set up other apps
pacman -S xorg-server xorg-apps xorg-xinit
echo "Which brand GPU are you using? (1 = Intel, 2 = AMD, 3 = NVIDIA): "
read -r graphics_brand
graphics_driver=""
case $graphics_brand in
"1")
	graphics_driver="xf86-video-intel"
	;;
"2")
	graphics_driver="xf86-video-amdgpu"
	;;
"3")
	graphics_driver="xf86-video-nouveau"
	;;
*)
	echo "Not a valid GPU brand."
	;;
esac
pacman -S $graphics_driver

# Execute final installation commands
mkinitcpio -p linux
pacman -S grub os-prober
echo "You must now set up GRUB. Afterwards, please exit the chroot environment, unmount the installation media, and reboot the system. Thank you for choosing Arch Linux as your distribution, we hope you has a pleasant flight."
