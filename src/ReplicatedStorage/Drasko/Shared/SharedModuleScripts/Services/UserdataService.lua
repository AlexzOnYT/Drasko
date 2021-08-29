	-- [[ About ]] --
-- This class is built to give other classes a valuable and stable proxy.
-- A proxy is a userdata value. It is an LuaObject that is assigned a table
-- All proxies are signed with a __metatable metamethod, This means a developer cannot edit
-- the metatable of these proxies.

-- [[ Constants ]] --
local UserdataService = {}

-- [[ Variables ]] --
UserdataService.__index = UserdataService

-- [[ Userdata Service ]] --
-- // Create a new proxy for a class
function UserdataService:CreateUserdata(UserdataValue, UserdataName)
	local Proxy = newproxy(true)
	local ProxyMT = getmetatable(Proxy)
	
	ProxyMT.__tostring = function() return UserdataName end
	ProxyMT.__newindex = function(tbl, idx, val) if UserdataValue[idx] ~= nil then UserdataValue[idx] = val end end
	ProxyMT.__index = UserdataValue
	ProxyMT.__metatable = "this metatable is locked"
	
	return Proxy
end

-- // Constructor
function UserdataService.new(Kernel)
	local self = setmetatable({}, UserdataService)
	
	self.Kernel = Kernel
	self.Services = self.Kernel.Services

	return self:CreateUserdata(self, "UserdataService")
end

return UserdataService
