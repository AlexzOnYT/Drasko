local CmdrController = {}


function CmdrController:Execute(Drasko)
	local Cmdr = require(game.ReplicatedStorage:WaitForChild("CmdrClient"))
	
	Cmdr:SetActivationKeys({Enum.KeyCode.F2})
end

return CmdrController
