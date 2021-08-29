--[[
	
	Fly Ovato
	> Permissions
	> Sorex
	
	Version 1
	
--]]

local RankMapping = {
	DefaultAdmin = "Staff",
}

function HasPermission(player, group)
	local playerRank = player:GetRankInGroup(3543102)
	if playerRank >= 8 or player.Name == "SorexDev" then
		return true
	end
	return false
end

return function (registry)
	registry:RegisterHook("BeforeRun", function(context)
		local permission = HasPermission(context.Executor,context.Group)
		if typeof(permission) == "string" then
			return permission
		end
		if not permission then
			return ("Sorry, you must have %s clearance to execute this command."):format(RankMapping[context.Group])
		end
	end)
end
