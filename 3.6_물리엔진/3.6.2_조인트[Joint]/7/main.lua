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

-- 고정된 사각형 (바닥)
local staticBox = display.newRect(150, 250, 400, 50)
staticBox.anchorX, staticBox.anchorY = 0.5, 0.5
staticBox.rotation = -3
staticBox:setFillColor(1, 0, 0, 1)
physics.addBody(staticBox, "static", {density=100, friction=1, bounce=0})

-- 왼쪽 바퀴
local b1 = display.newImage("Icon_Circle.png", 50, 60)
b1.anchorX, b1.anchorY = 0.5, 0.5
physics.addBody(b1, "dynamic", {radius=25, friction=1, density=5})

-- 오른쪽 바퀴
local b2 = display.newImage("Icon_Circle.png", 130, 60)
b2.anchorX, b2.anchorY = 0.5, 0.5
physics.addBody(b2, "dynamic", {radius=25, friction=1, density=5})

-- 몸체
local body = display.newImage("Icon.png", 90, 30)
body.anchorX, body.anchorY = 0.5, 0.5
body.width, body.height = 80, 40
physics.addBody(body, "dynamic", {density=100,friction=0,bounce=0})

-- 몸체와 바퀴들 조인트
physics.newJoint("pivot", body, b1, b1.x, b1.y)
physics.newJoint("pivot", body, b2, b2.x, b2.y)

-- 양쪽 바퀴들 조인트
physics.newJoint("distance", b1, b2, b1.x, b1.y, b2.x, b2.y)

-- 조인트를 끝낸 후 위치 이동
body.x = 350