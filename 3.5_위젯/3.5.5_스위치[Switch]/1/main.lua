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

-- (1) 라디오그룹 생성
local radioGroup = display.newGroup()
radioGroup.x, radioGroup.y = 50, 50

-- (2) 첫 번째 버튼 생성
local radioButton1 = widget.newSwitch({
	left = 0,
	top = 0,
	id = "btn1",
	style = "radio",
	initialSwitchState = true,
	onPress = on_SwitchPressed
})
radioGroup:insert( radioButton1 )

-- 두 번째 버튼 생성
local radioButton2 = widget.newSwitch({
	left = 50,
	top = 0,
	id = "btn2",
	style = "radio",
	onPress = on_SwitchPressed
})
radioGroup:insert( radioButton2 )