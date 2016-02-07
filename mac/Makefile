# -*- coding:utf-8 -*-
.PHONY: deployer
PWD := `pwd`
LINK_CMD := ln -s -f

deployer:
# @-$(LINK_CMD) $(PWD)/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
	@-$(LINK_CMD) $(PWD)/../pentadactylrc_mac ~/.pentadactylrc
	@-$(LINK_CMD) $(PWD)/LaunchAgents/git_pull_master.sh ~/Library/LaunchAgents/git_pull_master.sh
	@-$(LINK_CMD) $(PWD)/LaunchAgents/godoc.plist ~/Library/LaunchAgents/godoc.plist
# @-$(LINK_CMD) $(PWD)/LaunchAgents/emacs-daemon.plist ~/Library/LaunchAgents/emacs-daemon.plist
	@-$(LINK_CMD) $(PWD)/LaunchAgents/autosshD.plist ~/Library/LaunchAgents/autosshD.plist
	@-$(LINK_CMD) $(PWD)/LaunchAgents/brew-update.plist ~/Library/LaunchAgents/brew-update.plist
	@-$(LINK_CMD) $(PWD)/Karabiner/private.xml /Users/jixiuf/Library/Application\ Support/Karabiner/private.xml


sudo:
#-$(LINK_CMD) $(PWD)/environment.conf /etc/environment
#	-$(LINK_CMD) $(PWD)/mac-yosemate-set-env.plist /Library/LaunchAgents/mac-yosemate-set-env.plist
