# -*- coding:utf-8 -*-
.PHONY: deployer
PWD := `pwd`
LINK_CMD := ln -s -f

deployer:
# @-$(LINK_CMD) $(PWD)/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
# @-$(LINK_CMD) $(PWD)/LaunchAgents/emacsd_pull_master.plist ~/Library/LaunchAgents/emacsd_pull_master.plist
# @-$(LINK_CMD) $(PWD)/LaunchAgents/git_pull_master.sh ~/Library/LaunchAgents/git_pull_master.sh 
# @-$(LINK_CMD) $(PWD)/LaunchAgents/svn_up.sh ~/Library/LaunchAgents/svn_up.sh
	@-cp $(PWD)/LaunchAgents/emacsd_pull_master.plist ~/Library/LaunchAgents/emacsd_pull_master.plist
	@-cp $(PWD)/LaunchAgents/git_pull_master.sh ~/Library/LaunchAgents/git_pull_master.sh 
	@-cp $(PWD)/LaunchAgents/svn_up.sh ~/Library/LaunchAgents/svn_up.sh
