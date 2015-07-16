display.setStatusBar(display.HiddenStatusBar)

display.setDefault("anchorX", 0)
display.setDefault("anchorY", 0)

local physics = require "physics"
physics.start()
--physics.setDrawMode("hybrid")

local __appContentWidth__ = display.actualContentWidth
local __appContentHeight__ = display.actualContentHeight

-------------------------------------
-- 벽 만들기
local wallT = display.newRect(0, -9, __appContentWidth__, 10)
wallT:setFillColor(1, 0, 0, 1)
physics.addBody(wallT, "static", {friction=10, density=10, filter={categoryBits=8, maskBits=7}})

local wallL = display.newRect(-9, 0, 10, __appContentHeight__)
wallL:setFillColor(1, 0, 0, 1)
physics.addBody(wallL, "static", {friction=10, density=10, filter={categoryBits=8, maskBits=7}})

local wallR = display.newRect(__appContentWidth__ - 1, 0, 10, __appContentHeight__)
wallR:setFillColor(1, 0, 0, 1)
physics.addBody(wallR, "static", {friction=10, density=10, filter={categoryBits=8, maskBits=7}})

local wallB = display.newRect(0, __appContentHeight__ - 1, __appContentWidth__, 10)
wallB:setFillColor(1, 0, 0, 1)
physics.addBody(wallB, "static", {friction=10, density=10, filter={categoryBits=8, maskBits=7}})
-------------------------------------

-- 이미지 생성
local function createImage(name, categoryBits, maskBits)
	local img = display.newImage(name..".png", math.random(30, __appContentWidth__ - 30), math.random(30, 80))
	img.anchorX, img.anchorY = 0.5, 0.5
	physics.addBody(img, "dynamic", {radius=25, friction=1, density=3, filter={categoryBits=categoryBits, maskBits=maskBits}})
end

for i = 1, 5 do
	createImage("Red", 1, 9) -- 벽, Red
	createImage("Green", 2, 10) -- 벽, Green
	createImage("Blue", 4, 12) -- 벽, Blue
end