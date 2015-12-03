#!/bin/sh
# cd $@ && git checkout master && git pull
cd ~/.emacs.d/&& git pull origin master:master && git push origin master:master
cd ~/.emacs.d/&& make pull
cd ~/.emacs.d/&& make push
cd ~/.emacs.d/&& make compile
# if [ -d ~/repos/proj_golang/src/zerogame.info/thserver/ ]; then
#     cd ~/repos/proj_golang/src/zerogame.info/thserver/&& git fetch origin 
# fi
if [ -d ~/repos/proj_golang/src/zerogame.info/thserver/ ]; then
    cd ~/repos/proj_golang/src/zerogame.info/thserver/&& git fetch origin 
fi
if [ -d ~/repos/proj_golang/src/zerogame.info/profile/ ]; then
    cd ~/repos/proj_golang/src/zerogame.info/profile/&& git fetch origin 
fi
if [ -d ~/repos/proj_golang/src/zerogame.info/versionmgr/ ]; then
    cd ~/repos/proj_golang/src/zerogame.info/versionmgr/&& git fetch origin 
fi

if [ -d ~/repos/proj_golang/src/zerogame.info/thconf/ ]; then
    cd ~/repos/proj_golang/src/zerogame.info/thconf/&& git fetch origin 
fi
if [ -d ~/repos/proj_golang/src/zerogame.info/thpay/ ]; then
    cd ~/repos/proj_golang/src/zerogame.info/thpay/&& git fetch origin 
fi


if [ -d  ~/repos/proj_golang/src/zerogame.info/thtools/ ]; then
    cd ~/repos/proj_golang/src/zerogame.info/thtools/ && git fetch origin 
fi

if [ -d ~/repos/proj_golang/src/zerogame.info/thbi/ ]; then
    cd ~/repos/proj_golang/src/zerogame.info/thbi/&& git fetch origin 
fi

if [ -d ~/Users/jixiuf/Documents/org/src ]; then
    cd ~/Users/jixiuf/Documents/org/src && git fetch origin 
fi

if [ -d ~/repos/dotfiles/ ]; then
    cd ~/repos/dotfiles/  &&git pull --commit &&git push
fi


echo "git_pull_master agent launched at " `date`

