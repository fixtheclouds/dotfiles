#!/bin/bash

### Setting up development environment

# Z shell
curl -L http://install.ohmyz.sh | sh
chsh -s /bin/zsh

cp .zhrc $HOME
source $HOME/.zshrc

# git
cp .gitconfig $HOME

# nano
cp .nanorc $HOME
curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh
