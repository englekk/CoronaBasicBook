local zip = require( "plugin.zip" )

function zipUncompressListener( event )
    if ( event.isError ) then
        print( "Error!" )
    else
        print( "event.name: " .. event.name )
        print( "event.type: " .. event.type )

        --example response
        --event.response = {
        --[1] = "space.jpg",
        --[2] = "space1.jpg",
        --}
    end
end

local function zipListListener( event )
    if ( event.isError ) then
        print( "Error!" )
    else
    	--{
        --   ratio: 98
        --   size: 2188295440
        --   file: space.jpg
        --}
    	for k,v in pairs(event.response) do
    		print(v.file, v.size)
    	end

    	local zipOptions =
		{
		    zipFile = "test.zip",
		    zipBaseDir = system.ResourceDirectory,
		    dstBaseDir = system.DocumentsDirectory,
		    -- files = { "space.jpg", "space1.jpg" },
		    listener = zipUncompressListener
		}
		zip.uncompress( zipOptions )
    end
end

local zipOptions = {
    zipFile = "test.zip",
    zipBaseDir = system.ResourceDirectory,
    listener = zipListListener
}

zip.list( zipOptions )