# -*- coding:utf-8 -*-
.PHONY: deployer
PWD := `pwd`
LINK_CMD := ln -s -f

deployer:
# @-$(LINK_CMD) $(PWD)/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
	@-$(LINK_CMD) $(PWD)/LaunchAgents/git_pull_master.plist ~/Library/LaunchAgents/git_pull_master.plist
	@-$(LINK_CMD) $(PWD)/LaunchAgents/git_pull_master.sh ~/Library/LaunchAgents/git_pull_master.sh 
	@-$(LINK_CMD) $(PWD)/LaunchAgents/godoc.plist ~/Library/LaunchAgents/godoc.plist 
sudo:
	-$(LINK_CMD) $(PWD)/launchd.conf /etc/launchd.conf