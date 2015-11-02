.PHONY: all emacs-compile elisp-compile deploy

PWD := `pwd`
LINK_CMD := ln -s -f
LINK_CMD_HARD := ln -f
NORMAL_FILES := `echo gitconfig gitattributes gitignore pentadactylrc  gtkrc-2.0  vimrc  Xdefaults  xinitrc  Xmodmaprc  zshrc tmux.conf zsh axelrc ctags`
echo:
	@echo "run:"
	@echo "    make deploy"
	@echo "    sudo make sudo"

deploy:
	@mkdir -p ~/.config/
	@for file in $(NORMAL_FILES); do $(LINK_CMD) $(PWD)/$$file ~/.$$file; done
	@mkdir -p ~/.ssh
	-$(LINK_CMD_HARD) $(PWD)/ssh_config ~/.ssh/config
# @$(LINK_CMD) $(PWD)/ipy_user_conf.py ~/.ipython/ipy_user_conf.py

	@if [ `uname -s` = "Darwin" ] ; then \
	  cd mac && $(MAKE) ; \
	fi
sudo:
	@-mv /etc/hosts /tmp/hosts
	-$(LINK_CMD_HARD) $(PWD)/hosts /etc/hosts

	@if [ `uname -s` = "Linux" ] ; then \
	  $(LINK_CMD) $(PWD)/crontab /etc/crontab; \
	fi
	@if [ `uname -s` = "Darwin" ] ; then \
	  cd mac && $(MAKE)  sudo; \
	fi
