display.setStatusBar(display.HiddenStatusBar)

display.setDefault("anchorX", 0)
display.setDefault("anchorY", 0)

local physics = require "physics"
physics.start()

local __appContentWidth__ = display.actualContentWidth
local __appContentHeight__ = display.actualContentHeight

-------------------------------------
-- 벽 만들기
local wallT = display.newRect(0, -9, __appContentWidth__, 10)
wallT:setFillColor(1, 0, 0, 1)
physics.addBody(wallT, "static", {friction=10, density=10})

local wallL = display.newRect(-9, 0, 10, __appContentHeight__)
wallL:setFillColor(1, 0, 0, 1)
physics.addBody(wallL, "static", {friction=10, density=10})

local wallR = display.newRect(__appContentWidth__ - 1, 0, 10, __appContentHeight__)
wallR:setFillColor(1, 0, 0, 1)
physics.addBody(wallR, "static", {friction=10, density=10})

local wallB = display.newRect(0, __appContentHeight__ - 1, __appContentWidth__, 10)
wallB:setFillColor(1, 0, 0, 1)
physics.addBody(wallB, "static", {friction=10, density=10})
-------------------------------------

local img = display.newImage("Icon.png", 50, 50)
physics.addBody(img, "dynamic", nil)