display.setStatusBar(display.HiddenStatusBar)

display.setDefault("anchorX", 0)
display.setDefault("anchorY", 0)

local physics = require "physics"
physics.start()
physics.setDrawMode("hybrid")

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

-- 고정된 사각형
local staticBox = display.newRect(150, 200, 50, 50)
staticBox.anchorX, staticBox.anchorY = 0.5, 0.5
staticBox:setFillColor(1, 0, 0, 1)
physics.addBody(staticBox, "static", {friction=1, density=5})

-- 첫 번째 박스
local b1 = display.newImage("Icon.png", 50, 0)
b1.anchorX, b1.anchorY = 0.5, 0.5
physics.addBody(b1, "dynamic", {friction=1, density=5})

-- 두 번째 박스
local b2 = display.newImage("Icon.png", 150, 0)
b2.anchorX, b2.anchorY = 0.5, 0.5
physics.addBody(b2, "dynamic", {friction=1, density=5})

-- Touch Joint
local function setTouchJoint(target)
	local touchJoint = physics.newJoint("touch", target, target.x, target.y)
	touchJoint.dampingRatio = 1
	touchJoint.frequency = 10
	return touchJoint
end

-- (1) 터치 조인트 생성
b1.joint = setTouchJoint(b1)
b2.joint = setTouchJoint(b2)

-- (2) 오브젝트 터치
local function on_Touch(e)
	local phase = e.phase
	local target = e.target
	
	if phase == "began" then
		display:getCurrentStage():setFocus(target)
	elseif phase == "ended" then
		display:getCurrentStage():setFocus(nil)
	end
	
	target.joint:setTarget(e.x, e.y)
end
b1:addEventListener("touch", on_Touch)
b2:addEventListener("touch", on_Touch)
