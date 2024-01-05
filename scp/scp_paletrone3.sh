#!/bin/bash

clear

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

echo -e "\e[33m[ssh] Connect to Paletrone3!\e[0m"

file_path=$(ssh paletrone3@192.168.1.10 "find /home/paletrone3/catkin_ws/src/FAC_MAV_paletrone/FAC_MAV/bag/ -type f -name "*.bag" -printf '%T+ %p\n' | sort | tail -n 1 | awk '{print \$NF}'")

file_name=$(basename "$file_path")

if [ -z "$file_path" ]; then
  echo "Error: No Rosbag file found."
  exit 1
fi

set -e

echo -e "\e[33m[bag] New Rosbag File Name: $file_path\e[0m"

set -e

scp paletrone3@192.168.1.10:$file_path /home/choisol/dasom_ws/src/dasom_bag/bag
