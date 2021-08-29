getgenv().mobs = false
getgenv().boss = false
getgenv().playerhbe = false
getgenv().money = false
local size1 = 5



local function nowait()
    spawn(function()
        local hook
        hook = hookfunction(wait, function(e)
            e = 0
            return hook(e)
        end)
    end)
end
function playerhbefunction()
    spawn(function()
        while getgenv().playerhbe do
            if v ~= game.Players.LocalPlayer then
                v.Character.Head.Size = tonumber(Vector3.new(size1,size1,size1))
                v.Character.Head.Material = "Neon"
                v.Character.Head.BrickColor = BrickColor.new("Really blue")
                v.Character.Head.Transparency = 0.7
                v.Character.Head.CanCollide = false
            end
        end
    end)
end

function bringallplayers()
    spawn(function()
        for i,v in pairs(game.Players:GetChildren()) do
            if v.Name ~= game.Players.LocalPlayer.Name then
            v.Character.Head.Anchored = true
            v.Character.Head.CFrame = game.Players.LocalPlayer.Character.Head.CFrame*CFrame.new(0,0,-5)
            end
        end
    end)
end

function mobshbefunction()
    spawn(function() 
        while mobs do
            for i,v in pairs(game:GetService("Workspace").MobsHolder:GetDescendants()) do
                wait(0.1)
                v.Head.Size = Vector3.new(size1,size1,size1)
                v.Head.Material = "Neon"
                v.Head.BrickColor = BrickColor.new("Really blue")
                v.Head.Transparency = 0.7
                v.Head.CanCollide = false
            end
        end
    end)
end

function bosshbefunction()
    spawn(function()
        while boss do
            for i,v in pairs(game:GetService("Workspace").BossHolder:GetDescendants()) do
                wait(0.1)
                v.Head.Size = Vector3.new(size1,size1,size1)
                v.Head.Material = "Neon"
                v.Head.BrickColor = BrickColor.new("Really blue")
                v.Head.Transparency = 0.7
                v.Head.CanCollide = false
            end
        end
    end)
end

local torso = game.Players.LocalPlayer.Character.Torso

local function getmoneyfast()
    spawn(function()
        while money do
            for i, v in pairs(game:GetService("Workspace").TycoonSets.Tycoons:GetDescendants()) do
                if v.Name == "Essentials" then
                    for i2, v2 in pairs(v:GetDescendants()) do
                        if v2.Name == "TouchInterest" and v2.Parent then
                            firetouchinterest(torso, v2.Parent, 0)
                            wait(0.1)
                            firetouchinterest(torso, v2.Parent, 1)
                        end
                    end
                end
            end
        end
    end)
end


local Engine = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/nekomancer69420/timeless/main/timehub.lua"))()

local SlayerTab = Engine:CreateSection("Misc")
SlayerTab:Toggle("Steal Money from others", function(GAMING)
	getgenv().money = GAMING
    if GAMING then
        getmoneyfast()
    end
end)
SlayerTab:Toggle("Player HBE", function(State)
	getgenv().playerhbe = State
    if State then
        playerhbefunction()
    end
end)
SlayerTab:Toggle("Mob HBE", function(eys) 
    getgenv().mobs = eys
    if eys then
        mobshbefunction()
    end
end)
SlayerTab:Toggle("Boss HBE", function(eys1)
	getgenv().boss = eys1
    if eys1 then
        bosshbefunction()
    end
end)
SlayerTab:Button("Bring All Players (Clientsided)",function()
    bringallplayers()
end)
SlayerTab:Button("Remove roll cooldown",function()
    nowait()
end)

SlayerTab:Slider("Hitbox Size", {min = 1, max = 40}, function(bigsus1)
	size1 = bigsus1
end)

Engine:Ready()
    
    
    