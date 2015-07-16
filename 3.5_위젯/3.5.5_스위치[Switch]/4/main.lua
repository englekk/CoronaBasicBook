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
local checkboxGroup = display.newGroup()
checkboxGroup.x, checkboxGroup.y = 50, 50

-- (2) 첫 번째 버튼 생성
local checkboxButton1 = widget.newSwitch({
	left = 0,
	top = 0,
	id = "btn1",
	style = "checkbox",
	initialSwitchState = true,
	onPress = on_SwitchPressed
})
checkboxGroup:insert( checkboxButton1 )

-- 두 번째 버튼 생성
local checkboxButton2 = widget.newSwitch({
	left = 50,
	top = 0,
	id = "btn2",
	style = "checkbox",
	onPress = on_SwitchPressed
})
checkboxGroup:insert( checkboxButton2 )

-- 세 번째 버튼 생성
local checkboxButton3 = widget.newSwitch({
	left = 0,
	top = 80,
	id = "btn3",
	style = "checkbox",
	onPress = on_SwitchPressed
})
checkboxGroup:insert( checkboxButton3 )

-- 네 번째 버튼 생성
local checkboxButton4 = widget.newSwitch({
	left = 50,
	top = 80,
	id = "btn4",
	style = "checkbox",
	onPress = on_SwitchPressed
})
checkboxGroup:insert( checkboxButton4 )
