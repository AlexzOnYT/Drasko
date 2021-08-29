--[[ Constants ]]--
local Controllers = {}
Controllers.__index = Controllers

--[[ Variables ]]--

Controllers.IntegrityProperties = {"Execute"}

--[[ Controllers ]]--

function Controllers:IntegrityCheck(ControllerModule)
	for Index, PropertyName in ipairs(Controllers.IntegrityProperties) do
		if not ControllerModule[PropertyName] then
			return false
		end
	end
	return true
end

function Controllers:SerializeModule(ControllerModule)
	local ModuleSrc = require(ControllerModule)

	if self:IntegrityCheck(ModuleSrc) then
		warn("[Drasko] Loaded Client Controller: "..ControllerModule.Name)
		return ModuleSrc
	end
end

function Controllers:CompileController(ControllerModule)
	if ControllerModule:GetAttribute("ControllerEnabled") then
		local ControllerModuleSrc = self:SerializeModule(ControllerModule)
		
		self.Controllers[ControllerModule.Name] = ControllerModuleSrc
		ControllerModuleSrc:Execute(self.Drasko)
	end
end

function Controllers:InitalizeModules(Drasko)
	self.Drasko = Drasko
	self.Services = Drasko.Services
	self.Controllers = Drasko.Controllers

	for _, Module in ipairs(script:GetChildren()) do
		self:CompileController(Module)
	end
end

return Controllers
