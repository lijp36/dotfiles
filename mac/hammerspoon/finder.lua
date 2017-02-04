function openItermHereInFinder()
   scpt=[[tell application "Finder"
    try
        set frontWin to folder of front window as string
        set frontWinPath to (get POSIX path of frontWin)
        tell application "iTerm"
                activate
            if (count of windows) = 0 then
                set t to (create window with default profile)
            else
                set t to current window
            end if

            tell t
                tell (create tab with default profile)
                    tell the last session
                        set cmd to "cd " & quote & frontWinPath & quote & ";clear"
                        -- do script with command cmd
                        write text cmd
                        -- exec command (cmd)
                    end tell
                end tell
            end tell
        end tell
    on error error_message
        beep
        display dialog error_message buttons ¬
            {"OK"} default button 1
    end try
end tell
]]
   hs.osascript.applescript(scpt)
end
function toggleHiddenFile()
   local finderStatus,_,_,_=hs.execute("defaults read com.apple.finder AppleShowAllFiles")
   if finderStatus=="TRUE" then
      hs.execute("defaults write com.apple.finder AppleShowAllFiles FALSE")
   else
      hs.execute("defaults write com.apple.finder AppleShowAllFiles TRUE")
   end
   local script=[[tell application "Finder"
                 quit
                 delay 0.1 -- without this there was a \"connection is invalid\" error
                 launch -- without this Finder was not made frontmost
                 activate -- make Finder frontmost
                 reopen -- open a default window
                 end tell]]
   hs.osascript.applescript(script)
end
function openWithEmacsclientInFinder()
   local script=[[
tell application "Finder"
    try
        -- set frontWin to folder of front window as string
        -- set frontWinPath to (get POSIX path of frontWin)
        set theItems to selection
        repeat with itemRef in theItems
        --set myitem to POSIX path of (itemRef as string)
        set myitem to quoted form of  POSIX path of (itemRef as string)
        tell application "iTerm"
        do shell script "~/.emacs.d/bin/ec --no-wait "  & myitem
        end tell

        end repeat -- it will store the last filename in selection
    on error error_message
        beep
        display dialog error_message buttons ¬
            {"OK"} default button 1
    end try
end tell
]]
   hs.osascript.applescript(script)
end
function openWithEmacsclientInItermFromFinder()
   local script=[[
tell application "Finder"
    try
        -- set frontWin to folder of front window as string
        -- set frontWinPath to (get POSIX path of frontWin)
        set theItems to selection
        set cmd to "em "
        repeat with n from 1 to count of theItems
        --set myitem to POSIX path of (item n of theItems as string)
        set myitem to quoted form of  POSIX path of (item n of theItems as string)
        set cmd to cmd & myitem  & " "
        end repeat -- it will store the last filename in selection
        set cmd to cmd &  " && exit " -- after emacsclient ,call exist for close iterm tab
        tell application "iTerm"
            activate
            if (count of windows) = 0 then
                set w to (create window with default profile)
            else
                set w to current window
            end if

            tell w
                create tab with default profile
                tell current session of w
                    -- set cmd to "~/.emacs.d/bin/em " & quote & myitem & quote
                    write text (cmd)
                end tell

            end tell
        end tell

    on error error_message
        beep
        display dialog error_message buttons ¬
            {"OK"} default button 1
    end try
end tell

]]
   hs.osascript.applescript(script)
end


---------------------------------------------------------------
function openExternalEditorInXcode()
   local menuName = {"File", "Open with External Editor"}
   local topApp =hs.application.frontmostApplication()
   if topApp==nil or topApp:title()~="Xcode" then
      return
   end
   topApp:selectMenuItem(menuName)
end

hs.urlevent.bind("open_with_external_editor_in_xcode", function() openExternalEditorInXcode() end)
---------------------------------------------------------------
