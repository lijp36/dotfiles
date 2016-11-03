#!/bin/sh
# 同步 程序快捷键绑定
# 系统偏好设置->键盘->快捷键->应用快捷键设置后的同步
# 
# /Users/jixiuf/Library/Preferences/com.apple.finder.plist
# cmd @
# ctl ^
# shift $
# option ~
# 更多内容见
# http://osxnotes.net/keybindings.html
#
# defaults write -app AppName NSUserKeyEquivalents 'value'
# doesnot work with some applications like Finder or Notes.

# use
# defaults write com.apple.finder NSUserKeyEquivalents ''
# instead

# defaults find NSUserKeyEquivalents
# shows current settings.

defaults write com.apple.finder NSUserKeyEquivalents '{
"向后"="^h";
"向前"="^l";
}'

defaults write -app Safari NSUserKeyEquivalents '{
"返回"="^h";
"前进"="^l";
"显示上一个标签页"="@p";
"显示下一个标签页"="@n";
}'

defaults find NSUserKeyEquivalents