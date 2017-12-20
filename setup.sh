#!/usr/bin/env bash
#
# set stuff organized and up-to-date.

#
sudo softwareupdate -i -r

# Install Homebrew, the package manager.
if test ! $(which brew)
  echo "Updating Homebrew packages ..."
  brew update
  brew upgrade
then
  echo "Installing Homebrew, the package manager ..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  # Setup Cask, for applications.
  brew tap caskroom/cask
fi

#
#
##
echo "Installing packages from brewfile"

# Downdload and install packages from the Brewfile
brew install $(cat brewfile|grep -v "#")


echo "Installing Applications from caskfile"

# Downdload and install applications from Caskfile.
brew cask install $(cat caskfile|grep -v "#")

# ZSH
#
##

# Get Oh My Zsh zsh configuration framework
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Get Spaceship "Oh My Zsh" theme
curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.zsh | zsh
