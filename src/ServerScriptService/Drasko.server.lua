--[[ Drasko Framework ]]--

--[[ About ]]--
-- Drasko Framework Is a framework made for ROBLOX games created by AlexzOnYT.

--[[ Functions ]]--


--[[ How To ]]--

--[[ Creating Events ]]--
--// You need to create a remote event? well It's pretty simple, (ONLY CAN BE DONE PAST SERVER)

-- self.Drasko.Event:Create("EventType", "EventName")

--[[ Connecting Events ]]--
--// You need to connect a client / server code to this remote event? 
 
-- self.Drasko.Event:Get("EventName").OnServerEvent:Connect(function() end)

--[[ Deleting Events ]]--

-- self.Drasko.Event:Delete("EventName")

--[[ Server Loader ]]--
require(game.ServerStorage:WaitForChild("DraskoFramework"))

--[[ Shared Loader ]]--
require(game.ReplicatedStorage:WaitForChild("Drasko"):WaitForChild("Shared"):WaitForChild("SharedModuleScripts"))



