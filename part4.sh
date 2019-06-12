# Set up root passwords and users
pacman -S sudo bash-completion
echo "Enter password for ROOT"
passwd
echo "What will your username be? "
read -r username
useradd -m -g users -G wheel,storage,power -s /bin/bash "$username"
passwd "$username"
EDITOR=nano visudo

# Execute final installation commands
mkinitcpio -p linux
pacman -S grub  efibootmgr
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
echo "You're done. Now exit from chroot, unmount the device (umount -R /mnt), reboot, and exit the installation media."
