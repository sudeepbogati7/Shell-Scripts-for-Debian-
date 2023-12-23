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


sudo sed 's/# deb/deb/' -i /etc/apt/sources.list

sudo add-apt-repository ppa:tiheum/equinox
sudo add-apt-repository ppa:am-monkeyd/nautilus-elementary-ppa
sudo apt-get update
sudo apt-get upgrade

# Symlinking home folders.
cd /discworld2/
mkdir Desktop/ Downloads/ Pictures/ Videos/ Public/ Music/ Templates/ Documents/ 
cd
rm -rf Desktop/ Downloads/ Pictures/ Videos/ Public/ Music/ Templates/ Documents/ 
ln -s /discworld2/Desktop/   Desktop
ln -s /discworld2/Documents/ Documents
ln -s /discworld2/Downloads/ Downloads
ln -s /discworld2/Pictures/  Pictures
ln -s /discworld2/Templates/ Templates
ln -s /discworld2/Videos     Videos

# Adding software:
sudo apt-get install -y dconf-tools powertop htop compizconfig-settings-manager deluge vlc smplayer shutter chromium-browser cheese gtk2-engines-equinox faenza-icon-theme equinox-theme

# restart nautilus (req. to activate elementary):
nautilus -q

# remove lock screen

gsettings set org.gnome.desktop.screensaver lock-enabled false

# Altering settings power management (OLD method):

gconftool-2 --set --type string /apps/gnome-power-manager/critical_battery       shutdown 
gconftool-2 --set --type bool   /apps/gnome-power-manager/battery_reduce         false
gconftool-2 --set --type bool   /apps/gnome-power-manager/idle_dim_battery       false
gconftool-2 --set --type string /apps/gnome-power-manager/lid_ac                 blank
gconftool-2 --set --type string /apps/gnome-power-manager/lid_battery            blank
gconftool-2 --set --type string /apps/gnome-power-manager/sleep_computer_ac      0
gconftool-2 --set --type string /apps/gnome-power-manager/sleep_computer_battery 0
gconftool-2 --set --type string /apps/gnome-power-manager/power     
