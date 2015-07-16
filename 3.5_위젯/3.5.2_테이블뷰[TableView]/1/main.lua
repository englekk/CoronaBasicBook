display.setStatusBar(display.HiddenStatusBar)

display.setDefault("anchorX", 0)
display.setDefault("anchorY", 0)

local widget = require( "widget" )

local function onRowRender( event )
     local row = event.row
    
     local rowTitle = display.newText( row, "Row: " .. row.index, 10, 10, nil, 14 )
     rowTitle:setFillColor( 0 )
end

local tableView = widget.newTableView({
     left = 50,
     top = 50,
     width = 260,
     height = 440,
     onRowRender = onRowRender
})

for i = 1, 40 do
      tableView:insertRow({})
end