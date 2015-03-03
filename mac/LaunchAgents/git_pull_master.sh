#!/bin/sh
# cd $@ && git checkout master && git pull
cd ~/.emacs.d/&& git pull origin master:master && git push origin master:master
cd ~/.emacs.d/&& make pull
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

# if [ -d ~/repos/godlike  ] ; then
#     svn cleanup ~/godlike
#     svn up ~/godlike
# fi
if [ -d ~/repos/godlike/dev  ] ; then
    cd ~/repos/godlike/dev && git svn fetch
    cd ~/repos/godlike/dev && git svn rebase
fi
if [ -d ~/repos/godlike/design  ] ; then
    cd ~/repos/godlike/design && git svn fetch
    cd ~/repos/godlike/design && git svn rebase
fi
if [ -d ~/repos/godlike/dev/release_data  ] ; then
    cd ~/repos/godlike/dev/release_data && git svn fetch
    cd ~/repos/godlike/dev/release_data && git svn rebase
fi
if [ -d ~/repos/godlike/dev/sdk  ] ; then
    cd ~/repos/godlike/dev/sdk && git svn fetch
    cd ~/repos/godlike/dev/sdk && git svn rebase
fi

if [ -d ~/repos/godlike/QA  ] ; then
    cd ~/repos/godlike/QA && git svn fetch
    cd ~/repos/godlike/QA && git svn rebase
fi


if [ -d ~/repos/dotfiles/ ]; then
    cd ~/repos/dotfiles/ && git fetch origin 
fi
if [ -d ~/taphero_svn  ] ; then
    cd ~/taphero_svn && svn cleanup
    cd ~/taphero_svn && svn up
fi


echo "git_pull_master agent launched at " `date`

