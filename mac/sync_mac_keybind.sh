# #!/bin/sh
# # @ cmd
# # ^ ctrl
# # $ shift
# # ~ option
# defaults write com.apple.finder NSUserKeyEquivalents  '{
# "向前" = "^l";
# "向后" = "^h";
# "前往文件夹..." = "^;";
# "移到废纸篓" = "^d";
# "打开" = "^m";
# }'
defaults write -app Safari NSUserKeyEquivalents  '{
"查找..."="^s";
}'
# echo "launched"
# #defaults read com.apple.finder NSUserKeyEquivalents