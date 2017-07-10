-- other lua require this
hyper={"cmd","ctrl","alt","shift"}
hyper2={"cmd","ctrl","alt"}

hs.hotkey.bind(hyper2, "v", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end )
