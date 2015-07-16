display.setStatusBar(display.HiddenStatusBar)

display.setDefault("anchorX", 0)
display.setDefault("anchorY", 0)

local widget = require( "widget" )

-- 이미지를 표시할 그룹
local imgG = display.newGroup()
imgG.y = 50

-- 이미지 변경
local function changeImage(label)
	-- 기존에 이미지가 있다면 제거
	if imgG.numChildren > 0 then imgG:remove(1) end
	
	-- 새로운 이미지 생성
	display.newImage(imgG, label..".png", 0, 0)
end

-- (3) segmentedControl을 선택했을 때 호출될 함수
local function onSegmentPress( event )
	local target = event.target
	print( "Segment Label is:", target.segmentLabel )
	print( "Segment Number is:", target.segmentNumber )
	
	changeImage(target.segmentLabel)
end

-- 각 메뉴명
local segments = { "Apple", "Orange", "Banana", "Avocado" }

-- (1) segmentedControl 생성
local segmentedControl = widget.newSegmentedControl({
	left = 0,
	top = 0,
	segmentWidth = 90,
	segments = segments,
	defaultSegment = 1,
	onPress = onSegmentPress
})

-- (2) 첫번째 이미지로 변경
changeImage(segments[1])