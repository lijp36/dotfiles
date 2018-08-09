-- other lua require this
hyper={"cmd","ctrl","alt","shift"}
hyper2={"cmd","ctrl"}

local function paste_dwim()
   local app =hs.application.frontmostApplication()
   if app ~= nil and app:bundleID() == "com.cisco.Cisco-AnyConnect-Secure-Mobility-Client"    then
      hs.eventtap.keyStrokes("tZRg49y14K")
   else
      hs.eventtap.keyStrokes(hs.pasteboard.getContents())
   end
end

-- hs.hotkey.bind(hyper2, "v", paste_dwim)
hs.urlevent.bind("fnv_paste", paste_dwim)


hs.hotkey.bind(hyper, "f12", function() hs.caffeinate.lockScreen() end)
