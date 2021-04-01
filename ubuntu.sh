#!/bin/bash

installZsh() {
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

	sudo apt-get install -y curl wget build-essential autoconf unzip libssl-dev\
                          libncurses5-dev libreadline-dev zlib1g-dev libsqlite3-dev \
                          inotify-tools pkg-config

	source $HOME/.asdf/asdf.sh;

	asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git;
	asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git;
	zsh ~/.asdf/plugins/nodejs/bin/import-release-team-keyring;
	asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git;
	asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git;
}

installZsh;
setupGit;
setupNano;
installAsdf;
