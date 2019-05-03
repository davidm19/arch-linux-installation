# Arch Linux Installation... ta-freakin-da.

## Todo:
### Pt. 1(?)
* Choose mirror
* ``pacstrap /mnt base base-devel``
* Set up fstab (prompt user to ``arch-chroot /mnt`` afterwards)

### Pt. 2(?)
* ``vi /etc/locale.gen`` in order to uncomment language
* ``locale-gen``
* ``echo LANG=en_US.UTF-8 > /etc/locale.conf``
* ``ln -s /usr/share/zoneinfo/REGION/CITY > /etc/localtime`` (prompt user fo region and city)
* ``hwclock --systohc``
* ``vi /etc/pacman.conf`` to set up multilib (uncommenting) --> ``pacman -Syu``
* ``echo "HOSTNAME" > /etc/hostname`` (prompt user for hostname)
* ``systemctl enable dhcpcd@enp0s3.service`` (prompt user if they're on ethernet and oNLY DO THIS IF THEY RESPOND YES (LOOK AT ZSH SETUP IN SITEWEB))
* Set up root password
* Download sudo and bash completion
* Set up user in ``wheel``, ``storage``, and ``power`` groups with shell ``/bin/bash`` (prompt user for username)
* Set up password for user
* ``EDITOR=nano visudo`` so ``wheel`` group can use sudo
* ``mkinitcpio -p linux``
* ``pacman -S grub os-prober``
* Let user set up grub on their own so they don't fuck anything up (and let them know that when they're finished, they need to reboot the system and remove the installation media)

### Pt. 3(?)
* Download ``xorg`` (read arch wiki for exactly what to download)
* Download ``xf86`` video drivers (ask user what their graphics are; if they're on a virtual machine use ``vesa`` drivers)
* Download wm/de (present user a list of possible window managers and DEs corresponding to a numbered bulleted list; if they're on a wm ask if they want a display manager or if they want to use ``xinit``; if they choose a display manager regardless of what wm/de they choose, enable it using ``systemd``)
* Download siteweb and execute the script
* When siteweb is finished, prompt the user to reboot the system

## Link to everything: https://paste.ubuntu.com/23956628/
