
listOfScreens=hs.screen.screenPositions()
for screen,position in pairs(listOfScreens) do
--  Iterate through all screens and assign positions
  if position.x==0 and position.y==1
    then hs.hotkey.bind({"ctrl","shift"}, "down", function ()
  focusScreen(screen)
end)
  elseif position.x==-1 and position.y==0
    then hs.hotkey.bind({"ctrl","shift"}, "right", function ()
  focusScreen(screen)
end)
    elseif position.x==-1 and position.y==0
     then hs.hotkey.bind({"ctrl","shift"}, "left", function ()
  focusScreen(screen)
end)
    else 
--    Default to primary screen
    hs.hotkey.bind({"ctrl","shift"}, "up", function ()
  focusScreen(screen)
end)
  end
  end
  
function focusScreen(screen)

--  Get position of cursor relative to current screen
  local pt = hs.mouse.getRelativePosition()
--  Move mouse to corresponding position on the screen
  hs.mouse.setRelativePosition(pt, screen)
  
end
  

