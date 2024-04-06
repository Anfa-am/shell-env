#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y < "/dev/null"

sudo apt-get install git zsh bat neovim neofetch curl wget gnupg htop openvpn figlet -y  < "/dev/null"
sudo apt-get install pkg-config libpcre3 libpcre3-dev -y  < "/dev/null"
sudo apt-get install nginx certbot -y < "/dev/null"
sudo apt-get install redis-server -y < "/dev/null"
sudo apt-get install postgresql postgresql-contrib -y < "/dev/null"

sudo apt-get install git
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all < "/dev/null"

curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor

echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

sudo apt-get update 
sudo apt-get install -y mongodb-org  < "/dev/null"

curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs < "/dev/null"

sudo npm install -g pm2

curl -sSL https://get.haskellstack.org/ | sh

sudo systemctl start postgresql < "/dev/null"
sudo systemctl enable postgresql < "/dev/null"

sudo systemctl start redis-server < "/dev/null"
sudo systemctl enable redis-server < "/dev/null"

sudo systemctl start mongod < "/dev/null"
sudo systemctl enable mongod < "/dev/null"

sudo systemctl start nginx < "/dev/null"
sudo systemctl enable nginx < "/dev/null"

ssh-keygen -t ed25519 -C "anfa@studio14a.com"

wget -O ~/.zshrc https://raw.githubusercontent.com/Anfa-am/shell-env/master/ubuntu-server.zshrc

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

mkdir /root/.config/nvim
wget -O /root/.config/nvim/init.lua https://raw.githubusercontent.com/Anfa-am/shell-env/master/init.lua

cat /root/.ssh/id_rsa.pub

neofetch
figlet -f slant "Welcome Mr. Abukar"

echo "It's restart ting styll in 10 seconds brev. Press Ctrl+C to cancel innit."

for i in {5..1}; do
    echo -n "$i "
    sleep 1
done

echo "BOOM!"
echo "You dun know"

sudo shutdown -r now
