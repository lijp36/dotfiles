

function globalKeyBind()
   -- hs.hotkey.bind({"cmd","ctrl","alt","shift"}, "q",appKill)
   -- hs.hotkey.bind({"cmd","ctrl","alt","shift"}, "w",function() hs.timer.delayed.new(0.15,function()hs.eventtap.keyStroke({"cmd"},"w") end ):start() end)
   -- hs.hotkey.bind({"cmd","ctrl","alt","shift"}, "a",function() hs.timer.delayed.new(0.15,function()hs.eventtap.keyStroke({"cmd"},"a") end ):start() end)
   -- hs.hotkey.bind({"cmd","ctrl","alt","shift"}, "c",function() hs.timer.delayed.new(0.15,function()hs.eventtap.keyStroke({"cmd"},"c") end ):start() end)
   -- hs.hotkey.bind({"cmd","ctrl","alt","shift"}, "v",function() hs.timer.delayed.new(0.15,function()hs.eventtap.keyStroke({"cmd"},"v") end ):start() end)
   -- 有些密码框不许粘贴，用此解决

   -- hs.hotkey.bind(hyper, "5", function() hs.execute("/Library/Input\\ Methods/Squirrel.app/Contents/MacOS/squirrel_client -t ascii_mode ")end)

   -- hs.hotkey.bind({"cmd","ctrl","alt","shift"}, "pageup", function() moveWinUp() end ) -- fn+up
   -- hs.hotkey.bind({"cmd","ctrl","alt","shift"}, "pagedown", function() moveWinDown() end ) -- fn+down
   -- hs.hotkey.bind({"cmd","ctrl","alt","shift"}, "home", function() moveWinLeft() end )     -- fn+left
   -- hs.hotkey.bind({"cmd","ctrl","alt","shift"}, "end", function() moveWinRight() end )     -- fn+right

   -- hs.hotkey.bind({"cmd","ctrl","alt","shift"}, "k", function() winIncrease() end )     --
   -- hs.hotkey.bind({"cmd","ctrl","alt","shift"}, "j", function() winReduce() end )     --

end
globalKeyBind()

local appKeyBindMap={
   Safari={
      -- hs.hotkey.new({"ctrl"}, "H", function() hs.eventtap.keyStroke({ "cmd"}, "[") end), -- go back
      -- hs.hotkey.new({"ctrl"}, "L", function() hs.eventtap.keyStroke({ "cmd"}, "]") end), -- go forward
      -- hs.hotkey.new({"cmd"}, "P", function() hs.eventtap.keyStroke({"cmd", "shift"}, "Left") end), -- pre tab
      -- hs.hotkey.new({"cmd"}, "N", function() hs.eventtap.keyStroke({"cmd", "shift"}, "Right") end), -- next tab
      -- hs.hotkey.new({"ctrl"}, ";", function() hs.eventtap.keyStroke({"cmd"}, "L") end), -- focus address bar
      -- hs.hotkey.new({"ctrl"}, "W", function() hs.eventtap.keyStroke({"cmd"}, "W") end), -- close window
      -- hs.hotkey.new({"ctrl"}, "S", function() hs.eventtap.keyStroke({"cmd"}, "F") end), -- search
      -- hs.hotkey.new({}, "f4", function() hs.eventtap.keyStroke({"cmd" ,"shift"}, "L") end),
      hs.hotkey.new({"ctrl"}, "J", function() hs.eventtap.keyStroke({}, "Down") end), -- scroll down
      hs.hotkey.new({"ctrl"}, "K", function() hs.eventtap.keyStroke({}, "Up") end), -- scroll down
      -- hs.hotkey.new({"ctrl"}, "R", function() hs.eventtap.keyStroke({"cmd"}, "R") end), -- reload
      hs.hotkey.new({"ctrl"}, "G", function() hs.eventtap.keyStroke({}, "Escape") end), -- escape
      -- Disables cmd-w entirely, which is so annoying on safari
      -- hs.hotkey.new({"cmd"}, "w", function()  return end)
   },
   Xcode={
      hs.hotkey.new({"ctrl"}, "Return", function()openExternalEditorInXcode()end),

   },
   Finder={
      -- hs.hotkey.new({"ctrl"}, "H", function() hs.eventtap.keyStroke({ "cmd"}, "[") end),
      -- hs.hotkey.new({"ctrl"}, "L", function() hs.eventtap.keyStroke({ "cmd"}, "]") end),

      -- this doesnot work
      -- hs.hotkey.new({"cmd"}, "G", function() hs.eventtap.keyStroke({ "cmd", "shift"}, "G") end),

      -- hs.hotkey.new({"ctrl"}, ";", function() hs.eventtap.keyStroke({ "cmd", "shift"}, "G") end),
      -- hs.hotkey.new({"ctrl"}, "D", function() hs.eventtap.keyStroke({ "cmd", }, "Delete") end),
      hs.hotkey.new({"ctrl"}, "N", function() hs.eventtap.keyStroke({}, "Down") end),
      hs.hotkey.new({"ctrl"}, "P", function() hs.eventtap.keyStroke( {},"Up") end),
      -- hs.hotkey.new({"ctrl"}, "M", function() hs.eventtap.keyStroke( {"cmd"},"O") end),
      -- hs.hotkey.new({"ctrl"}, "U", function() hs.eventtap.keyStroke( {"cmd"},"Up") end),
      hs.hotkey.new({}, "TAB", function() hs.eventtap.keyStroke( {"ctrl"},"M") end),
      hs.hotkey.new({"alt"}, "C", function() openItermHereInFinder() end),
      hs.hotkey.new({"alt"}, "O", function() toggleHiddenFile() end),
      hs.hotkey.new({"cmd"}, "Return", function() openWithEmacsclientInFinder() end), -- openWithEmacsclientInFinder()
      -- hs.hotkey.new({"cmd"}, "X", function()
      --       hs.eventtap.keyStroke( {"cmd"},"C")
      --       hs.eventtap.keyStroke( {"cmd"},"Delete")
      -- end),

      -- disable cmd D
      -- hs.hotkey.new({"cmd"}, "D", function() return end),
   }
}
-- hs.hotkey 是全局性的，不能针对某个app 单独bind,彩一种折衷的办法，某个app激活时绑定特定的键，
local appLocalKeyBindWatcher = hs.application.watcher.new(function(name, eventType, app)
      if eventType ~= hs.application.watcher.activated then return end

      -- diable all keybind in  appKeyBindMap 避免其他app 中的bind干扰
      for k, bind in pairs(appKeyBindMap) do
         for i, keybind in ipairs(bind) do
            keybind["disable"](keybind)
         end
      end

      local bind=appKeyBindMap[name]
      if bind==nil then
         return
      end

      for i, keybind in ipairs(bind) do
         keybind["enable"](keybind)
      end
      globalKeyBind()
end)
appLocalKeyBindWatcher:start()

