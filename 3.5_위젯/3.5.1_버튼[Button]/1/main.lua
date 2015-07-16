display.setStatusBar(display.HiddenStatusBar)

local widget = require ("widget")

local function on_ButtonEvent(e)
	if e.phase == "ended" then
		print( "버튼 터치 완료" )
	end
end

local button1 = widget.newButton({
	left = 50,
	top = 50,
	id = "button1",
	label = "Button",
	onEvent =on_ButtonEvent 
})