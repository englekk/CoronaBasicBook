--##############################  Main Code Begin  ##############################--
local widget = require ( "widget" )
local composer = require( "composer" )

local scene = composer.newScene()

-- "scene:create()"
function scene:create( event )
	local sceneGroup = self.view
	local params = event.params

	-- 여기서부터 시작
	local txt = display.newText(sceneGroup, "Row: " .. params.idx, 50, 50, 0, 0, native.systemFontBold, 20)
	
	local function on_ButtonEvent(e)
		if e.phase == "ended" then
			-- 메모리 관리를 위해 현재 씬을 제거합니다.
			local currScene = composer.getSceneName("current")
			composer.removeScene(currScene)
			
			local options = {
				effect = "slideRight",
				time = 300,
				params = nil
			}
			composer.gotoScene("main_page", options)
		end
	end

	local button1 = widget.newButton({
		left = txt.x,
		top = txt.y + txt.height + 20,
		label = "Back",
		onEvent =on_ButtonEvent
	})
	sceneGroup:insert(button1)
end

-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )

-- -------------------------------------------------------------------------------

return scene
--##############################  Main Code End  ##############################--