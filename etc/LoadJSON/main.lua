local json = require("json")
local file = io.open(system.pathForFile("loadTest.json"), "r")
local data = json.decode(file:read("*a"))
data = data.data
for i=1, #data do
	print(data[i])
end