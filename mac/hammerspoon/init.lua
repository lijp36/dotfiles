-- http://www.hammerspoon.org/go/#winresize
-- hammerspoon 不能实现的区分左右cmd shift等，也不能实别Fn键，
-- 这些可以与karabiner 通过Hammerspoon with URLs实现通信,即，
-- 通过karabiner 来按键，而 hammerspoon来实现相应的事件
-- 如
-- 在命令行下调用open -g "hammerspoon://someAlert?someParam=hello"
-- hs.urlevent.bind("someAlert", function(eventName, params)
--                     if params["someParam"] then
--                        hs.alert.show(params["someParam"])
--                     end
-- end)

-- hs.hotkey的一个缺点是 当焦点在桌面上（即menu里显示当前激活的是finder ，但其实finder的窗口并不在最前方时，hotkey按下时回调函数没回调成功）
-- 但是 karabiner可以检测到这样的按键，故建议用karabiner来回调

math.randomseed(os.time())

require('hyper')
require('windows')
require('windows_toggle_max')
require('emacs')
require('toggle_app')
require('cmd')
-- require('app_bind') -- this is not need after karabiner-element support
require('windows_layout')
-- require('app_watcher')


-- 当此文件变化时自动reload debug用
function reloadConfig(files)
   doReload = false
   for _,file in pairs(files) do
      -- if file == "init.lua" then
      --    doReload = true
      -- end

      if file:sub(-4) == ".lua" then
         doReload = true
      end
   end
   if doReload then
      -- hs.alert.show("HammerSpoon Config loaded")
      hs.reload()
   end
end

hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("HammerSpoon Config loaded")
--- end........当此文件变化时自动reload
--------------------------------------------------------------------------
-- 手动reload 此文件
-- hs.hotkey.bind(hyper, "R", function()
hs.hotkey.bind(hyper2, "r", function()
      hs.reload()
end)
-- 每3秒reload 一次
-- hs.timer.doAfter(10, function() hs.reload() end) --

---------------------------------------------------------------
-- wifi 连接或断开时的处理
hs.wifi.watcher.new(function()
      -- hs.wifi.currentNetwork()返回的是wifi的名字，可以用于区分连的是哪个wifi
      if  hs.wifi.currentNetwork()==nil then
         -- 断开
      else
         -- 连接
         hs.execute("pkill autossh") -- 关闭autossh ,以便其重新连接
      end
end ):start()

---------------------------------------------------------------
hs.application.enableSpotlightForNameSearches(true)

---------------------------------------------------------------
-- 有些密码框不许粘贴，用此
-- Type the current clipboard, to get around web forms that don't let you paste
-- (Note: I have Fn-v mapped to F17 in Karabiner)
-- hs.urlevent.bind("fnv_paste", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)
-- hs.hotkey.bind({"cmd","alt"}, "v", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end )

-- hs.hotkey.bind({"cmd","ctrl"}, "v", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end )


-- ---------------------------------------------------------------
-- -- 定位鼠标位置
-- local mouseCircle = nil
-- local mouseCircleTimer = nil

-- function mouseHighlight()
--    -- Delete an existing highlight if it exists
--    if mouseCircle then
--       mouseCircle:delete()
--       if mouseCircleTimer then
--          mouseCircleTimer:stop()
--       end
--    end
--    -- Get the current co-ordinates of the mouse pointer
--    mousepoint = hs.mouse.getAbsolutePosition()
--    -- Prepare a big red circle around the mouse pointer
--    mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x-40, mousepoint.y-40, 80, 80))
--    mouseCircle:setStrokeColor({["red"]=1,["blue"]=0,["green"]=0,["alpha"]=1})
--    mouseCircle:setFill(false)
--    mouseCircle:setStrokeWidth(5)
--    mouseCircle:show()

--    -- Set a timer to delete the circle after 3 seconds
--    mouseCircleTimer = hs.timer.doAfter(3, function() mouseCircle:delete() end)
-- end
-- hs.urlevent.bind("mouse_highlight", function() mouseHighlight() end)
-- ---------------------------------------------------------------
-- require('super')

-- -- 如果 windowLayout里有配相应app的初始大小，则将对应win设置成此大小
-- function moveToInitPos (win,appName)
--    for k,v in pairs(windowLayout) do
--       if v[1]==appName then
--          hs.alert.show(appName)
--          if v[4] ~= nil then
--             win:moveToUnit(v[4])
--          elseif v[5] ~= nil then
--             win:setFrame(v[5])
--          elseif v[6] ~= nil then
--             win:setFrame(v[6])
--          end
--          return true
--       end
--    end
--    return false
-- end


-- -- -- 焦点转移
-- -- -- 当一个app关闭 隐藏时，自动将焦点转移动下个app上，不要停在desk上
-- local lastLoseFocusAppPid =0
-- hs.application.watcher.new(function(appName,event,app)
--       -- if  event == hs.application.watcher.terminated then
--       -- event == hs.application.watcher.deactivated or
--          -- hs.alert.show(appName  .. tostring(event))
--       if  event == hs.application.watcher.hidden  or event == hs.application.watcher.terminated then
--          if app~=nil and lastLoseFocusAppPid== app:pid() then
--             return
--          end
--          lastLoseFocusAppPid=app:pid()
--          local topWin=hs.window.frontmostWindow()
--          if topWin:application():title()=="Finder" and topWin:role() == "AXScrollArea" then -- 桌面
--             -- app:selectMenuItem({"Window", "Bring All to Front"})
--             toggleFinder()      -- 打开finder 窗口
--             -- hs.eventtap.keyStroke("cmd", "tab")
--          else
--             local topApp =hs.application.frontmostApplication()
--             topWin:application():activate(true)
--             topWin:application():unhide()
--             if topWin:isMinimized() then
--                topWin:unminimize()
--             end
--             topWin:focus()

--             -- local mainWindow=topApp:mainWindow()
--             -- hs.alert.show(appName .. tostring(event) .. tostring(app) .. "  " .. tostring(topApp))
--          end
--       end
-- end ):start()



---------------------------------------------------------------
-- key rebind for some app
--
-- local safariKeybinds ={
--    hs.hotkey.new({"ctrl"}, "H", function() hs.eventtap.keyStroke({ "cmd"}, "[") end),
--    hs.hotkey.new({"ctrl"}, "L", function() hs.eventtap.keyStroke({ "cmd"}, "]") end),
--    hs.hotkey.new({"cmd"}, "P", function() hs.eventtap.keyStroke({"cmd", "shift"}, "Left") end),
--    hs.hotkey.new({"cmd"}, "N", function() hs.eventtap.keyStroke({"cmd", "shift"}, "Right") end),
--    hs.hotkey.new({"ctrl"}, ";", function() hs.eventtap.keyStroke({"cmd"}, "L") end),
--    hs.hotkey.new({"ctrl"}, "W", function() hs.eventtap.keyStroke({"cmd"}, "W") end),
--    -- Disables cmd-w entirely, which is so annoying on safari
--    -- hs.hotkey.new({"cmd"}, "w", function()  return end)
-- }
-- local appLocalKeyBindWatcher = hs.application.watcher.new(function(name, eventType, app)
--       if eventType ~= hs.application.watcher.activated then return end
--       local fnName = name == "Safari" and "enable" or "disable"
--       for i, keybind in ipairs(safariKeybinds) do
--          keybind[fnName](keybind)
--       end
-- end)
-- appLocalKeyBindWatcher:start()

-- function appKill()
--    -- kill app
--    local app=hs.application.frontmostApplication()
--    if app==nil then
--       return
--    end
--    app:kill()
-- end

