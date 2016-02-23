local xml = require( "xml" ).newParser()
local data = xml:loadFile("loadTest.xml")
data = data.child[1]
for i=1,tonumber(data.properties["count"]) do
	print(data.child[i].value)
end