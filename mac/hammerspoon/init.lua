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


-- 当此文件变化时自动reload debug用
function reloadConfig(files)
   doReload = false
   for _,file in pairs(files) do
      if file:sub(-4) == ".lua" then
         doReload = true
      end
   end
   if doReload then
      hs.reload()
   end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("HammerSpoon Config loaded")
--- end........当此文件变化时自动reload
--------------------------------------------------------------------------
-- 手动reload 此文件
hs.hotkey.bind({"cmd", "alt"}, "R", function()
      hs.reload()
      hs.alert.show("HammerSpoon Config loaded")
end)





---------------------------------------------------------------
-- 定位鼠标位置
local mouseCircle = nil
local mouseCircleTimer = nil

function mouseHighlight()
   -- Delete an existing highlight if it exists
   if mouseCircle then
      mouseCircle:delete()
      if mouseCircleTimer then
         mouseCircleTimer:stop()
      end
   end
   -- Get the current co-ordinates of the mouse pointer
   mousepoint = hs.mouse.getAbsolutePosition()
   -- Prepare a big red circle around the mouse pointer
   mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x-40, mousepoint.y-40, 80, 80))
   mouseCircle:setStrokeColor({["red"]=1,["blue"]=0,["green"]=0,["alpha"]=1})
   mouseCircle:setFill(false)
   mouseCircle:setStrokeWidth(5)
   mouseCircle:show()

   -- Set a timer to delete the circle after 3 seconds
   mouseCircleTimer = hs.timer.doAfter(3, function() mouseCircle:delete() end)
end
hs.urlevent.bind("mouse_highlight", function() mouseHighlight() end)
---------------------------------------------------------------

---占左半屏------------------------------------------------------------
function moveWinLeft()
   local win = hs.window.focusedWindow()
   local curFrame = win:frame()
   local screen = win:screen()
   local max = screen:frame()

   curFrame.x = max.x
   curFrame.y = max.y
   curFrame.w = max.w / 2
   curFrame.h = max.h
   win:setFrame(curFrame)
end
-- hs.hotkey.bind({"cmd"}, "LEFT", function()
--       moveWinLeft()
-- end)
-- open -g hammerspoon://moveWinLeft
-- karabiner 绑定Fn+Left 键，因 hammerspoon 不支持Fn的绑定
hs.urlevent.bind("moveWinLeft", function(eventName, params) moveWinLeft() end)

---cmd right 占右半屏------------------------------------------------------------
function moveWinRight()
   local win = hs.window.focusedWindow()
   local curFrame = win:frame()
   local screen = win:screen()
   local max = screen:frame()

   curFrame.x = max.x +max.w/2
   curFrame.y = max.y
   curFrame.w = max.w / 2
   curFrame.h = max.h
   win:setFrame(curFrame)
end
-- hs.hotkey.bind({"cmd"}, "RIGHT", function()moveWinRight() end)
hs.urlevent.bind("moveWinRight", function(eventName, params) moveWinRight() end)

---cmd up 占上半屏------------------------------------------------------------
function moveWinUp()
   local win = hs.window.focusedWindow()
   local curFrame = win:frame()
   local screen = win:screen()
   local max = screen:frame()

   curFrame.x = max.x
   curFrame.y = max.y
   curFrame.w = max.w
   curFrame.h = max.h/2
   win:setFrame(curFrame)
end
-- hs.hotkey.bind({"cmd"}, "UP", function() moveWinUp() end)
hs.urlevent.bind("moveWinUp", function(eventName, params) moveWinUp() end)

---cmd down 占下半屏------------------------------------------------------------
function moveWinDown()
   local win = hs.window.focusedWindow()
   local curFrame = win:frame()
   local screen = win:screen()
   local max = screen:frame()

   curFrame.x = max.x
   curFrame.y = max.y+max.h/2
   curFrame.w = max.w
   curFrame.h = max.h/2
   win:setFrame(curFrame)
end
hs.urlevent.bind("moveWinDown", function(eventName, params) moveWinDown() end)
-- hs.hotkey.bind({"cmd"}, "DOWN", function() moveWinDown() end)

function winIncrease()
   local win = hs.window.focusedWindow()
   if win==nil then
      return
   end
   local curFrame = win:frame()
   local screen = win:screen()
   if screen==nil then
      return
   end
   local max = screen:frame()
   local inscW =120
   if (max.w-curFrame.w)==0 then
      win:setFrame(max)
      return
   end
   local inscH =inscW*(max.h-curFrame.h)/(max.w-curFrame.w)


   if max.w-curFrame.h<inscW and max.h-curFrame.h<inscW then
      win.setFrame(max)
   else
      curFrame.w=curFrame.w +inscW
      local a = (curFrame.x-max.x) -- 左边空白的宽度
      local b =((max.x+max.w)-(curFrame.w+curFrame.x)) -- 右边空白的宽度
      if b<0 then
         curFrame.w=max.w
         curFrame.x=max.x
         -- elseif b-a==0 then
         --    curFrame.x=max.x
      else
         -- a*(inscW-m)=b*m -->a*inscW-a*m=b*m
         if b+a==0 then
            return
         end
         local m =inscW*a/(b+a)                         -- 左边应变化的尺寸
         curFrame.x=curFrame.x-m                          -- 变化后左边的坐标
         if curFrame.x<max.x then
            curFrame.x=max.x
         end
      end

      curFrame.h=curFrame.h +inscH
      local a = (curFrame.y-max.y) -- 左边空白的宽度
      local b =((max.y+max.h)-(curFrame.h+curFrame.y)) -- 右边空白的宽度
      if b<0 then
         curFrame.h=max.h
         curFrame.y=max.y
         -- elseif b-a==0 then
         --    curFrame.y=max.y
      else
         -- a*(inscH-m)=b*m -->a*inscH-a*m=b*m
         if b+a==0 then
            win:setFrame(max)
            return
         end
         local m =inscH*a/(b+a)                         -- 左边应变化的尺寸
         curFrame.y=curFrame.y-m                          -- 变化后左边的坐标
         if curFrame.y<max.y then
            curFrame.y=max.y
         end
      end


      win:setFrame(curFrame)
   end
end
hs.urlevent.bind("winIncrease", function(eventName, params) winIncrease() end)
-- hs.hotkey.bind({"cmd","shift"}, "R", function() winIncrease() end)



---------------------------------------------------------------
function winReduce()
   local win = hs.window.focusedWindow()
   if win==nil then
      return
   end
   local curFrame = win:frame()
   local screen = win:screen()
   if screen==nil then
      return
   end
   local max = screen:frame()
   local inscW =100
   if curFrame.w==0 then
      return
   end
   local inscH =inscW*(curFrame.h)/(curFrame.w)


   -- hs.alert.show(tostring((max.w-curFrame.w)))
   curFrame.w =curFrame.w-inscW
   curFrame.x =curFrame.x+inscW/2


   -- hs.alert.show(tostring((max.h-curFrame.h)))
   curFrame.h =curFrame.h-inscH
   curFrame.y =curFrame.y+inscH/2
   win:setFrame(curFrame)
end
hs.urlevent.bind("winReduce", function(eventName, params) winReduce() end)
-- hs.hotkey.bind({"cmd","shift"}, "R", function() winReduce() end)


---------------------------------------------------------------
-- 指定某些app 打开后的大小布局
local laptopScreen = hs.screen.allScreens()[1]:name()
local windowLayout = {
   -- 第4 5 6 个参数都是用来描述窗口大小位置的，这三个参数只能设置其中一个
   -- 区别是第4个 是按百分比排位置如 hs.layout.left50={x=0, y=0, w=0.5, h=1}
   -- 是第5个是按象素指定大小 （此时不考虑menu与dock的）
   -- 是第6个是按象素指定大小 （此时考虑menu与dock的）
   {"Safari",  nil,          laptopScreen, hs.layout.maximized,   nil , nil},
   -- {"Safari",  nil,          laptopScreen, hs.layout.left50,    nil, nil},
   -- {"邮件",    nil,          laptopScreen, hs.layout.right50,   nil, nil},
   {"Emacs",  nil,     laptopScreen, hs.layout.maximized, nil, nil},
   -- {"Emacs",  nil,     laptopScreen, nil, nil, hs.geometry.rect(100, 100, 800, 480)},
   -- {"iTunes",  "MiniPlayer", laptopScreen, nil, nil, hs.geometry.rect(0, -48, 400, 48)},
}
hs.layout.apply(windowLayout)
---------------------------------------------------------------
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


local toggleMaximizedMap={}
-- hs.geometry.rect(0, -48, 400, 48)
function toggleMaximized()
   local win = hs.window.frontmostWindow()
   if win ==nil then
      return
   end
   local app = win:application()
   if app:title()=="Finder" and win:role()== "AXScrollArea" then -- 如果是桌面
      return
   end
   -- if app:title()=="iTerm2" then
   --    toggleFullScreen()
   --    return
   -- end
   local winKey=app:bundleID() .. tostring(win:id())
   local curFrame = win:frame()
   local originFrame=toggleMaximizedMap[winKey]
   local screen = win:screen()
   local max = screen:frame()
   -- hs.window.setFrameCorrectness=true

   if win:isFullScreen() then
      win:setFullScreen(false)
   end
   if win:isMinimized() then
      win:unminimize()
   end
   win:application():activate(true)
   win:application():unhide()
   win:focus()

   win:maximize(0)           -- 0s duration (无动画马上最大化)
   local maximizedFrame= win:frame() -- 最大化后的尺寸
   if math.abs(maximizedFrame.w-curFrame.w)<80 and math.abs(maximizedFrame.h-curFrame.h)<80 then -- 只要窗口大小跟全屏后的尺寸相差不大就认为是全屏状态
      if  originFrame then
         win:setFrame(originFrame,0) -- 恢复成初始窗口大小
      else                      -- 没有存窗口的初始大小，则随机将其调到一个位置
         win:moveToUnit(hs.geometry.rect(math.random()*0.1,math.random()*0.1, 0.718, 0.718),0)
      end
   else                         -- 当前是非最大化状态，
      if not (maximizedFrame.w-curFrame.w<0 or maximizedFrame.h-curFrame.h<0 )then -- 从fullscreen 恢复回来的则不记录其窗口大小
         toggleMaximizedMap[winKey]=hs.geometry.copy(curFrame) -- 存储当前窗口大小
      end
   end
end
hs.hotkey.bind({"cmd"}, "M", toggleMaximized)
hs.urlevent.bind("toggleMaximized", function(eventName, params)  toggleMaximized() end)

---------------------------------------------------------------
function toggleFullScreen ()
   local win = hs.window.frontmostWindow()
   if win ==nil then
      return
   end
   local app = win:application()
   if app:title()=="Finder" and win:role()== "AXScrollArea" then -- 如果是桌面
      return
   end
   win:application():activate(true)
   win:application():unhide()
   win:focus()
   win:toggleFullScreen()

end
hs.hotkey.bind({"cmd","alt"}, "M", toggleFullScreen)
---------------------------------------------------------------

---------------------------------------------------------------
-- toggle App
function toggleApp(appBundleID)
   -- local win = hs.window.focusedWindow()
   -- local app = win:application()
   local app =hs.application.frontmostApplication()
   if app ~= nil and app:bundleID() == appBundleID    then
      app:hide()
      -- win:sendToBack()
   elseif app==nil then
      hs.application.launchOrFocusByBundleID(appBundleID)
   else
      -- app:activate()
      hs.application.launchOrFocusByBundleID(appBundleID)
      app=hs.application.get(appBundleID)
      if app==nil then
         return
      end
      local wins=app:visibleWindows()
      if #wins>0 then
         for k,win in pairs(wins) do
            if win:isMinimized() then
               win:unminimize()
            end
         end
      else
         hs.application.open(appBundleID)
         app:activate()
      end


      local win=app:mainWindow()
      if win ~= nil then
         win:application():activate(true)
         win:application():unhide()
         win:focus()
      end


   end
end

hs.hotkey.bind({"cmd"}, "f1", function() toggleApp("com.apple.Safari") end )
hs.urlevent.bind("toggleSafari", function(eventName, params)  toggleApp("com.apple.Safari") end)

hs.urlevent.bind("toggleIterm2", function(eventName, params)  toggleApp("com.googlecode.iterm2") end)
-- hs.hotkey.bind({"cmd"}, "f2", function() toggleApp("com.googlecode.iterm2") end)

---------------------------------------------------------------
function toggleEmacs()        --    toggle emacsclient if emacs daemon not started start it
   -- local win = hs.window.focusedWindow()
   -- local topApp = win:application()

   local topApp =hs.application.frontmostApplication()

   -- hs.alert.show("hhh" .. topApp:title())
   if topApp ~= nil and topApp:title() == "Emacs"  and #topApp:visibleWindows()>0 and not topApp:isHidden() then
      topApp:hide()
   else
      local emacsApp=hs.application.get("Emacs")
      if emacsApp==nil then
         -- ~/.emacs.d/bin/ecexec 是对emacsclient 的包装，你可以直接用emacsclient 来代替
         -- 这个脚本会检查emacs --daemon 是否已启动，未启动则启动之
         hs.execute("~/.emacs.d/bin/ecexec --no-wait -c") -- 创建一个窗口
         -- 这里可能需要等待一下，以确保窗口创建成功后再继续，否则可能窗口不前置
         emacsApp=hs.application.get("Emacs")
         if emacsApp ~=nil then
            emacsApp:activate()      -- 将刚创建的窗口前置
         end
         return
      end
      local wins=emacsApp:allWindows() -- 只在当前space 找，
      if #wins==0 then
         wins=hs.window.filter.new(false):setAppFilter("Emacs",{}):getWindows() -- 在所有space找，但是window.filter的bug多，不稳定
      end

      if #wins>0 then
         for _,win in pairs(wins) do

            if win:isMinimized() then
               win:unminimize()
            end

            win:application():activate(true)
            win:application():unhide()
            win:focus()
         end
      else
         -- ~/.emacs.d/bin/ecexec 是对emacsclient 的包装，你可以直接用emacsclient 来代替
         -- 这个脚本会检查emacs --daemon 是否已启动，未启动则启动之
         hs.execute("~/.emacs.d/bin/ecexec --no-wait -c") -- 创建一个窗口
         -- 这里可能需要等待一下，以确保窗口创建成功后再继续，否则可能窗口不前置
         emacsApp=hs.application.get("Emacs")
         if emacsApp ~=nil then
            emacsApp:activate()      -- 将刚创建的窗口前置
         end
      end
   end
end

-- hs.hotkey.bind({"cmd"}, "D", function() toggleEmacs() end )
hs.urlevent.bind("toggleEmacs", function(eventName, params) toggleEmacs() end)
-- open -g "hammerspoon://toggleEmacs"
---------------------------------------------------------------



---------------------------------------------------------------
function toggleFinder()
   local appBundleID="com.apple.finder"
   local topWin = hs.window.focusedWindow()
   if topWin==nil then
      return
   end
   local topApp = topWin:application()
   -- local topApp =hs.application.frontmostApplication()

   -- The desktop belongs to Finder.app: when Finder is the active application, you can focus the desktop by cycling through windows via cmd-`
   -- The desktop window has no id, a role of AXScrollArea and no subrole
   -- and #topApp:visibleWindows()>0
   if topApp ~= nil and topApp:bundleID() == appBundleID   and topWin:role() ~= "AXScrollArea" then
      topApp:hide()
   else
      finderApp=hs.application.get(appBundleID)
      local wins=finderApp:allWindows()
      local isWinExists=true
      if #wins==0  then
         isWinExists=false
      elseif  (wins[1]:role() =="AXScrollArea" and #wins==1 )  then
         isWinExists=false
      end

      -- local wins=app:visibleWindows()
      if not isWinExists then
         wins=hs.window.filter.new(false):setAppFilter("Finder",{}):getWindows()
      end


      if #wins==0 then
         hs.application.launchOrFocusByBundleID(appBundleID)
         for _,win in pairs(wins) do
            if win:isMinimized() then
               win:unminimize()
            end

            win:application():activate(true)
            win:application():unhide()
            win:focus()
         end
      else
         for _,win in pairs(wins) do
            if win:isMinimized() then
               win:unminimize()
            end

            win:application():activate(true)
            win:application():unhide()
            win:focus()
         end
      end
   end
end
hs.hotkey.bind({"cmd"}, "E", function() toggleFinder() end )
-- open -g "hammerspoon://toggleFinder"
hs.urlevent.bind("toggleFinder", function(eventName, params) toggleFinder() end)

---------------------------------------------------------------

-- 焦点转移
-- 当一个app关闭 隐藏时，自动将焦点转移动下个app上，不要停在desk上
local lastLoseFocusAppPid =0
hs.application.watcher.new(function(appName,event,app)
      if event == hs.application.watcher.deactivated or event == hs.application.watcher.hidden  or event == hs.application.watcher.terminated then
         print(tostring(event))
         if app~=nil and lastLoseFocusAppPid== app:pid() then
            return
         end
         lastLoseFocusAppPid=app:pid()
         local topWin=hs.window.frontmostWindow()
         if topWin:application():title()=="Finder" and topWin:role() == "AXScrollArea" then -- 桌面
            -- app:selectMenuItem({"Window", "Bring All to Front"})
            toggleFinder()      -- 打开finder 窗口
            -- hs.alert.show("fff")
            -- hs.eventtap.keyStroke("cmd", "tab")
         else
            local topApp =hs.application.frontmostApplication()
            topWin:application():activate(true)
            topWin:application():unhide()
            if topWin:isMinimized() then
               topWin:unminimize()
            end
            topWin:focus()

            -- local mainWindow=topApp:mainWindow()
            -- hs.alert.show(appName .. tostring(event) .. tostring(app) .. "  " .. tostring(topApp))
         end
      end
end ):start()



---------------------------------------------------------------
-- 有些密码框不许粘贴，用此
-- Type the current clipboard, to get around web forms that don't let you paste
-- (Note: I have Fn-v mapped to F17 in Karabiner)
hs.urlevent.bind("fnv_paste", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)
-- hs.hotkey.bind({"cmd","alt"}, "v", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end )

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
