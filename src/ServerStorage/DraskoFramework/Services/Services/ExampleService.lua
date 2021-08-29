local ExampleController = {}


function ExampleController:Execute(Drasko)
	self.Drasko = Drasko
	self.Services = Drasko.Services
	self.Controllers = Drasko.Controllers

	self.Drasko.Event:Create("RemoteEvent", "Hello_Services!")

end
return ExampleController
