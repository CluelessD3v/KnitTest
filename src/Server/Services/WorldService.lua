local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local ServerScriptService = game:GetService("ServerScriptService")
local Players = game:GetService("Players")

local PlayerEntity = require(ServerScriptService.PlayerEntitiy)

local WorldService = Knit.CreateService {
    Name = "World";
    Client = {};
}


WorldService.PlayerEntities = {}


function WorldService:AddPlayerEntity()
    Players.PlayerAdded:Connect(function(player)
        local newPlayerEntity = PlayerEntity.new(player)
        table.insert(self.PlayerEntities, newPlayerEntity)
        newPlayerEntity:SetData()
    end)
end

function WorldService:RemovePlayerEntity()
    Players.PlayerRemoving:Connect(function(player)
        self.PlayerEntities[player] = nil
    end)
end

function WorldService:KnitInit()
    self:AddPlayerEntity()
    self:RemovePlayerEntity()
end


return WorldService
