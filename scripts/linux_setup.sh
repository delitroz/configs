#!/bin/bash


printf "\n\nChecking for updates...\n\n"
sudo apt update
sudo apt upgrade


printf "\n\nInstalling neofetch...\n\n"
sudo apt install neofetch

printf "\n\nInstalling htop...\n\n"
sudo apt install htop

printf "\n\nIntalling git...\n\n"
sudo apt install git

printf "\nLet's generate a ssh key pair to pair this machine with Github...\n\n"
ssh-keygen -t rsa

printf "\n\nInstalling vim...\n\n"
sudo apt install vim
if ! grep -q "set number" ~/.vimrc
then
	echo "set number" >> ~/.vimrc  # Set line numbers by default
fi


# Install vscode (https://code.visualstudio.com/docs/setup/linux)
printf "\n\nInstalling vscode...\n\n"
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https
sudo apt update
sudo apt install code

printf "\nInstalling vscode extensions...\n\n"
code --install-extension ms-vscode-remote.vscode-remote-extensionpack  # Remote Development extension


# Python setup
printf "\n\nSetting up Python..."

# Install mamba virtual environments manager (https://github.com/conda-forge/miniforge)
printf "\n\nInstalling mamba...\n\n"
mamba_script="Miniforge3-$(uname)-$(uname -m).sh"
wget  "https://github.com/conda-forge/miniforge/releases/latest/download/$mamba_script"
bash $mamba_script
rm $mamba_script

# Python-related vscode extensions
printf "\nInstalling python-related vscode extensions...\n\n"
code --install-extension ms-python.python  # Python extension
code --install-extension ms-toolsai.jupyter  # Jupyter notebook extension
code --install-extension njpwerner.autodocstring
