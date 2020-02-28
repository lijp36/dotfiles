#!/bin/sh
# cd $@ && git checkout master && git pull
cd ~/.emacs.d/&& git pull --commit origin master:master && git push origin master:master
cd ~/.emacs.d/&& make dump
# cd ~/.emacs.d/&& make pull
# cd ~/.emacs.d/&& make push
# cd ~/.emacs.d/&& make compile
if [ -d ~/Documents/org ]; then
    cd ~/Documents/org && git fetch --all
    cd ~/Documents/org && git pull --commit &&git push
fi

if [ -d ~/repos/dotfiles/ ]; then
    cd ~/repos/dotfiles/  &&git pull --commit &&git push
fi
if [ -d ~/repos/emacs/ ]; then
    cd ~/repos/emacs/  &&git pull
fi
if [ -d ~/repos/magit ]; then
    cd ~/repos/magit && git pull
fi
if [ -d ~/repos/libegit2 ]; then
    cd ~/repos/libegit2 && git pull
fi
if [ -d ~/go/src/golang.org/x/tools ]; then
    cd ~/go/src/golang.org/x/tools/gopls; git pull ;GO111MODULE=on go install
fi
brew update
brew upgrade


echo "git_pull_master agent launched at " `date`
