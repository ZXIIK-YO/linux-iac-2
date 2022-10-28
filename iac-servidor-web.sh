#!/bin/bash

echo "Configurando Needrestart"
cp /etc/needrestart/needrestart.conf /etc/needrestart/needrestart.conf.bkp
sed -i 's/#$nrconf{restart} = \x27i\x27/$nrconf{restart} = \x27a\x27/g' /etc/needrestart/needrestart.conf


echo "Atualizando servidor..."

apt-get update
apt-get upgrade -y
apt-get install apache2 unzip -y

echo "Servidor atualizado!"

echo "Instalando aplicações..."

cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
cd ./linux-site-dio-main
cp -R * /var/www/html/

echo "Aplicações instaladas!"
echo "Script executado com êxito!"
