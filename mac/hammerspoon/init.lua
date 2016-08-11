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
-- 当此文件变化时自动reload
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
-- 指定某些app 打开后的大小布局
local laptopScreen = hs.screen.allScreens()[1]:name()
local windowLayout = {
   -- 第4 5 6 个参数都是用来描述窗口大小位置的，这三个参数只能设置其中一个
   -- 区别是第4个 是按百分比排位置如 hs.layout.left50={x=0, y=0, w=0.5, h=1}
   -- 是第5个是按象素指定大小 （此时不考虑menu与dock的）
   -- 是第6个是按象素指定大小 （此时考虑menu与dock的）
   {"Safari",  nil,          laptopScreen, hs.layout.maximized,    nil, nil},
   -- {"Safari",  nil,          laptopScreen, hs.layout.left50,    nil, nil},
   -- {"邮件",    nil,          laptopScreen, hs.layout.right50,   nil, nil},
   {"Emacs",  nil,     laptopScreen, hs.layout.maximized, nil, nil},
   -- {"iTunes",  "MiniPlayer", laptopScreen, nil, nil, hs.geometry.rect(0, -48, 400, 48)},
}
hs.layout.apply(windowLayout)
---------------------------------------------------------------


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
hs.hotkey.bind({"cmd","alt","shift"}, "D", mouseHighlight)
---------------------------------------------------------------

---占左半屏------------------------------------------------------------
function moveWinLeft()
      local win = hs.window.focusedWindow()
      local f = win:frame()
      local screen = win:screen()
      local max = screen:frame()

      f.x = max.x
      f.y = max.y
      f.w = max.w / 2
      f.h = max.h
      win:setFrame(f)     
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
      local f = win:frame()
      local screen = win:screen()
      local max = screen:frame()

      f.x = max.x +max.w/2
      f.y = max.y
      f.w = max.w / 2
      f.h = max.h
      win:setFrame(f)     
end
-- hs.hotkey.bind({"cmd"}, "RIGHT", function()moveWinRight() end)
hs.urlevent.bind("moveWinRight", function(eventName, params) moveWinRight() end)
  
---cmd up 占上半屏------------------------------------------------------------
function moveWinUp()
      local win = hs.window.focusedWindow()
      local f = win:frame()
      local screen = win:screen()
      local max = screen:frame()

      f.x = max.x
      f.y = max.y
      f.w = max.w
      f.h = max.h/2
      win:setFrame(f)     
end
-- hs.hotkey.bind({"cmd"}, "UP", function() moveWinUp() end)
hs.urlevent.bind("moveWinUp", function(eventName, params) moveWinUp() end)

---cmd down 占下半屏------------------------------------------------------------
function moveWinDown()
      local win = hs.window.focusedWindow()
      local f = win:frame()
      local screen = win:screen()
      local max = screen:frame()

      f.x = max.x
      f.y = max.y+max.h/2
      f.w = max.w
      f.h = max.h/2
      win:setFrame(f)     
end
hs.urlevent.bind("moveWinDown", function(eventName, params) moveWinDown() end)
-- hs.hotkey.bind({"cmd"}, "DOWN", function() moveWinDown() end)
