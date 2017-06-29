-- other lua require this
hyper={"cmd"}
hyper2={"cmd","ctrl","alt","shift"}

hs.hotkey.bind(hyper2, "v", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end )
