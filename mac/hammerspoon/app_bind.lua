
keyUpDown = function(modifiers, key)
  -- Un-comment & reload config to log each keystroke that we're triggering
  -- log.d('Sending keystroke:', hs.inspect(modifiers), key)
  hs.eventtap.keyStroke(modifiers, key, 0)
end

-- Subscribe to the necessary events on the given window filter such that the
-- given hotkey is enabled for windows that match the window filter and disabled
-- for windows that don't match the window filter.
--
-- windowFilter - An hs.window.filter object describing the windows for which
--                the hotkey should be enabled.
-- hotkey       - The hs.hotkey object to enable/disable.
--
-- Returns nothing.
enableHotkeyForWindowsMatchingFilter = function(windowFilter, hotkey)
  windowFilter:subscribe(hs.window.filter.windowFocused, function()
    hotkey:enable()
  end)

  windowFilter:subscribe(hs.window.filter.windowUnfocused, function()
    hotkey:disable()
  end)
end


---------------------------------------------------------------
local safariWindowFilter = hs.window.filter.new('Safari')
enableHotkeyForWindowsMatchingFilter(safariWindowFilter, hs.hotkey.new({"ctrl"},"J", function()hs.eventtap.scrollWheel({0 ,-3}, {}, "line") end)) -- offsets, modifiers, unit
enableHotkeyForWindowsMatchingFilter(safariWindowFilter, hs.hotkey.new({"ctrl"},"K", function() hs.eventtap.scrollWheel({0 ,3}, {}, "line") end))
enableHotkeyForWindowsMatchingFilter(safariWindowFilter, hs.hotkey.new({"ctrl"},"G", function() keyUpDown({}, "Escape") end))
enableHotkeyForWindowsMatchingFilter(safariWindowFilter, hs.hotkey.new({"ctrl"},",", function() keyUpDown({}, "Home") end))
enableHotkeyForWindowsMatchingFilter(safariWindowFilter, hs.hotkey.new({"ctrl"},".", function() keyUpDown({}, "End") end))
enableHotkeyForWindowsMatchingFilter(safariWindowFilter, hs.hotkey.new({"ctrl"},"v", function() keyUpDown({}, "PageDown") end))
enableHotkeyForWindowsMatchingFilter(safariWindowFilter, hs.hotkey.new({"alt"},"v", function() keyUpDown({}, "PageUp") end))
---------------------------------------------------------------


---------------------------------------------------------------
local xcodeWindowFilter = hs.window.filter.new('Xcode')
enableHotkeyForWindowsMatchingFilter(xcodeWindowFilter, hs.hotkey.new({"ctrl"},"Return", function() openExternalEditorInXcode() end))
---------------------------------------------------------------
local finderWindowFilter = hs.window.filter.new('Finder')
enableHotkeyForWindowsMatchingFilter(finderWindowFilter, hs.hotkey.new({"ctrl"},"F", function() keyUpDown({},"Right") end))
enableHotkeyForWindowsMatchingFilter(finderWindowFilter, hs.hotkey.new({"ctrl"},"B", function() keyUpDown({},"Left") end))

enableHotkeyForWindowsMatchingFilter(finderWindowFilter, hs.hotkey.new({"ctrl"},"H", function() keyUpDown({},"Left") end))
enableHotkeyForWindowsMatchingFilter(finderWindowFilter, hs.hotkey.new({"ctrl"},"L", function() keyUpDown({},"Right") end))

enableHotkeyForWindowsMatchingFilter(finderWindowFilter, hs.hotkey.new({"ctrl"},"N", function() keyUpDown({},"Down") end))
enableHotkeyForWindowsMatchingFilter(finderWindowFilter, hs.hotkey.new({"ctrl"},"J", function() keyUpDown({},"Down") end))
enableHotkeyForWindowsMatchingFilter(finderWindowFilter, hs.hotkey.new({"ctrl"},"P", function() keyUpDown({},"Up") end))
enableHotkeyForWindowsMatchingFilter(finderWindowFilter, hs.hotkey.new({"ctrl"},"K", function() keyUpDown({},"Up") end))
enableHotkeyForWindowsMatchingFilter(finderWindowFilter, hs.hotkey.new({},"TAB", function() keyUpDown({"ctrl"},"M") end))
enableHotkeyForWindowsMatchingFilter(finderWindowFilter, hs.hotkey.new({"alt"},"C", function() openItermHereInFinder() end))
enableHotkeyForWindowsMatchingFilter(finderWindowFilter, hs.hotkey.new({"alt"},"O", function() toggleHiddenFile() end))
enableHotkeyForWindowsMatchingFilter(finderWindowFilter, hs.hotkey.new({"ctrl"},"Return", function() openWithEmacsclientInFinder() end)) -- openWithEmacsclientInFinder
enableHotkeyForWindowsMatchingFilter(finderWindowFilter, hs.hotkey.new({"ctrl"},",", function() keyUpDown({"alt"}, "Up") end)) -- goto first  line
enableHotkeyForWindowsMatchingFilter(finderWindowFilter, hs.hotkey.new({"ctrl"},".", function() keyUpDown({"alt"}, "Down") end)) -- goto last line


---------------------------------------------------------------
local mplayerx = hs.window.filter.new('MPlayerX')
enableHotkeyForWindowsMatchingFilter(mplayerx, hs.hotkey.new({},"L", function() keyUpDown({},"Right") end))
enableHotkeyForWindowsMatchingFilter(mplayerx, hs.hotkey.new({},"H", function() keyUpDown({},"Left") end))
enableHotkeyForWindowsMatchingFilter(mplayerx, hs.hotkey.new({},"J", function() keyUpDown({},"Down") end))
enableHotkeyForWindowsMatchingFilter(mplayerx, hs.hotkey.new({},"K", function() keyUpDown({},"Up") end))
enableHotkeyForWindowsMatchingFilter(mplayerx, hs.hotkey.new({},"U", function() keyUpDown({},"]") end))
enableHotkeyForWindowsMatchingFilter(mplayerx, hs.hotkey.new({},"D", function() keyUpDown({},"[") end))
enableHotkeyForWindowsMatchingFilter(mplayerx, hs.hotkey.new({},",", function() keyUpDown({},"-") end))
enableHotkeyForWindowsMatchingFilter(mplayerx, hs.hotkey.new({},".", function() keyUpDown({},"=") end))
enableHotkeyForWindowsMatchingFilter(mplayerx, hs.hotkey.new({},"q", function() keyUpDown({"cmd"},"q") end))
---------------------------------------------------------------

-- local appKeyBindMap={
--    -- Safari={
--    --    -- hs.hotkey.new({"ctrl"}, "H", function() hs.eventtap.keyStroke({ "cmd"}, "[") end), -- go back
--    --    -- hs.hotkey.new({"ctrl"}, "L", function() hs.eventtap.keyStroke({ "cmd"}, "]") end), -- go forward
--    --    -- hs.hotkey.new({"cmd"}, "P", function() hs.eventtap.keyStroke({"cmd", "shift"}, "Left") end), -- pre tab
--    --    -- hs.hotkey.new({"cmd"}, "N", function() hs.eventtap.keyStroke({"cmd", "shift"}, "Right") end), -- next tab
--    --    -- hs.hotkey.new({"ctrl"}, ";", function() hs.eventtap.keyStroke({"cmd"}, "L") end), -- focus address bar
--    --    -- hs.hotkey.new({"ctrl"}, "W", function() hs.eventtap.keyStroke({"cmd"}, "W") end), -- close window
--    --    -- hs.hotkey.new({"ctrl"}, "S", function() hs.eventtap.keyStroke({"cmd"}, "F") end), -- search
--    --    -- hs.hotkey.new({}, "f4", function() hs.eventtap.keyStroke({"cmd" ,"shift"}, "L") end),
--    --    hs.hotkey.new({"ctrl"}, "J", function() hs.eventtap.keyStroke({}, "Down") end), -- scroll down
--    --    hs.hotkey.new({"ctrl"}, "K", function() hs.eventtap.keyStroke({}, "Up") end), -- scroll down
--    --    -- hs.hotkey.new({"ctrl"}, "R", function() hs.eventtap.keyStroke({"cmd"}, "R") end), -- reload
--    --    hs.hotkey.new({"ctrl"}, "G", function() hs.eventtap.keyStroke({}, "Escape") end), -- escape
--    --    -- Disables cmd-w entirely, which is so annoying on safari
--    --    -- hs.hotkey.new({"cmd"}, "w", function()  return end)
--    -- },
--    Xcode={
--       hs.hotkey.new({"ctrl"}, "Return", function()openExternalEditorInXcode()end),

--    },
--    Finder={
--       -- hs.hotkey.new({"ctrl"}, "H", function() hs.eventtap.keyStroke({ "cmd"}, "[") end),
--       -- hs.hotkey.new({"ctrl"}, "L", function() hs.eventtap.keyStroke({ "cmd"}, "]") end),

--       -- this doesnot work
--       -- hs.hotkey.new({"cmd"}, "G", function() hs.eventtap.keyStroke({ "cmd", "shift"}, "G") end),

--       -- hs.hotkey.new({"ctrl"}, ";", function() hs.eventtap.keyStroke({ "cmd", "shift"}, "G") end),
--       -- hs.hotkey.new({"ctrl"}, "D", function() hs.eventtap.keyStroke({ "cmd", }, "Delete") end),
--       -- hs.hotkey.new({"cmd"}, "X", function()
--       --       hs.eventtap.keyStroke( {"cmd"},"C")
--       --       hs.eventtap.keyStroke( {"cmd"},"Delete")
--       -- end),

--       -- disable cmd D
--       -- hs.hotkey.new({"cmd"}, "D", function() return end),
--    }
-- }
-- -- hs.hotkey 是全局性的，不能针对某个app 单独bind,彩一种折衷的办法，某个app激活时绑定特定的键，
-- local appLocalKeyBindWatcher = hs.application.watcher.new(function(name, eventType, app)
--       if eventType ~= hs.application.watcher.activated then return end

--       -- diable all keybind in  appKeyBindMap 避免其他app 中的bind干扰
--       for k, bind in pairs(appKeyBindMap) do
--          for i, keybind in ipairs(bind) do
--             keybind["disable"](keybind)
--          end
--       end

--       local bind=appKeyBindMap[name]
--       if bind==nil then
--          return
--       end

--       for i, keybind in ipairs(bind) do
--          keybind["enable"](keybind)
--       end
--       globalKeyBind()
-- end)
-- appLocalKeyBindWatcher:start()

