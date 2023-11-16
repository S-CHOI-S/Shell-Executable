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

echo -e "\e[33m[git] Upload [D.A.S.O.M] to [S-CHOI-S]!\e[0m"
echo ""

cd ~/dasom_ws/src

sudo git pull
set -e
sudo git status
sudo git add -A
sudo git status
set -e
today=$(date +"%y%m%d")
echo "$today"
sudo git commit -m "$today"
set -e

sudo git push origin release

sudo git pull
