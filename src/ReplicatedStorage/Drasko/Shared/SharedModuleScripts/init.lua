--[[ Constants ]]--
local DraskoFramework = {}

--[[ Variables ]]--
local Services = require(script:WaitForChild("Services"))
local Controllers = require(script:WaitForChild("Controllers"))

--[[ Drasko Framework ]]--
function DraskoFramework:ExecuteModules(Drasko)
	Services:InitalizeModules(Drasko)
	Controllers:InitalizeModules(Drasko)
end

function DraskoFramework.new()
	local self = setmetatable(shared, DraskoFramework)

	self.Services = { }
	self.Controllers = { }
	self.SysOutputLevel = 1

	--// Events Folder
	self.EventsFolder = game.ReplicatedStorage:WaitForChild("Drasko"):WaitForChild("Remotes")

	--// Start Modules
	DraskoFramework:ExecuteModules(self)

	return self
end

return DraskoFramework.new()
