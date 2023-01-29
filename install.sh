#!/bin/bash

if [ "$(whoami)" == "root" ]; then
    exit 1
fi

ruta=$(pwd)

# Instalacion del bat

sudo dpkg -i bat_0.22.1_amd64.deb		


#Instalacion del lsd

sudo apt install -y lsd


#Instalacion de la fuente Hack.zip

sudo cp -v $ruta/fonts/* /usr/local/share/fonts/


#Instalacion del zsh

sudo apt install -y zsh

chsh -s $(which zsh)



#Instalacion del Powelevel10k

# Creando carpeta de Reposistorios
cd $ruta
mkdir ~/github

# Descargar Repositorios Necesarios

cd ~/github

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

git clone --depth 1 https://github.com/junegunn/fzf.git  ~/.fzf

sudo ~/.fzf/install 

#Cambiamos los ficheros de zshrc y de powelevel10k

#zshrc

cd $ruta

cp -v .1-zshrc-user ~/.zshrc
sudo cp -v 1-zshrc-root /root/.zshrc

#p10k
cp -v 1-p10k.zsh-user ~/.p10k.zsh
sudo cp -v 1-p10k.zsh-root /root/.p10k.zsh


#Descargamos el plugin  sudo

# Plugins ZSH

sudo apt install -y zsh-syntax-highlighting zsh-autosuggestions
sudo mkdir /usr/share/zsh-sudo
cd /usr/share/zsh-sudo
sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh

#Instalacion de Kitty
sudo apt install -y kitty

cd $ruta

sudo cp -v $ruta/kitty/* ~/.config/kitty

notify-send "Terminal Instalada"


#Eliminacion de carpetas
rm -rf ~/github

