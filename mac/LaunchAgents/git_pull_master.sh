#!/bin/sh
# cd $@ && git checkout master && git pull
cd ~/.emacs.d/&& git pull --commit origin master:master && git push origin master:master
cd ~/.emacs.d/&& make pull
cd ~/.emacs.d/&& make push
cd ~/.emacs.d/&& make compile
# if [ -d ~/repos/proj_golang/src/zerogame.info/thserver/ ]; then
#     cd ~/repos/proj_golang/src/zerogame.info/thserver/&& git fetch origin 
# fi
# if [ -d ~/repos/proj_golang/src/zerogame.info/thserver/ ]; then
#     cd ~/repos/proj_golang/src/zerogame.info/thserver/&& git fetch origin 
# fi
# if [ -d ~/repos/proj_golang/src/zerogame.info/profile/ ]; then
#     cd ~/repos/proj_golang/src/zerogame.info/profile/&& git fetch origin 
# fi
# if [ -d ~/repos/proj_golang/src/zerogame.info/versionmgr/ ]; then
#     cd ~/repos/proj_golang/src/zerogame.info/versionmgr/&& git fetch origin 
# fi

# if [ -d ~/repos/proj_golang/src/zerogame.info/thconf/ ]; then
#     cd ~/repos/proj_golang/src/zerogame.info/thconf/&& git fetch origin 
# fi
# if [ -d ~/repos/proj_golang/src/zerogame.info/thpay/ ]; then
#     cd ~/repos/proj_golang/src/zerogame.info/thpay/&& git fetch origin 
# fi


# if [ -d  ~/repos/proj_golang/src/zerogame.info/thtools/ ]; then
#     cd ~/repos/proj_golang/src/zerogame.info/thtools/ && git fetch origin 
# fi

# if [ -d ~/repos/proj_golang/src/zerogame.info/thbi/ ]; then
#     cd ~/repos/proj_golang/src/zerogame.info/thbi/&& git fetch origin 
# fi

if [ -d ~/Documents/org ]; then
    cd ~/Documents/org && git fetch --all 
    cd ~/Documents/org && git pull --commit &&git push 
fi

if [ -d ~/repos/dotfiles/ ]; then
    cd ~/repos/dotfiles/  &&git pull --commit &&git push
fi

if [ -d $GOPATH/src/najaplus.com/gamebase/ ]; then
    cd $GOPATH/src/najaplus.com/gamebase/  &&git fetch && git push ; make get-deps;make
fi
if [ -d $GOPATH/src/najaplus.com/zjh/ ]; then
    cd $GOPATH/src/najaplus.com/zjh/  &&git fetch && git push&&make
fi
if [ -d ~/svn/ ]; then
    cd ~/svn/;svn cleanup ;svn up
fi
if [ -d ~/repos/svn/game1git ]; then
    cd ~/repos/svn/game1git  &&git stash && git svn fetch&&git svn rebase &&git stash pop
fi
if [ -d ~/repos/svn/todo ]; then
    cd ~/repos/svn/todo  &&git stash && git svn fetch&&git svn rebase &&git stash pop
fi



echo "git_pull_master agent launched at " `date`

