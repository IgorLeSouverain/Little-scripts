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

fi

#######################

#######  tools  #######

read -p 'Do you want to install tools? [Y/N]: ' answer

if [[ "$answer" == 'y' || "$answer" == 'Y' ]]; then

	sudo "$distribution" install git curl net-tools htop mtr -y

fi

#######################

########  vim  ########

read -p 'Do you want to install vim? [Y/N]: ' answer

if [[ "$answer" == 'y' || "$answer" == 'Y' ]]; then

	sudo "$distribution" install vim -y

fi

mkdir ~/.vim/ ~/.vim/colors

if [[ ! -e ~/.vim/colors/gruvbox.vim ]]; then

	wget https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim -P ~/.vim/colors/ 

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

fi

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i 's/plugins=[^\]/plugins=(zsh-syntax-highlighting /g' "$HOME/.zshrc"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -i 's/plugins=[^\]/plugins=(zsh-autosuggestions /g' "$HOME/.zshrc"

sh -c "$(wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="darkblood"/g' ~/.zshrc

#######################

read -p 'Remove unnecessary packages? [Y/N]: ' answer

if [[ "$answer" == 'y' || "$answer" == 'Y' ]]; then

	sudo "$distribution" autoremove

fi


read -p 'Reboot needed, reboot? [Y/N]: ' answer

if [[ "$answer" == 'y' || "$answer" == 'Y' ]]; then

	reboot

fi
