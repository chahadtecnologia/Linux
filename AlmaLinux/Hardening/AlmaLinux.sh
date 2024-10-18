#/bin/bash

### System Update
sudo dnf upgrade -y

### Package to automatically update
sudo dnf install dnf-automatic yum-utils -y
sudo systemctl enable --now dnf-automatic.timer && sudo systemctl status dnf-automatic.timer

### Activating reboot after updates
sudo sed -i 's/^apply_updates = no/apply_updates = yes/' /etc/dnf/automatic.conf

### Defining specific hour to reboot
SERVICE_FILE="/etc/systemd/system/scheduled-reboot.service"

# Configuring service to reboot
if [ ! -f "$SERVICE_FILE" ]; then
    sudo bash -c "cat > $SERVICE_FILE" << EOF
[Unit]
Description=Scheduled Reboot

[Service]
Type=oneshot
ExecStart=/usr/sbin/reboot
EOF
    echo "File $SERVICE_FILE was created with success!"
else
    echo "File $SERVICE_FILE exist."
fi

# Changing permissions
sudo chmod 644 $SERVICE_FILE
sudo systemctl daemon-reload

### Creating common user and setting policies on sudo
sudo useradd -m -d /home/chahad -s /bin/bash chahad
echo "chahad:chahad" | sudo chpasswd

### Setting policies and create User_Alias 
sudo sed -i '/^#Cmnd_Alias NETWORKING/s/^#//g' /etc/sudoers
sudo sed -i '/^#Cmnd_Alias SERVICES/s/^#//g' /etc/sudoers
sudo echo -e "\nUser_Alias CYBERSECURITY = chahad\nCYBERSECURITY ALL=(ALL) NETWORKING, SERVICES" | sudo EDITOR='tee -a' visudo
