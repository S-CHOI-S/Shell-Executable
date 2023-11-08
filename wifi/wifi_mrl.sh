#!/bin/bash

clear

nmcli device wifi list

echo ""
echo "/**************************************************************"
echo "* "
echo "*  Mobile Robotics Lab."
echo "*      @ Seoul National University of Science and Technology"
echo "* "
echo -e "*    \e[4mhttps://mrl.seoultech.ac.kr/index.do\e[0m"
echo "* "
echo "**************************************************************/"
echo ""
echo "/* Author: Sol Choi (Jennifer) */"
echo ""

read -p $'\e[33m>> Wi-Fi name to be connected: \e[0m' wifi_name 

if [ -z "$wifi_name" ]; then
	echo -e "\e[31m>> Wi-Fi name is empty!\e[0m"
else
	if [ "$wifi_name" = "iptime_mrl_flight_5G" ] || [ "$wifi_name" = "iptime_mrl_flight" ]; then
		wifi_pw=mrl9706534!
	elif [ "$wifi_name" = "iptime_mrl5G" ] || [ "$wifi_name" = "iptime_mrl" ];then
		wifi_pw=mrl9706534
	else
		read -s -p $'>> Password for [\e[32m'$wifi_name$'\e[0m]: ' wifi_pw
	fi

	echo -e "\n>> Trying to connect [\e[32m$wifi_name\e[0m]..."
	
	nmcli device wifi connect $wifi_name password $wifi_pw
	
	connected_wifi=$(iwgetid -r)
	
	if [ "$wifi_name" = "$connected_wifi" ]; then
		echo -e ">> Successed to connect [\e[32m$wifi_name\e[0m]!"
	else
		echo -e "\e[31m>> Failed to connect [$wifi_name]...\e[0m"
	fi
fi

