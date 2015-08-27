#!/bin/bash
sudo apt-get install -y curl emacs mysql-client rsync supervisor nano

# Shipyard Docker UI
# docker run --rm -v /var/run/docker.sock:/var/run/docker.sock shipyard/deploy start

sudo su

## idioma
LANGUAGE=es_ES.utf-8
LC_ALL=es_ES.utf-8
echo "LANGUAGE=es_ES.utf-8" >> /etc/environment
echo "LANG=es_ES.utf-8" >> /etc/environment
echo "localectl set-locale LANG=es_ES.utf-8" >> /etc/profile.d/keyboard.sh
echo "gsettings set org.gnome.desktop.input-sources sources \"[('xkb', 'es')]\"" >> /etc/profile.d/keyboard.sh
chmod ugo+x /etc/profile.d/keyboard.sh
update-locale LANG=es_ES.UTF-8 LC_MESSAGES=POSIX LANGUAGE=es_ES.UTF-8
locale-gen

apt-get remove -y language-pack-en language-pack-gnome-en
apt-get install -y language-pack-gnome-es language-pack-gnome-es-base firefox-locale-es gnome-control-center 
apt-get install -y language-pack-es language-pack-es-base language-selector-common language-selector-gnome gksu

### gnome-flashback
apt-get install -y gnome-session-flashback awesome awesome-extra
echo "user-session=gnome-fallback" >> /etc/lightdm/lightdm.conf
killall gnome-session
service lightdm restart

# Change vagrant user password
echo "vagrant:123456" | chpasswd

# Docker Service
echo 'DOCKER_OPTS="-H=tcp://0.0.0.0:4243 ${DOCKER_OPTS}"' >> /etc/default/docker
echo 'DOCKER_OPTS="-H=unix:///var/run/docker.sock ${DOCKER_OPTS}"' >> /etc/default/docker
service docker restart

## Dependencias para rbenv
apt-get install -y libssl-dev zlib1g-dev libreadline-dev

### unity
apt-get install -y unity-tweak-tool

## CHROME
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
apt-get update
apt-get install -y google-chrome-stable
