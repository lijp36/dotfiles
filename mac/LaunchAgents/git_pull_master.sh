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
    cd ~/repos/emacs/  &&git fetch
fi

# if [ -d $GOPATH/src/najaplus.com/gamebase/ ]; then
#     cd $GOPATH/src/najaplus.com/gamebase/  &&git fetch && git push ; make get-deps;make
# fi
# if [ -d $GOPATH/src/najaplus.com/zjh/ ]; then
#     cd $GOPATH/src/najaplus.com/zjh/  &&git fetch && git push&&make
# fi
# if [ -d ~/svn/ ]; then
#     cd ~/svn/;svn cleanup ;svn up
# fi
# if [ -d ~/repos/svn/game1git ]; then
#     cd ~/repos/svn/game1git  &&git stash && git svn fetch&&git svn rebase &&git stash pop
# fi
# if [ -d ~/repos/svn/game2git ]; then
#     cd ~/repos/svn/game2git  &&git stash && git svn fetch&&git svn rebase &&git stash pop
# fi
# if [ -d ~/repos/svn/todo ]; then
#     cd ~/repos/svn/todo  &&git stash && git svn fetch&&git svn rebase &&git stash pop
# fi



echo "git_pull_master agent launched at " `date`

