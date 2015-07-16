--##############################  Main Code Begin  ##############################--
local widget = require( "widget" )
local composer = require( "composer" )

local scene = composer.newScene()

-- "scene:create()"
function scene:create( event )
	local sceneGroup = self.view
	local params = event.params

	-- 여기서부터 시작
	local function onRowRender( event )
		local row = event.row	
		local rowWidth = row.contentWidth
		local rowHeight = row.contentHeight

		 local idx = row.index

		 -- idx가 홀수일 경우 회색 배경을 추가함
		 if idx % 2 == 1 then
			 local bg = display.newRect(row, 0, 0, rowWidth, rowHeight)
			 bg:setFillColor(0.8, 0.8, 0.8, 1)
		 end

		 local rowTitle = display.newText( row, "Row: " .. row.index, 10, 10, nil, 14 )
		 rowTitle:setFillColor( 0 )
	end

	local function onRowTouch( event )
		local row = event.row

		local options = {
			effect = "slideLeft",
			time = 300,
			params = { idx = row.index }
		}
		composer.gotoScene("sub_page", options)
	end

	local tableView = widget.newTableView({
		left = 50,
		top = 50,
		width = 260,
		height = 440,
		noLines = true,
		onRowRender = onRowRender,
		onRowTouch = onRowTouch
	})
	sceneGroup:insert(tableView)

	for i = 1, 40 do
		  tableView:insertRow({})
	end
end

-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )

-- -------------------------------------------------------------------------------

return scene
--##############################  Main Code End  ##############################--