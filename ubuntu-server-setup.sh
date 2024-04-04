#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install git zsh bat neovim neofetch curl wget gnupg figlet -y
sudo apt-get install nginx certbot -y
sudo apt-get install nodejs npm -y
sudo apt-get install redis-server -y
sudo apt-get install postgresql postgresql-contrib -y

sudo apt-get install git
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor

echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

sudo apt-get install -y mongodb-org

curl -sL https://raw.githubusercontent.com/Unitech/pm2/master/packager/setup.deb.sh | sudo -E bash -

sudo systemctl start postgresql
sudo systemctl enable postgresql

sudo systemctl start redis-server
sudo systemctl enable redis-server

sudo systemctl start mongod
sudo systemctl enable mongod

sudo systemctl start nginx
sudo systemctl enable nginx

wget -O ~/.zshrc https://raw.githubusercontent.com/Anfa-am/shell-env/master/.zshrc

neofetch
figlet -f slant "Welcome Mr. Abukar"

echo "It's restart ting styll in 10 seconds brev. Press Ctrl+C to cancel innit."

for i in {10..1}; do
    echo -n "$i "
    sleep 1
done

echo "BOOM!"
echo "You dun know"

sudo shutdown -r now
