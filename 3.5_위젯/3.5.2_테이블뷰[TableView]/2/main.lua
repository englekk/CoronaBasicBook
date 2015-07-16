display.setStatusBar(display.HiddenStatusBar)

display.setDefault("anchorX", 0)
display.setDefault("anchorY", 0)

local widget = require( "widget" )

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

local tableView = widget.newTableView({
	 left = 50,
	 top = 50,
	 width = 260,
	 height = 440,
	 noLines = true,
	 onRowRender = onRowRender
})

for i = 1, 40 do
	  tableView:insertRow({})
end