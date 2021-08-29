--[[ Constants ]]--
local Services = {}
Services.__index = Services

--[[ Variables ]]--

Services.IntegrityProperties = {"new"}

--[[ Services ]]--

function Services:IntegrityCheck(ServiceModule)
	for Index, PropertyName in ipairs(Services.IntegrityProperties) do
		if not ServiceModule[PropertyName] then
			return false
		end
	end
	return true
end

function Services:SerializeModule(ServiceModule)
	local ModuleSrc = require(ServiceModule)
	
	if self:IntegrityCheck(ModuleSrc) then
		return ModuleSrc
	end
end

function Services:ExecuteService(ServiceModule)
	if ServiceModule:GetAttribute("ServiceEnabled") then
		local ServiceModuleSrc = self:SerializeModule(ServiceModule)
		
		if not ServiceModuleSrc then return end
		
		local Bindable = Instance.new("BindableEvent")
		local Drasko = self.Drasko
		local Execute = true
		
		if ServiceModuleSrc.OnExecute then
			Execute = ServiceModuleSrc:OnExecuted(Drasko)
		end
		
		if Execute then
			Bindable.Event:Connect(function()
				ServiceModuleSrc.new(Drasko)
			
			if ServiceModuleSrc.OnExecuted then
					Execute = ServiceModuleSrc:OnExecuted(Drasko)
				end
			end)
			
			self.Services[ServiceModule.Name] = ServiceModuleSrc
			Bindable:Fire()
		end
		
	end
end

function Services:InitalizeModules(Drasko)
	self.Drasko = Drasko
	self.Services = Drasko.Services
	self.Controllers = Drasko.Controllers
	
	for _, Module in ipairs(script:GetChildren()) do
		self:ExecuteService(Module)
	end
end

return Services
