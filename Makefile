.PHONY: all emacs-compile elisp-compile deploy

PWD := `pwd`
LINK_CMD := ln --symbolic --force -T
NORMAL_FILES := `echo .gitconfig .pentadactylrc  .gtkrc-2.0  .vimrc  .Xdefaults  .xinitrc  .Xmodmaprc  .zshrc`

deploy:
	@mkdir -p ~/.config/
	@for file in $(NORMAL_FILES); do $(LINK_CMD) $(PWD)/$$file ~/$$file; done
	sudo cp em /bin/
	sudo cp em /bin/
# @$(LINK_CMD) $(PWD)/ipy_user_conf.py ~/.ipython/ipy_user_conf.py
