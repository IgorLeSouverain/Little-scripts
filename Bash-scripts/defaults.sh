#! /bin/bash

clear

###  update-upgrade ###

apt update -y

read -p 'Do you want to upgrade?: ' $answer

if [[ "$answer" == 'y' || "$answer" == 'Y' ]]; then

	sudo apt upgrade -y

fi

#######################

#######  tools  #######

sudo apt install git -y

sudo apt install curl -y

sudo apr install net-tools -y

#######################

########  vim  ########

apt install vim -y

mkdir ~/.vim/
mkdir ~/.vim/colors

wget https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim -P ~/.vim/colors/ 


echo "set number				 
set relativenumber				 
syntax on						 
set tabstop=4					 
set shiftwidth=4				 
set autoindent					 
set mouse=a						 
set background=dark				 
colorscheme gruvbox" > ~/.vimrc  


#######################


########  zsh  ########

sudo apt install zsh -y

sh -c "$(wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="darkblood"/g' ~/.zshrc

#######################

read -p "Reboot needed, reboot? [Y/N]: " answer

if [[ "$answer" == 'y' || "$answer" == 'Y' ]]; then

	reboot

fi
