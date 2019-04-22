# Arch Linux Installation... ta-freakin-da.

## Todo: 
### Pt. 1(?)
* Choose mirror
* ``pacstrap``
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
* Finish and user set up grub on their own so they don't fuck anything up

## Link to everything: https://paste.ubuntu.com/23956628/
