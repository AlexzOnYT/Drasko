--[[ Constants ]]--
local DraskoFramework = {}

--[[ Events ]]--
local DraskoEvents = {
	["Events"] = { }
}

local EventTypes = {"RemoteEvent", "RemoteFunction", "BindableEvent", "BindableFunction"}

--[[ Variables ]]--
local Services = require(script.Services:WaitForChild("Services"))
local Controllers = require(script.Modules:WaitForChild("Controllers"))

--[[ Services ]]--
local TweenService = game:GetService("TweenService")

--[[ Drasko Framework ]]--
function DraskoFramework:ExecuteModules(Drasko)
	Services:InitalizeModules(Drasko)
	Controllers:InitalizeModules(Drasko)
end


--[[ Drasko Event Handler ]]--

function DraskoEvents:Create(...)
	local args = {...}
	
	if (not table.find(EventTypes, args[1])) then
		print(string.format("[Drasko]: Could not create Event %s Error: That is not a Event!", args[2]))
	else
		
		local EventSrc = Instance.new(args[1])
		EventSrc.Parent = game.ReplicatedStorage:WaitForChild("Drasko"):WaitForChild("Remotes")
		EventSrc.Name = args[2]	
		
		local EventTable = {
			Name = args[2];
			Item = EventSrc;
		}
		table.insert(DraskoEvents.Events, EventTable)

		return EventSrc
	end

end

function DraskoEvents:Get(...)
	local args = {...}	
	local found = false
	local Object_Event = nil
	
	
	for Index, Object in ipairs(DraskoEvents.Events) do
		if Object.Item.Name == args[1] then
			Object_Event = Object
			found = true
		else
			found = false
		end
	end
	
	if (found == false) then

		print(string.format("[Drasko]: Could not Get Event %s Error: That is not a Event!", args[1]))
		
	else
		return Object_Event.Item
	end
end

function DraskoEvents:Delete(...)
	local args = {...}		
	local found = false
	local Object_Event = nil
	local foundIndex = 0

	for Index, Object in ipairs(DraskoEvents.Events) do
		if Object.Item.Name == args[1] then
			Object_Event = Object.Item
			foundIndex = Index
			found = true
		else
			found = false
		end
	end
	
	if (found == false) then
		print(string.format("[Drasko]: Could not Delete Event %s Error: That is not a Event!", args[1]))

	else
		Object_Event:Destroy()
		table.remove(DraskoEvents.Events, foundIndex)
	end
end

function DraskoFramework.new()
	DraskoFramework.Controllers = { }
	local self = setmetatable({}, DraskoFramework)
	
	self.Services = { }
	self.Controllers = { }
	--// Connect Drasko Events
	self.Event = DraskoEvents
	self.Console = nil
	
	--// Events Folder
	self.EventsFolder = Instance.new("Folder")
	self.EventsFolder.Parent = game.ReplicatedStorage:WaitForChild("Drasko")
	self.EventsFolder.Name = "Remotes"
	
	--// Start Modules
	DraskoFramework:ExecuteModules(self)
	
	return self and DraskoFramework
end

return DraskoFramework.new()
