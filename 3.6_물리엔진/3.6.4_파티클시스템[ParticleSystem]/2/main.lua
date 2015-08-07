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

local ps = nil

--====================== Type List Begin ======================--
local typeList = {}

-- water 그룹
typeList[1] = {
	flags = "water",
	halfWidth = 64,
	halfHeight = 32
}

-- elastic (탄성력) 그룹
typeList[2] = {
	flags = {"elastic"},
	radius = 32
}

-- 모양(shape)을 설정한 그룹
typeList[3] = {
	flags = {"elastic"},
	shape = {0,0, 30,30, -30,30}
}

-- 이미지의 아웃라인을 이용한 그룹
local imageOutline = graphics.newOutline(2, "star.png")
typeList[4] = {
	flags = "elastic",
	outline = imageOutline
}

-- 현재 선택된 타입
local selectedType = typeList[1]
--====================== Type List End ======================--

--====================== SegmentedControl Widget Begin ======================--
local widget = require "widget"

-- 각 메뉴명
local segments = { "Water", "Elastic", "Shape", "Outline" }

-- segmentedControl을 선택했을 때 호출될 함수
local function onSegmentPress( event )
	local target = event.target
	
	selectedType = typeList[target.segmentNumber]

	-- 모든 영역의 파티클 제거
	ps:destroyParticles({
		x = __appContentWidth__ * 0.5,
		y = __appContentHeight__ * 0.5,
		halfWidth = __appContentWidth__ * 0.5,
		halfHeight = __appContentHeight__ * 0.5
	})
end

-- segmentedControl 생성
local segmentedControl = widget.newSegmentedControl({
	left = 1,
	top = 1,
	segmentWidth = 89,
	segments = segments,
	defaultSegment = 1,
	onPress = onSegmentPress
})
--====================== SegmentedControl Widget End ======================--

-- 파티클 시스템 생성
ps = physics.newParticleSystem(
     {
          filename = "Icon.png",
          radius = 4
     }
)

-- 화면 터치 시 파티클 그룹 생성
 local function on_Touch(e)
	if e.phase == "ended" then
		selectedType.x, selectedType.y = e.x, e.y
		
		ps:createGroup(selectedType)
	end
end
Runtime:addEventListener("touch", on_Touch)