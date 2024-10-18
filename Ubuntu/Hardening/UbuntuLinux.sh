#/bin/bash

### System Update
sudo apt update -y
sudo apt dist-upgrade -y

### Removing old packages
sudo apt auto-remove -y

### Configuration of auto reboot after updates (specific time)
sudo sed -i 's#//Unattended-Upgrade::Automatic-Reboot "false"#Unattended-Upgrade::Automatic-Reboot "true"#' /etc/apt/apt.conf.d/50unattended-upgrades
sudo sed -i 's#//Unattended-Upgrade::Automatic-Reboot-Time "02:00"#Unattended-Upgrade::Automatic-Reboot-Time "02:00"#' /etc/apt/apt.conf.d/50unattended-upgrades

### Creating common user and setting policies on sudo
sudo useradd -m -d /home/chahad -s /bin/bash chahad
echo "chahad:chahad" | sudo chpasswd

### Setting policies and create User_Alias
sudo sed -i '$ a Cmnd_Alias NETWORKING = /sbin/route, /sbin/ifconfig, /bin/ping, /sbin/dhclient, /usr/bin/net, /sbin/iptables, /usr/bin/rfcomm, /usr/bin/wvdial, /sbin/iwconfig, /sbin/mii-tool\nCmnd_Alias SERVICES = /sbin/service, /sbin/chkconfig, /usr/bin/systemctl start, /usr/bin/systemctl stop, /usr/bin/systemctl reload, /usr/bin/systemctl restart, /usr/bin/systemctl status, /usr/bin/systemctl enable, /usr/bin/systemctl disable\nUser_Alias CYBERSECURITY = chahad\nCYBERSECURITY ALL=(ALL) NETWORKING, SERVICES' /etc/sudoers

