.PHONY: all emacs-compile elisp-compile deploy

PWD := `pwd`
LINK_CMD := ln -s -f
NORMAL_FILES := `echo gitconfig pentadactylrc  gtkrc-2.0  vimrc  Xdefaults  xinitrc  Xmodmaprc  zshrc gitignore tmux.conf zsh`
echo:
	@echo "run:"
	@echo "    make deploy"
	@echo "    sudo make sudo"

deploy:
	@mkdir -p ~/.config/
	@for file in $(NORMAL_FILES); do $(LINK_CMD) $(PWD)/$$file ~/.$$file; done
# @$(LINK_CMD) $(PWD)/ipy_user_conf.py ~/.ipython/ipy_user_conf.py

	@if [ `uname -s` = "Darwin" ] ; then \
	  cd mac && $(MAKE) ; \
	fi
sudo:
	@-mv /etc/hosts /tmp/hosts
	-$(LINK_CMD) $(PWD)/hosts /etc/hosts

	@if [ `uname -s` = "Linux" ] ; then \
	  $(LINK_CMD) $(PWD)/crontab /etc/crontab; \
	fi
	@cd mac &&make sudo
