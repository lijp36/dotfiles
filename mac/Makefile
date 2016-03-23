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

	@-mkdir -p ~/.cow
	@-$(LINK_CMD) $(PWD)/cowrc ~/.cow/rc

sudo:
#-$(LINK_CMD) $(PWD)/environment.conf /etc/environment
#	-$(LINK_CMD) $(PWD)/mac-yosemate-set-env.plist /Library/LaunchAgents/mac-yosemate-set-env.plist
