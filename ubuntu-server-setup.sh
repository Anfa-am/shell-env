#!/bin/bash

# Function to check if the user has sudo privileges
check_sudo() {
    if ! sudo -v >/dev/null 2>&1; then
        echo "This script requires sudo privileges. Please run as a user with sudo access."
        exit 1
    fi
}

# Function to create directories if they don't exist
create_dir_if_not_exists() {
    local dir=$1
    if [ ! -d "$dir" ]; then
        sudo mkdir -p "$dir"
    fi
}

# Check for sudo privileges
check_sudo

# Update and upgrade system packages
sudo apt-get update
sudo apt-get upgrade -y < "/dev/null"

# Install necessary packages
sudo apt-get install git zsh bat neovim neofetch curl wget gnupg htop openvpn figlet -y < "/dev/null"
sudo apt-get install pkg-config libpcre3 libpcre3-dev -y < "/dev/null"
sudo apt-get install nginx certbot -y < "/dev/null"
sudo apt-get install redis-server -y < "/dev/null"
sudo apt-get install postgresql postgresql-contrib -y < "/dev/null"

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all < "/dev/null"

# Add MongoDB GPG key and repository
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

# Update and install MongoDB
sudo apt-get update
sudo apt-get install -y mongodb-org < "/dev/null"

# Install Node.js
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs < "/dev/null"
sudo npm install -g pm2

# Install Haskell Stack
curl -sSL https://get.haskellstack.org/ | sh

# Enable and start services
sudo systemctl enable --now postgresql < "/dev/null"
sudo systemctl enable --now redis-server < "/dev/null"
sudo systemctl enable --now mongod < "/dev/null"
sudo systemctl enable --now nginx < "/dev/null"

# Download and configure .zshrc
wget -O ~/.zshrc https://raw.githubusercontent.com/Anfa-am/shell-env/master/ubuntu-server.zshrc

# Download and install Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# Create Neovim config directory if it doesn't exist
create_dir_if_not_exists "/root/.config/nvim"
wget -O /root/.config/nvim/init.lua https://raw.githubusercontent.com/Anfa-am/shell-env/master/init.lua

# Display SSH public key
if [ -f /root/.ssh/id_rsa.pub ]; then
    cat /root/.ssh/id_rsa.pub
else
    echo "No SSH public key found."
fi

# Display system information and welcome message
neofetch
figlet -f slant "Welcome Mr. Abukar"

# Restart notice
echo "Restarting in 10 seconds brev. Press Ctrl+C to cancel innit."
for i in {5..1}; do
    echo -n "$i "
    sleep 1
done
echo "Bye!"

sudo shutdown -r now
