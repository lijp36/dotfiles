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



local laptopScreen = hs.screen.allScreens()[1]:name()
-- 指定某些app 打开后的大小布局

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


hs.hotkey.bind({"cmd"}, "W", function()
      local win = hs.window.focusedWindow()
      local f = win:frame()
      local screen = win:screen()
      local max = screen:frame()

      f.x = max.x
      f.y = max.y
      f.w = max.w / 2
      f.h = max.h
      win:setFrame(f)     
      -- local win = hs.window.focusedWindow()
      -- local f   = win:frame()
      -- f.x = f.x + 10
      -- win:setFrame(f)
end)

  