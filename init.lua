--Register primary screen
primScreen=hs.screen.primaryScreen()
--Register auxillary screen, which is virtually on the top
auxScreen=hs.screen.find({x=0,y=1})
--Bind global shortcuts for easy navigation
hs.hotkey.bind({"ctrl"}, "up", function ()
  focusScreen(primScreen)
end)
hs.hotkey.bind({"ctrl"}, "down", function ()
  focusScreen(auxScreen)
end)


function focusScreen(screen)

--  Get position of cursor relative to current screen
  local pt = hs.mouse.getRelativePosition()
--  Move mouse to corresponding position on the screen
  hs.mouse.setRelativePosition(pt, screen)
  
  
end

