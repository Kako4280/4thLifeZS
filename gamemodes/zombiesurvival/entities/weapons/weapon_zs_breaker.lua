AddCSLuaFile()

SWEP.PrintName = "Breaker Blade"
SWEP.Description = "A slow melee that builds up damage each kill."

if CLIENT then
	SWEP.ViewModelFOV = 70
	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

SWEP.VElements = {
    ["br9+"] = { type = "Model", model = "models/props_pipes/pipe01_connector01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.051, 3.075, -6.801), angle = Angle(5, -90, 0), size = Vector(0.405, 0.405, 0.405), color = Color(130, 255, 75, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
    ["br6+"] = { type = "Model", model = "models/hunter/blocks/cube025x4x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.174, 2.575, -27.701), angle = Angle(-5, 90, -90), size = Vector(0.204, 0.214, 0.204), color = Color(255, 219, 150, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
    ["br8"] = { type = "Model", model = "models/hunter/triangles/025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.224, 5.25, -44), angle = Angle(1.11, 180, -85), size = Vector(0.449, 0.449, 0.4), color = Color(180, 180, 180, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
    ["br5"] = { type = "Model", model = "models/hunter/blocks/cube025x05x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.5, 0.699, -5.75), angle = Angle(-5, 90, 0), size = Vector(0.2, 0.4, 0.173), color = Color(255, 219, 150, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
    ["br4"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.5, 1.75, -4), angle = Angle(0, 0, -5), size = Vector(0.173, 0.15, 0.173), color = Color(50, 50, 50, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
    ["br3"] = { type = "Model", model = "models/hunter/geometric/hex1x05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.5, -0.5, 9), angle = Angle(0, 0, 85), size = Vector(0.025, 0.039, 0.73), color = Color(100, 100, 100, 255), surpresslightning = false, material = "phoenix_storms/construct/concrete_barrier00", skin = 0, bodygroup = {} },
    ["br6"] = { type = "Model", model = "models/hunter/blocks/cube025x4x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.3, 2.474, -19), angle = Angle(0, 0, 85), size = Vector(0.449, 0.175, 0.1), color = Color(180, 180, 180, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
    ["br2"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.5, 0.699, 8), angle = Angle(0, 0, -5), size = Vector(0.15, 0.15, 0.15), color = Color(50, 50, 50, 255), surpresslightning = false, material = "phoenix_storms/construct/concrete_barrier00", skin = 0, bodygroup = {} },
    ["br9++"] = { type = "Model", model = "models/props_pipes/pipe01_connector01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.051, 1.1, -9.301), angle = Angle(-5, 90, 0), size = Vector(0.405, 0.405, 0.405), color = Color(255, 100, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
    ["br9"] = { type = "Model", model = "models/props_pipes/pipe01_connector01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.051, 3.299, -9.2), angle = Angle(5, -90, 0), size = Vector(0.405, 0.405, 0.405), color = Color(255, 100, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
    ["br1"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.5, 1.7, -3.5), angle = Angle(0, 0, -5), size = Vector(0.5, 0.5, 0.1), color = Color(130, 50, 50, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
    ["br9+++"] = { type = "Model", model = "models/props_pipes/pipe01_connector01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.051, 0.899, -6.901), angle = Angle(-5, 90, 0), size = Vector(0.405, 0.405, 0.405), color = Color(130, 255, 75, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
    ["br8+"] = { type = "Model", model = "models/hunter/triangles/025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.169, 5.429, -46.401), angle = Angle(0, 180, -85), size = Vector(0.204, 0.204, 0.814), color = Color(255, 219, 150, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} }
}
 
SWEP.WElements = {
    ["br9+"] = { type = "Model", model = "models/props_pipes/pipe01_connector01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.051, 3.075, -6.801), angle = Angle(5, -90, 0), size = Vector(0.405, 0.405, 0.405), color = Color(130, 255, 75, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
    ["br6+"] = { type = "Model", model = "models/hunter/blocks/cube025x4x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.174, 2.575, -27.701), angle = Angle(-5, 90, -90), size = Vector(0.204, 0.214, 0.204), color = Color(255, 219, 150, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
    ["br8"] = { type = "Model", model = "models/hunter/triangles/025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.224, 5.25, -44), angle = Angle(1.11, 180, -85), size = Vector(0.449, 0.449, 0.4), color = Color(180, 180, 180, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
    ["br5"] = { type = "Model", model = "models/hunter/blocks/cube025x05x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.5, 0.699, -5.75), angle = Angle(-5, 90, 0), size = Vector(0.2, 0.4, 0.173), color = Color(255, 219, 150, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
    ["br4"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.5, 1.75, -4), angle = Angle(0, 0, -5), size = Vector(0.173, 0.15, 0.173), color = Color(50, 50, 50, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
    ["br3"] = { type = "Model", model = "models/hunter/geometric/hex1x05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.5, -0.5, 9), angle = Angle(0, 0, 85), size = Vector(0.025, 0.039, 0.73), color = Color(100, 100, 100, 255), surpresslightning = false, material = "phoenix_storms/construct/concrete_barrier00", skin = 0, bodygroup = {} },
    ["br6"] = { type = "Model", model = "models/hunter/blocks/cube025x4x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.3, 2.474, -19), angle = Angle(0, 0, 85), size = Vector(0.449, 0.175, 0.1), color = Color(180, 180, 180, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
    ["br2"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.5, 0.699, 8), angle = Angle(0, 0, -5), size = Vector(0.15, 0.15, 0.15), color = Color(50, 50, 50, 255), surpresslightning = false, material = "phoenix_storms/construct/concrete_barrier00", skin = 0, bodygroup = {} },
    ["br9++"] = { type = "Model", model = "models/props_pipes/pipe01_connector01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.051, 1.1, -9.301), angle = Angle(-5, 90, 0), size = Vector(0.405, 0.405, 0.405), color = Color(255, 100, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
    ["br9"] = { type = "Model", model = "models/props_pipes/pipe01_connector01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.051, 3.299, -9.2), angle = Angle(5, -90, 0), size = Vector(0.405, 0.405, 0.405), color = Color(255, 100, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
    ["br1"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.5, 1.7, -3.5), angle = Angle(0, 0, -5), size = Vector(0.5, 0.5, 0.1), color = Color(130, 50, 50, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
    ["br9+++"] = { type = "Model", model = "models/props_pipes/pipe01_connector01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.051, 0.899, -6.901), angle = Angle(-5, 90, 0), size = Vector(0.405, 0.405, 0.405), color = Color(130, 255, 75, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
    ["br8+"] = { type = "Model", model = "models/hunter/triangles/025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.169, 5.429, -46.401), angle = Angle(0, 180, -85), size = Vector(0.204, 0.204, 0.814), color = Color(255, 219, 150, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} }
}
end

SWEP.Base = "weapon_zs_basemelee"

SWEP.HoldType = "melee2"

SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.UseHands = true


SWEP.HoldType = "melee2"
SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"

SWEP.Base = "weapon_zs_basemelee"


SWEP.MeleeDamage = 80
SWEP.MeleeRange = 75
SWEP.MeleeSize = 2.4

SWEP.Primary.Delay = 1.15

SWEP.Tier = 5
--SWEP.MaxStock = 2

SWEP.WalkSpeed = SPEED_SLOW



SWEP.AllowQualityWeapons = true

SWEP.SwingRotation = Angle(30, -20, 10)
SWEP.SwingOffset = Vector(0, -30, 0)
SWEP.SwingTime = 0.90
SWEP.SwingHoldType = "melee"


function SWEP:PlaySwingSound()
	self:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 75, math.random(25, 30))
end

function SWEP:PlayHitSound()
	self:EmitSound("weapons/melee/shovel/shovel_hit-0"..math.random(4)..".ogg", 75, math.random(50, 60))
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("physics/flesh/flesh_bloody_break.wav", 80, math.random(85, 95))
end

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.03)


function SWEP:OnZombieKilled(hitent)
    local killer = self:GetOwner()

        if killer:IsValid() then   
        local status = killer:GiveStatus("reaper", 15)
        if status and status:IsValid() then
            status:SetDTInt(1, math.min(status:GetDTInt(1) + 1, 10))
        end
    end
end 
