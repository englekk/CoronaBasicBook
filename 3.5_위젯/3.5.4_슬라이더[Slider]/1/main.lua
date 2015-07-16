display.setStatusBar(display.HiddenStatusBar)

display.setDefault("anchorX", 0)
display.setDefault("anchorY", 0)

local widget = require( "widget" )

-- (2) 값 변경 이벤트
local function sliderListener( event )
    print( "Slider at " .. event.value .. "%" )
end

-- (1) slider 위젯 생성
local slider = widget.newSlider({
    top = 30,
    left = 20,
    width = 320,
    value = 50,
    listener = sliderListener
})