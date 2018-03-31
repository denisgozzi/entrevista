#!/bin/sh

### Instalação dos programas basicos

#ngix installation
apt-get update -yes
apt-get install nginx --yes
ufw app list
ufw allow 'Nginx HTTP'
ufw status

#instalacao software de email
apt-get install mailutils

#install nodejs
cd ~
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get install nodejs --yes
apt-get install build-essential --yes

#install npm to control applications
npm install -g pm2
npm install forever -g
npm install accesslog

#avaliar se precisa ter mesmo este pacote
pm2 startup systemd

##configurar a aplicação nodejs
mkdir /app
cp /tmp/desafio/app/* /app
cp /tmp/desafio/etc/init.d/webapp /etd/init.d/
chmod 744 /etc/init.d/webapp
chmod +X /etc/init.d/webapp
#cria um backup do arquivo rc.local
cp /etc/rc.local /etc/rc.local.bkp

#copia o novo rc.local para inicializar a aplicação
cp /tmp/desafio/etc/rc.local /etc/rc.local

#deixa a aplicação rodando em background
forever start /app/index.js
