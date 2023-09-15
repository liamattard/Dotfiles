#!//bin/bash


echo "Setting up Neovim"

echo "installing Packer"
if [ ! -d "/home/$(whoami)/.local/share/nvim/site/pack/packer" ]
then 
    git clone --depth 1 https://github.com/wbthomason/packer.nvim  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
else
    echo "packer already installed"
fi

if [ ! -d "/home/$(whoami)/.config/nvim" ]
then
    ln -s "$(pwd)"/nvim ~/.config/nvim
else 
    echo "Neovim Configuration already setup"
fi

