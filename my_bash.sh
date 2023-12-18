#! /usr/bin/bash
echo "__________________________________________________________"
echo " "
echo "WELCOME, $(whoami)"
echo " "
echo "----------------------------------------------- Updating your system -------------------------------------------------------------------"
echo " "

sudo apt-get update -y
sudo apt upgrade -y

echo "______________________________________________Installing Thorium Browser _______________________________________________________________________"
wget https://dl.thorium.rocks/debian/dists/stable/thorium.list -y
sudo mv thorium.list /etc/apt/sources.list.d/
sudo apt update -y
sudo apt install thorium-browser -y

echo ""
echo "----------------------------------------------- Installing VS CODE -----------------------------------------------------------"
echo ""

sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code


