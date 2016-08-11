# -*- coding:utf-8 -*-
.PHONY: deployer
PWD := `pwd`
LINK_CMD := ln -s -f

deployer:
# @-$(LINK_CMD) $(PWD)/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
	@-mkdir -p  ~/Library/LaunchAgents/
	@-mkdir -p /usr/local/etc/
	@-$(LINK_CMD) $(PWD)/../pentadactylrc_mac ~/.pentadactylrc
	@-$(LINK_CMD) $(PWD)/../proxychains.conf /usr/local/etc/
	@-$(LINK_CMD) $(PWD)/../tsocks.conf /usr/local/etc/
	@-$(LINK_CMD) $(PWD)/LaunchAgents/git_pull_master.sh ~/Library/LaunchAgents/git_pull_master.sh
	@-$(LINK_CMD) $(PWD)/LaunchAgents/git_pull_master.plist ~/Library/LaunchAgents/
	@-$(LINK_CMD) $(PWD)/LaunchAgents/godoc.plist ~/Library/LaunchAgents/godoc.plist
# @-$(LINK_CMD) $(PWD)/LaunchAgents/emacs-daemon.plist ~/Library/LaunchAgents/emacs-daemon.plist
	@-$(LINK_CMD) $(PWD)/LaunchAgents/autosshD.plist ~/Library/LaunchAgents/autosshD.plist
	@-$(LINK_CMD) $(PWD)/LaunchAgents/brew-update.plist ~/Library/LaunchAgents/brew-update.plist
	@-$(LINK_CMD) $(PWD)/LaunchAgents/cow.plist ~/Library/LaunchAgents/cow.plist
	@-$(LINK_CMD) $(PWD)/LaunchAgents/memcached.plist ~/Library/LaunchAgents/
	@-mkdir -p  $$HOME/Library/Application\ Support/Karabiner/
	@-$(LINK_CMD) $(PWD)/Karabiner/private.xml $$HOME/Library/Application\ Support/Karabiner/private.xml

	@-rm -rf $$HOME/.hammerspoon
	@-$(LINK_CMD) $(PWD)/hammerspoon $$HOME/.hammerspoon

	@-mkdir -p ~/.cow
	@-$(LINK_CMD) $(PWD)/cowrc ~/.cow/rc
#emacs 中使用term
# 如果你使用的是mac系统，发现multi-term每行出出了4m，在shell里运
# 行下：tic -o ~/.terminfo
# /Applications/Emacs.app/Contents/Resources/etc/e/eterm-color.ti
	@-rm -rf ~/.terminfo
	@-$(LINK_CMD) $(PWD)/terminfo ~/.terminfo

sudo:
#-$(LINK_CMD) $(PWD)/environment.conf /etc/environment
#	-$(LINK_CMD) $(PWD)/mac-yosemate-set-env.plist /Library/LaunchAgents/mac-yosemate-set-env.plist
