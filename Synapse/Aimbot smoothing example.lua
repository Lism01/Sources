--[[
    This is a mousemoverel smoothing example.
    I managed to create it using https://chat.openai.com/chat and my own knowledge.
    You can make it even slower by adding a tick delay:
    
    local Tick = tick()

    while true do
        task.wait()
        
        if tick() - Tick < 0.02 then
            continue
        end
        
        Tick = tick()
        
        -- script here
    end

]]

--#region Settings
local Pixels = 0.8 -- Making this number lower makes it not work sometimes
--#endregion

--#region Services
local Players = game:GetService("Players")
--#endregion

--#region Instances
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local ChosenTarget = Players:GetChildren()[2].Character.HumanoidRootPart.Position
--#endregion

--#region Main
for i=1, 500 do
    local WorldToScreenPoint = workspace.CurrentCamera:WorldToScreenPoint(ChosenTarget)
    
    local MousePosition = Vector2.new(Mouse.x, Mouse.y)
    local PlayerPosition = Vector2.new(WorldToScreenPoint.x, WorldToScreenPoint.y)

    local Direction = (PlayerPosition - MousePosition).Unit 
    local Distance = (PlayerPosition - MousePosition).Magnitude

    local Offset
    if Distance > Pixels then
        Offset = Direction * Pixels
    else
        Offset = Direction * Distance
    end
    
    mousemoverel(Offset.x, Offset.y)
    
    task.wait()
end
--#endregion 
