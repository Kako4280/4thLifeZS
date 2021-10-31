AddCSLuaFile()

SWEP.Base = "weapon_zs_basemelee"

SWEP.PrintName = "Great Hammer"
SWEP.Description = "A large hammer that creates explosions with overkill damage."

SWEP.Tier = 4

SWEP.MeleeDamage = 85
SWEP.MeleeRange = 68
SWEP.MeleeSize = 2.7
SWEP.MeleeKnockBack = 0

SWEP.Primary.Delay = 1.5

SWEP.SwingRotation = Angle(60, 0, -80)
SWEP.SwingOffset = Vector(0, -30, 0)
SWEP.SwingTime = 1
SWEP.SwingHoldType = "melee"

SWEP.HoldType = "melee2"
SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.UseHands = true

SWEP.AllowQualityWeapons = true

if CLIENT then
    SWEP.ViewModelFOV = 65
    SWEP.ViewModelFlip = false
    SWEP.ShowViewModel = false
    SWEP.ShowWorldModel = false
    SWEP.ViewModelBoneMods = {}

    SWEP.VElements = {
        ["parting_grip"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.525, 1.55, -5.75), angle = Angle(6, 0, 0), size = Vector(0.7, 0.7, 0.13), color = Color(76, 62, 66, 255), surpresslightning = false, material = "phoenix_storms/construct/concrete_barrier00", skin = 0, bodygroup = {} },
        ["parting_pole"] = { type = "Model", model = "models/props_docks/dock01_pole01a_256.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.8, 1.55, -8), angle = Angle(6, 0, 0), size = Vector(0.08, 0.08, 0.13), color = Color(65, 26, 36, 255), surpresslightning = false, material = "phoenix_storms/white_brushes", skin = 0, bodygroup = {} },
        ["parting_pommel"] = { type = "Model", model = "models/props_borealis/bluebarrel001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "parting_grip", pos = Vector(0, 0, 14), angle = Angle(-180, 0, 0), size = Vector(0.07, 0.07, 0.04), color = Color(67, 70, 75, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
        ["parting_top_back"] = { type = "Model", model = "models/mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "parting_top_base", pos = Vector(-1.8, 0, 0), angle = Angle(40, 90, 90), size = Vector(0.12, 0.12, 0.12), color = Color(67, 70, 75, 255), surpresslightning = false, material = "phoenix_storms/metalfloor_2-3", skin = 0, bodygroup = {} },
        ["parting_top_base"] = { type = "Model", model = "models/props_pipes/concrete_pipe001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.45, 1.55, -24), angle = Angle(6, 0, 0), size = Vector(0.05, 0.05, 0.05), color = Color(67, 70, 75, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
        ["parting_top_front"] = { type = "Model", model = "models/mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "parting_top_base", pos = Vector(1.8, 0, 0), angle = Angle(35, -90, 90), size = Vector(0.12, 0.12, 0.12), color = Color(67, 70, 75, 255), surpresslightning = false, material = "phoenix_storms/metalfloor_2-3", skin = 0, bodygroup = {} },
        ["parting_top_hammer_back"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "parting_top_base", pos = Vector(-5, 0, 3.5), angle = Angle(180, 0, 0), size = Vector(0.1, 0.7, 0.7), color = Color(67, 70, 75, 255), surpresslightning = false, material = "phoenix_storms/metalfloor_2-3", skin = 0, bodygroup = {} },
        ["parting_top_hammer_detail1"] = { type = "Model", model = "models/props_lab/jar01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "parting_top_base", pos = Vector(-0.015, 0, 1), angle = Angle(0, 0, 0), size = Vector(0.25, 0.25, 0.25), color = Color(67, 70, 75, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
        ["parting_top_hammer_detail2"] = { type = "Model", model = "models/mechanics/wheels/wheel_speed_72.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "parting_top_base", pos = Vector(0, 0, -2), angle = Angle(180, 0, 0), size = Vector(0.025, 0.025, 0.05), color = Color(67, 70, 75, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
        ["parting_top_hammer_front"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "parting_top_base", pos = Vector(5, 0, -3.5), angle = Angle(0, 0, 0), size = Vector(0.1, 0.7, 0.7), color = Color(67, 70, 75, 255), surpresslightning = false, material = "phoenix_storms/metalfloor_2-3", skin = 0, bodygroup = {} }
    }
    
    SWEP.WElements = {
        ["parting_grip"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.7, 1.55, -5.75), angle = Angle(6, 0, 0), size = Vector(0.7, 0.7, 0.13), color = Color(76, 62, 66, 255), surpresslightning = false, material = "phoenix_storms/construct/concrete_barrier00", skin = 0, bodygroup = {} },
        ["parting_pole"] = { type = "Model", model = "models/props_docks/dock01_pole01a_256.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.975, 1.55, -8), angle = Angle(6, 0, 0), size = Vector(0.08, 0.08, 0.13), color = Color(65, 26, 36, 255), surpresslightning = false, material = "phoenix_storms/white_brushes", skin = 0, bodygroup = {} },
        ["parting_pommel"] = { type = "Model", model = "models/props_borealis/bluebarrel001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "parting_grip", pos = Vector(0, 0, 14), angle = Angle(-180, 0, 0), size = Vector(0.065, 0.065, 0.03), color = Color(67, 70, 75, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
        ["parting_top_back"] = { type = "Model", model = "models/mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "parting_top_base", pos = Vector(-1.8, 0, 0), angle = Angle(40, 90, 90), size = Vector(0.12, 0.12, 0.12), color = Color(67, 70, 75, 255), surpresslightning = false, material = "phoenix_storms/metalfloor_2-3", skin = 0, bodygroup = {} },
        ["parting_top_base"] = { type = "Model", model = "models/props_pipes/concrete_pipe001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.625, 1.55, -24), angle = Angle(6, 0, 0), size = Vector(0.05, 0.05, 0.05), color = Color(67, 70, 75, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
        ["parting_top_front"] = { type = "Model", model = "models/mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "parting_top_base", pos = Vector(1.8, 0, 0), angle = Angle(35, -90, 90), size = Vector(0.12, 0.12, 0.12), color = Color(67, 70, 75, 255), surpresslightning = false, material = "phoenix_storms/metalfloor_2-3", skin = 0, bodygroup = {} },
        ["parting_top_hammer_back"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "parting_top_base", pos = Vector(-5, 0, 3.5), angle = Angle(180, 0, 0), size = Vector(0.1, 0.7, 0.7), color = Color(67, 70, 75, 255), surpresslightning = false, material = "phoenix_storms/metalfloor_2-3", skin = 0, bodygroup = {} },
        ["parting_top_hammer_detail1"] = { type = "Model", model = "models/props_lab/jar01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "parting_top_base", pos = Vector(-0.015, 0, 1), angle = Angle(0, 0, 0), size = Vector(0.25, 0.25, 0.25), color = Color(67, 70, 75, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
        ["parting_top_hammer_detail2"] = { type = "Model", model = "models/mechanics/wheels/wheel_speed_72.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "parting_top_base", pos = Vector(0, 0, -2), angle = Angle(180, 0, 0), size = Vector(0.025, 0.025, 0.05), color = Color(67, 70, 75, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
        ["parting_top_hammer_front"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "parting_top_base", pos = Vector(5, 0, -3.5), angle = Angle(0, 0, 0), size = Vector(0.1, 0.7, 0.7), color = Color(67, 70, 75, 255), surpresslightning = false, material = "phoenix_storms/metalfloor_2-3", skin = 0, bodygroup = {} }
    }
end

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MELEE_IMPACT_DELAY, -0.12)

function SWEP:OnZombieKilled(zombie)
    local killer = self:GetOwner()
    local minushp = -zombie:Health()
    if killer:IsValid() and minushp > 10 then
        local pos = zombie:GetPos()

        timer.Simple(0.15, function()
            util.BlastDamagePlayer(killer:GetActiveWeapon(), killer, pos, 50, minushp * 0.1, DMG_ALWAYSGIB, 0.85)
        end)

        local tr = killer:CompensatedMeleeTrace(self.MeleeRange * (killer.MeleeRangeMul or 1), self.MeleeSize)

        local effectdata = EffectData()
            effectdata:SetOrigin(tr.HitPos)
            effectdata:SetNormal(tr.HitNormal)
        util.Effect("shockwave", effectdata, true, true)
    end
end

function SWEP:PlaySwingSound()
	self:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 75, math.random(25, 35))
end

function SWEP:PlayHitSound()
	self:EmitSound("physics/metal/metal_canister_impact_hard"..math.random(3)..".wav", 75, math.Rand(70, 74))
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("physics/flesh/flesh_impact_hard"..math.random(2, 3)..".wav", 75, math.Rand(80, 84))
end
