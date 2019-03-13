#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
#git clone https://github.com/craigbruenderman/mac-setup
brew bundle install --file=~/mac-setup/Brewfile

mv ~/mac-setup/.gitconfig ~/
touch ~/Google-Drive/.ssh-config
ln -s ~/Google-Drive/.ssh-config ~/.ssh/config

#mkdir ~/.ansible
ansible-playbook playbooks/main.yml

# Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on