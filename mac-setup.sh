#!/usr/bin/env bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
git clone https://github.com/craigbruenderman/mac-setup
brew bundle install --file=~/mac-setup/Brewfile

mv ~/mac-setup/.gitconfig ~/

#mkdir ~/.ansible
#ansible-playbook mac-setup.yml