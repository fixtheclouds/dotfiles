#!/bin/bash

installZsh() {
	sudo apt install zsh
  curl -L http://install.ohmyz.sh | sh
  chsh -s /bin/zsh

  cp .zhrc $HOME
  source $HOME/.zshrc
}

setupGit() {
  cp .gitconfig $HOME
}

setupNano() {
  cp .nanorc $HOME
  curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh
}

installAsdf() {
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf;

	echo '. $HOME/.asdf/asdf.sh' >> ~/.zshrc
	source ~/.zshrc

	sudo apt install -y curl wget build-essential autoconf unzip libssl-dev\
                          libncurses5-dev libreadline-dev zlib1g-dev libsqlite3-dev \
                          inotify-tools pkg-config

	source $HOME/.asdf/asdf.sh

	asdf plugin-add ruby
	asdf plugin-add nodejs
	zsh ~/.asdf/plugins/nodejs/bin/import-release-team-keyring;
	asdf plugin-add erlang
	asdf plugin-add elixir
	asdf plugin-add golang
	asdf plugin-add crystal
}

installZsh
setupGit
setupNano
installAsdf
