#!/bin/bash

# Edit locales (language, time zone, etc)
vi /etc/locale.gen
if [[ -N /etc/locale.gen ]]; then
	locale-gen
fi
echo LANG=en_US.UTF-8 >/etc/locale.conf
export LANG=en_US.UTF-8

echo "Please set your date and time in the following manner: "
echo -e "\t ln -s /usr/share/zoneinfo/\"$region\"/\"$city\" /etc/localtime"
