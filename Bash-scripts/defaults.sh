#! /bin/bash

clear

if [[ -e "$(ls /etc | grep debian)" ]]; then

	distribution='apt'

else

	distribution='yum'

fi

###  update-upgrade ###

sudo "$distribution" update -y

read -p 'Do you want to upgrade? [Y/N]: ' answer

if [[ "$answer" == 'y' || "$answer" == 'Y' ]]; then

	sudo "$distribution" upgrade -y

else

	:

fi

#######################

#######  tools  #######

read -p 'Do you want to install tools? [Y/N]: ' answer

if [[ "$answer" == 'y' || "$answer" == 'Y' ]]; then

	sudo "$distribution" install git curl net-tools htop mtr -y

else
	:

fi

#######################

########  vim  ########

read -p 'Do you want to install vim? [Y/N]: ' answer

if [[ "$answer" == 'y' || "$answer" == 'Y' ]]; then

	sudo "$distribution" install vim -y

else
	:

fi
mkdir ~/.vim/ ~/.vim/colors

if [[ ! -e ~/.vim/colors/gruvbox.vim ]]; then

	wget https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim -P ~/.vim/colors/ 

else

	:

fi

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

read -p 'Do you want to install zsh? [Y/N]: ' answer

if [[ "$answer" == 'y' || "$answer" == 'Y' ]]; then

	sudo "$distribution" install zsh -y

else

	:

fi

sh -c "$(wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="darkblood"/g' ~/.zshrc

#######################

read -p 'Remove unnecessary packages? [Y/N]: ' answer

if [[ "$answer" == 'y' || "$answer" == 'Y' ]]; then

	sudo "$distribution" autoremove

else

	:

fi


read -p 'Reboot needed, reboot? [Y/N]: ' answer

if [[ "$answer" == 'y' || "$answer" == 'Y' ]]; then

	reboot

else

	:

fi
