display.setStatusBar(display.HiddenStatusBar)

display.setDefault("anchorX", 0)
display.setDefault("anchorY", 0)

local widget = require( "widget" )

-- (3) 버튼 터치 이벤트
local function on_SwitchPressed( e )
	local switch = e.target
	print( "스위치 아이디: " .. switch.id )
	print( "상태: " .. tostring(switch.isOn) )
end

-- (1) 체크박스 그룹 생성
local onOffGroup = display.newGroup()
onOffGroup.x, onOffGroup.y = 50, 50

-- (2) 첫 번째 버튼 생성
local onOffButton1 = widget.newSwitch({
	left = 0,
	top = 0,
	id = "btn1",
	style = "onOff",
	initialSwitchState = true,
	onPress = on_SwitchPressed
})
onOffGroup:insert( onOffButton1 )

-- 두 번째 버튼 생성
local onOffButton2 = widget.newSwitch({
	left = 100,
	top = 0,
	id = "btn2",
	style = "onOff",
	onPress = on_SwitchPressed
})
onOffGroup:insert( onOffButton2 )