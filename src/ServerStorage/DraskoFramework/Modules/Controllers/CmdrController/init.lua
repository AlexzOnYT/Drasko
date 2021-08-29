---// Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--// Modules
local config = require(script.Cmdr_Config)
local Cmdr = require(script.Cmdr)

--// Variables
local CmdrController = {}
CmdrController.__index = CmdrController

function CmdrController:Execute(Drasko)
	Cmdr:RegisterDefaultCommands()
	Cmdr:RegisterHooksIn(script.Cmdr.CommandsShared)
	-- Cmdr:RegisterCommandsIn(script.Parent.CmdrCommands) 
end

return CmdrController