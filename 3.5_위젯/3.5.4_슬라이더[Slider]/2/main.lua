display.setStatusBar(display.HiddenStatusBar)

display.setDefault("anchorX", 0)
display.setDefault("anchorY", 0)

local widget = require( "widget" )

-- 슬라이더 이벤트 리스너
local function sliderListener( event )
	print( "Slider at " .. event.value .. "%" )
end

-- (1) 이미지시트 생성
local options = {
	frames = {
		{ x=0, y=0, width=36, height=64 },
		{ x=40, y=0, width=36, height=64 },
		{ x=80, y=0, width=36, height=64 },
		{ x=124, y=0, width=36, height=64 },
		{ x=168, y=0, width=64, height=64 }
	},
	sheetContentWidth = 232,
	sheetContentHeight = 64
}
local sliderSheet = graphics.newImageSheet( "sliderSheet.png", options )

-- (2) slider 위젯 생성
local slider = widget.newSlider({
	sheet = sliderSheet, -- 이미지시트 지정
	leftFrame = 1,
	middleFrame = 2,
	rightFrame = 3,
	fillFrame = 4,
	frameWidth = 36,
	frameHeight = 64,
	handleFrame = 5,
	handleWidth = 64,
	handleHeight = 64,
	top = 50,
	left = 30,
	value = 50,
	orientation = "horizontal",
	width = 300,
	listener = sliderListener
})