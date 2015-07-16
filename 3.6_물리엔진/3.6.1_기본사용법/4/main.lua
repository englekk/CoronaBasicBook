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

local imageFile = "star.png"
local imageOutline = graphics.newOutline(2, imageFile)

for i = 1, 30 do
	local img = display.newImage(imageFile)
	img.anchorX, img.anchorY = 0.5, 0.5
	img.x, img.y = math.random(20, __appContentWidth__ - 20), math.random(50, 250)
	physics.addBody(img, "dynamic", {outline=imageOutline, friction=1, density=3, bounce=0.6})
end

-------------------------------------
-- 드래그 가능한 사각형 만들기
local function on_Touch(e)
	if ( e.phase == "began" ) then
		e.target.alpha = 0.5
		display.getCurrentStage():setFocus(e.target)
	elseif e.phase == "moved" then
		e.target.x = e.x
		e.target.y = e.y
	elseif e.phase == "ended" or e.phase == "cancelled" then
		e.target.alpha = 1
		display.getCurrentStage():setFocus(nil)
	end
end
local dragBox = display.newRect(50, __appContentHeight__ - 32, 60, 60)
dragBox.anchorX, dragBox.anchorY = 0.5, 0.5
dragBox:setFillColor(1, 1, 0, 1)
dragBox:addEventListener("touch", on_Touch)
physics.addBody(dragBox, "kinematic", {friction=1, density=100, bounce=0.1})
-------------------------------------