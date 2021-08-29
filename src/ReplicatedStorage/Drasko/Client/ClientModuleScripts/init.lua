--[[ Constants ]]--
local ClientModuleScripts = {}

--[[ Variables ]]--
local Services = require(script:WaitForChild("SingletonModules"))
local Controllers = require(script:WaitForChild("ScriptModules"))

--[[ Drasko Framework ]]--
function ClientModuleScripts:ExecuteModules(Drasko)
	Services:InitalizeModules(Drasko)
	Controllers:InitalizeModules(Drasko)
end

function ClientModuleScripts.new()
	local self = setmetatable({}, ClientModuleScripts)

	self.Services = { }
	self.Controllers = { }

	--// Events Folder
	self.EventsFolder = game.ReplicatedStorage:WaitForChild("Drasko"):WaitForChild("Remotes")

	--// Start Modules
	ClientModuleScripts:ExecuteModules(self)

	return self
end

return ClientModuleScripts.new()
