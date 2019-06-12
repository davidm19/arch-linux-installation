hwclock --systohc --utc

# Configure repository to use multilib
vi /etc/pacman.conf
if [[ -N /etc/pacman.conf ]]; then
	pacman -Sy
fi

# Configure hostname
echo "What hostname do you want your computer to have? "
read -r hostname
echo "$hostname" >/etc/hostname

echo "Please set up your ethernet/internet according to this manner: "
echo -e "\t systemctl enable dhcpcd@<ethernet_device_id>.service"
echo "OR"
echo -e "\t systemctl enable netctl@<wifi_card_id>.service"
echo -e "\n NOTE: netctl may need to be installed in order for this to work. If not, please install it now."
