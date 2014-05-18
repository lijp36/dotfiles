#!/bin/sh
# cd $@ && git checkout master && git pull
cd ~/.emacs.d/&& git pull origin master:master && git push origin master:master
# if [ -d ~/repos/proj_golang/src/zerogame.info/thserver/ ]; then
#     cd ~/repos/proj_golang/src/zerogame.info/thserver/&& git fetch origin 
# fi
if [ -d ~/repos/proj_golang/src/zerogame.info/thserver/ ]; then
    cd ~/repos/proj_golang/src/zerogame.info/thserver/&& git fetch origin 
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

if [ -d ~/repos/godlike  ] ; then
    svn cleanup ~/repos/godlike
    svn up ~/repos/godlike
fi

if [ -d ~/repos/dotfiles/ ]; then
    cd ~/repos/dotfiles/ && git fetch origin 
fi


echo "git_pull_master agent launched at " `date`

