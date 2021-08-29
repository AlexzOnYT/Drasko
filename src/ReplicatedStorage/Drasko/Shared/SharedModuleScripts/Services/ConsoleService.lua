-- [[ About ]] --
-- This class is built to handle output. Logging and errors from the ScriptContext.
-- This class offers a dynamic and extensive management system to retrieve and manage Logs
-- Any log which is handled though this class will be logged and traceback will be cached

-- [[ Constants ]] --
local ConsoleService = {}

-- [[ Variables ]] --
ConsoleService.__index = ConsoleService
ConsoleService.APIEndpoints = {"Debug", "Info", "Warn", "Error", "Critical"}
ConsoleService.LogCache = {}

-- Debug: Basic information. Nothing important. Such as registration.
-- Info: General printing stuff. Like updates to the F9 Console
-- Warn: Managable Exceptions, Not bad but not good.
-- Error: Cause isssues or problems in game.
-- Critical: Renders the game unplayable.

-- [[ Console Class ]] --
function ConsoleService:ConcatVarArg(...)
	local Arguments = {...}
	local Str = ""
	
	for Index, Value in ipairs(Arguments) do
		Str = Str .. " " .. tostring(Value)
	end
	
	return Str
end

function ConsoleService:InitializeAPIEndpoints()
	for Index, EndpointName in ipairs(self.APIEndpoints) do
		self.LogCache[EndpointName] = {}
		
		self[EndpointName] = function(self, ...)
			local Message = self:ConcatVarArg(...)
			
			table.insert(self.LogCache[EndpointName], {
				Message = Message;
				Stack = debug.traceback();
			})
			
			if self.Drasko.SysOutputLevel <= Index then
					print(("[%s]: %s"):format(EndpointName, Message))
				end
			end
		end
	end

function ConsoleService.new(Drasko)
	
	local self = setmetatable({}, ConsoleService)

	self.Drasko = Drasko
	self.Services = Drasko.Services
	
	self:InitializeAPIEndpoints()

	return self
end

return ConsoleService
