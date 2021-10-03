AddCSLuaFile()

SWEP.PrintName = "Zenith Blade"
SWEP.Description = "Much was conquered and this blade had reached its zenith."

if CLIENT then
	SWEP.ViewModelFOV = 65
	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

	SWEP.VElements = {
		["zenith_guard"] = { type = "Model", model = "models/props_vehicles/tire001c_car.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.45, 1.539, -5.2), angle = Angle(-1, 90, 0), size = Vector(0.2, 0.119, 0.119), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_pommel"] = { type = "Model", model = "models/hunter/misc/cone4x2mirrored.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.619, 1.399, 2.9), angle = Angle(6, 0, 0), size = Vector(0.009, 0.009, 0.009), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_guard_spike_small2"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.5, 1.549, -6.25), angle = Angle(145, 0, 0), size = Vector(0.05, 0.025, 0.1), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_guard_spike_small1"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.75, 1.549, -6.25), angle = Angle(-130, 0, 0), size = Vector(0.05, 0.025, 0.1), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_blade"] = { type = "Model", model = "models/xqm/wingtip1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.03, 1.549, -20.085), angle = Angle(6, 0, 90), size = Vector(0.1, 1, 0.85), color = Color(75, 0, 130, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
		["zenith_grip"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.299, 1.5, -3.75), angle = Angle(6, 0, -1), size = Vector(0.449, 0.449, 0.059), color = Color(75, 0, 130, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
		["zenith_guard_spike_large2"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2, 1.524, -5.22), angle = Angle(95, 0, 0), size = Vector(0.075, 0.025, 0.15), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_guard_spike_large1"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5, 1.549, -5), angle = Angle(-85, 0, 0), size = Vector(0.075, 0.025, 0.15), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_cutaway"] = { type = "Model", model = "models/xqm/wingtip1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.75, 1.549, -7.901), angle = Angle(6, 0, -90), size = Vector(0.1, 0.1, 0.85), color = Color(75, 0, 130, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} }
	}
	SWEP.WElements = {
			["zenith_guard"] = { type = "Model", model = "models/props_vehicles/tire001c_car.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 1.85, -5), angle = Angle(-5, 0, 0), size = Vector(0.2, 0.119, 0.119), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
			["zenith_pommel"] = { type = "Model", model = "models/hunter/misc/cone4x2mirrored.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.75, 1.2, 3.25), angle = Angle(-5.5, 0, -5), size = Vector(0.009, 0.009, 0.009), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
			["zenith_guard_spike_small2"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.95, 0.949, -6.25), angle = Angle(130, -90, 0), size = Vector(0.05, 0.025, 0.1), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
			["zenith_guard_spike_large2"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 0.5, -5.1), angle = Angle(95, -90, -3), size = Vector(0.075, 0.025, 0.15), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
			["zenith_blade"] = { type = "Model", model = "models/xqm/wingtip1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.72, 3.164, -19.66), angle = Angle(5, -90, 85), size = Vector(0.1, 1, 0.85), color = Color(75, 0, 130, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
			["zenith_grip"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.099, 1.75, -3.5), angle = Angle(-5.5, 0, -4.5), size = Vector(0.449, 0.449, 0.059), color = Color(75, 0, 130, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
			["zenith_cutaway"] = { type = "Model", model = "models/xqm/wingtip1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.799, 2.099, -7.5), angle = Angle(-5, 90, -85), size = Vector(0.1, 0.1, 0.85), color = Color(75, 0, 130, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
			["zenith_guard_spike_large1"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 3, -4.901), angle = Angle(-85, -161.111, -74.445), size = Vector(0.075, 0.025, 0.15), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
			["zenith_guard_spike_small1"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.849, 3, -6), angle = Angle(-120, -85, 0), size = Vector(0.05, 0.025, 0.1), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} }
	}
end

SWEP.Base = "weapon_zs_basemelee"

SWEP.HoldType = "melee"

SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.UseHands = true

SWEP.MeleeDamage = 75
SWEP.MeleeRange = 70
SWEP.MeleeSize = 3
SWEP.MeleeKnockBack = 25

SWEP.Primary.Delay = 1.4

SWEP.DamageType = DMG_CLUB

SWEP.Tier = 5

SWEP.WalkSpeed = SPEED_SLOWEST

SWEP.SwingRotation = Angle(0, 0, -80)
SWEP.SwingOffset = Vector(0, -30, 0)
SWEP.SwingTime = 0.4
SWEP.SwingHoldType = "melee"

SWEP.Pulse = true
SWEP.PulseSlowPower = 9

SWEP.Firemode = true

SWEP.Firemodetestcode = {
	ice = {"ice", 1},
	fire = {"fire", 2},
	pulse = {"pulse", 3}
}


SWEP.Firemodes = {
    "ice",
	"fire",
	"pulse"
}

SWEP.AllowQualityWeapons = true

function SWEP:PlaySwingSound()
	self:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 75, math.random(65, 85))
end

function SWEP:PlayHitSound()
	self:EmitSound("ambient/machines/slicer"..math.random(4)..".wav", 75)
end

local branch = GAMEMODE:AddNewRemantleBranch(SWEP, 1, "Zenith Blade", "ignite zombies instead of inflicting pulse slow.", function(wept)
      wept.Burn = true
	  wept.BurnChance = 100
	  wept.BurnDamage = 8
      wept.Pulse = false
      wept.MeleeDamage = wept.MeleeDamage * 0.9

  if CLIENT then 
	wept.VElements = {
		["zenith_guard"] = { type = "Model", model = "models/props_vehicles/tire001c_car.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.45, 1.539, -5.2), angle = Angle(-1, 90, 0), size = Vector(0.2, 0.119, 0.119), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_pommel"] = { type = "Model", model = "models/hunter/misc/cone4x2mirrored.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.619, 1.399, 2.9), angle = Angle(6, 0, 0), size = Vector(0.009, 0.009, 0.009), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_guard_spike_small2"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.5, 1.549, -6.25), angle = Angle(145, 0, 0), size = Vector(0.05, 0.025, 0.1), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_guard_spike_small1"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.75, 1.549, -6.25), angle = Angle(-130, 0, 0), size = Vector(0.05, 0.025, 0.1), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_blade"] = { type = "Model", model = "models/xqm/wingtip1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.03, 1.549, -20.085), angle = Angle(6, 0, 90), size = Vector(0.1, 1, 0.85), color = Color(225, 25, 0, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
		["zenith_grip"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.299, 1.5, -3.75), angle = Angle(6, 0, -1), size = Vector(0.449, 0.449, 0.059), color = Color(225, 25, 0, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
		["zenith_guard_spike_large2"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2, 1.524, -5.22), angle = Angle(95, 0, 0), size = Vector(0.075, 0.025, 0.15), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_guard_spike_large1"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5, 1.549, -5), angle = Angle(-85, 0, 0), size = Vector(0.075, 0.025, 0.15), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_cutaway"] = { type = "Model", model = "models/xqm/wingtip1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.75, 1.549, -7.901), angle = Angle(6, 0, -90), size = Vector(0.1, 0.1, 0.85), color = Color(225, 25, 0, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} }
	}
	wept.WElements = {
		["zenith_guard"] = { type = "Model", model = "models/props_vehicles/tire001c_car.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 1.85, -5), angle = Angle(-5, 0, 0), size = Vector(0.2, 0.119, 0.119), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_pommel"] = { type = "Model", model = "models/hunter/misc/cone4x2mirrored.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.75, 1.2, 3.25), angle = Angle(-5.5, 0, -5), size = Vector(0.009, 0.009, 0.009), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_guard_spike_small2"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.95, 0.949, -6.25), angle = Angle(130, -90, 0), size = Vector(0.05, 0.025, 0.1), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_guard_spike_large2"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 0.5, -5.1), angle = Angle(95, -90, -3), size = Vector(0.075, 0.025, 0.15), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_blade"] = { type = "Model", model = "models/xqm/wingtip1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.72, 3.164, -19.66), angle = Angle(5, -90, 85), size = Vector(0.1, 1, 0.85), color = Color(225, 25, 0, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
		["zenith_grip"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.099, 1.75, -3.5), angle = Angle(-5.5, 0, -4.5), size = Vector(0.449, 0.449, 0.059), color = Color(225, 25, 0, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
		["zenith_cutaway"] = { type = "Model", model = "models/xqm/wingtip1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.799, 2.099, -7.5), angle = Angle(-5, 90, -85), size = Vector(0.1, 0.1, 0.85), color = Color(225, 25, 0, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
		["zenith_guard_spike_large1"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 3, -4.901), angle = Angle(-85, -161.111, -74.445), size = Vector(0.075, 0.025, 0.15), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_guard_spike_small1"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.849, 3, -6), angle = Angle(-120, -85, 0), size = Vector(0.05, 0.025, 0.1), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} }
	}
    end
end)
branch.Colors = {Color(214, 46, 4), Color(229, 95, 0), Color(255, 182, 0)}
branch.NewNames = {"Warm", "Hot", "Searing"}

local branch = GAMEMODE:AddNewRemantleBranch(SWEP, 2, "Zenith Blade", "slow zombies down with ice instead of inflicting pulse slow.", function(wept)
	wept.Ice = true
	wept.IceSlowPower = 9
	wept.Pulse = false
	wept.MeleeDamage = wept.MeleeDamage * 0.9

 if CLIENT then
	wept.VElements = {
		["zenith_guard"] = { type = "Model", model = "models/props_vehicles/tire001c_car.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.45, 1.539, -5.2), angle = Angle(-1, 90, 0), size = Vector(0.2, 0.119, 0.119), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_pommel"] = { type = "Model", model = "models/hunter/misc/cone4x2mirrored.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.619, 1.399, 2.9), angle = Angle(6, 0, 0), size = Vector(0.009, 0.009, 0.009), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_guard_spike_small2"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.5, 1.549, -6.25), angle = Angle(145, 0, 0), size = Vector(0.05, 0.025, 0.1), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_guard_spike_large2"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2, 1.524, -5.22), angle = Angle(95, 0, 0), size = Vector(0.075, 0.025, 0.15), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_blade"] = { type = "Model", model = "models/xqm/wingtip1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.03, 1.549, -20.085), angle = Angle(6, 0, 90), size = Vector(0.1, 1, 0.85), color = Color(100, 160, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
		["zenith_grip"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.299, 1.5, -3.75), angle = Angle(6, 0, -1), size = Vector(0.449, 0.449, 0.059), color = Color(100, 160, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
		["zenith_guard_spike_small1"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.75, 1.549, -6.25), angle = Angle(-130, 0, 0), size = Vector(0.05, 0.025, 0.1), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_guard_spike_large1"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5, 1.549, -5), angle = Angle(-85, 0, 0), size = Vector(0.075, 0.025, 0.15), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_cutaway"] = { type = "Model", model = "models/xqm/wingtip1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.75, 1.549, -7.901), angle = Angle(6, 0, -90), size = Vector(0.1, 0.1, 0.85), color = Color(100, 160, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} }
	}
	wept.WElements = {
		["zenith_guard"] = { type = "Model", model = "models/props_vehicles/tire001c_car.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 1.85, -5), angle = Angle(-5, 0, 0), size = Vector(0.2, 0.119, 0.119), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_pommel"] = { type = "Model", model = "models/hunter/misc/cone4x2mirrored.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.75, 1.2, 3.25), angle = Angle(-5.5, 0, -5), size = Vector(0.009, 0.009, 0.009), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_guard_spike_small2"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.95, 0.949, -6.25), angle = Angle(130, -90, 0), size = Vector(0.05, 0.025, 0.1), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_guard_spike_small1"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.849, 3, -6), angle = Angle(-120, -85, 0), size = Vector(0.05, 0.025, 0.1), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_blade"] = { type = "Model", model = "models/xqm/wingtip1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.72, 3.164, -19.66), angle = Angle(5, -90, 85), size = Vector(0.1, 1, 0.85), color = Color(100, 160, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
		["zenith_grip"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.099, 1.75, -3.5), angle = Angle(-5.5, 0, -4.5), size = Vector(0.449, 0.449, 0.059), color = Color(100, 160, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
		["zenith_cutaway"] = { type = "Model", model = "models/xqm/wingtip1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.799, 2.099, -7.5), angle = Angle(-5, 90, -85), size = Vector(0.1, 0.1, 0.85), color = Color(100, 160, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
		["zenith_guard_spike_large1"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 3, -4.901), angle = Angle(-85, -161.111, -74.445), size = Vector(0.075, 0.025, 0.15), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
		["zenith_guard_spike_large2"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 0.5, -5.1), angle = Angle(95, -90, -3), size = Vector(0.075, 0.025, 0.15), color = Color(255, 215, 0, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} }
	}
    end
end)
branch.Colors = {Color(100, 75, 255), Color(120, 165, 255), Color(135, 200, 255)}
branch.NewNames = {"Cold", "Frigid", "Glacial"}

function SWEP:GetTracesNumPlayers(traces)
	local numplayers = 0

	local ent
	for _, trace in pairs(traces) do
		ent = trace.Entity
		if ent and ent:IsValidPlayer() then
			numplayers = numplayers + 1
		end
	end

	return numplayers
end

function SWEP:GetDamage(numplayers, basedamage)
	basedamage = basedamage or self.MeleeDamage

	if numplayers then
		return basedamage * math.Clamp(1.25 - numplayers * 0.25, 0.5, 1)
	end

	return basedamage
end

function SWEP:MeleeSwing()
	local owner = self:GetOwner()

	owner:DoAttackEvent()
	self:SendWeaponAnim(self.MissAnim)
	self.IdleAnimation = CurTime() + self:SequenceDuration()

	local hit = false
	local tr = owner:CompensatedPenetratingMeleeTrace(self.MeleeRange * (owner.MeleeRangeMul or 1), self.MeleeSize)
	local damage = self:GetDamage(self:GetTracesNumPlayers(tr))
	local ent

	local damagemultiplier = owner:Team() == TEAM_HUMAN and owner.MeleeDamageMultiplier or 1 --(owner.BuffMuscular and owner:Team()==TEAM_HUMAN) and 1.2 or 1
	if owner:IsSkillActive(SKILL_LASTSTAND) then
		if owner:Health() <= owner:GetMaxHealth() * 0.25 then
			damagemultiplier = damagemultiplier * 2
		else
			damagemultiplier = damagemultiplier * 0.85
		end
	end
	
	for _, trace in ipairs(tr) do
		if not trace.Hit then continue end

		ent = trace.Entity

		hit = true
		
		local hitflesh = trace.MatType == MAT_FLESH or trace.MatType == MAT_BLOODYFLESH or trace.MatType == MAT_ANTLION or trace.MatType == MAT_ALIENFLESH

		if hitflesh then
			util.Decal(self.BloodDecal, trace.HitPos + trace.HitNormal, trace.HitPos - trace.HitNormal)

			if SERVER then
				self:ServerHitFleshEffects(ent, trace, damagemultiplier)
			end

		end

		if ent and ent:IsValid() then
			
			if SERVER then
				self:ServerMeleeHitEntity(trace, ent, damagemultiplier)
			end

			self:MeleeHitEntity(trace, ent, damagemultiplier, damage)

			if SERVER then
				self:ServerMeleePostHitEntity(trace, ent, damagemultiplier)
			end

			if owner.GlassWeaponShouldBreak then break end
		end
	end

	if hit then
		self:PlayHitSound()
	else
		self:PlaySwingSound()

		if owner.MeleePowerAttackMul and owner.MeleePowerAttackMul > 1 then
			self:SetPowerCombo(0)
		end
	end
end

function SWEP:MeleeHitEntity(tr, hitent, damagemultiplier, damage)
	if not IsFirstTimePredicted() then return end

	local owner = self:GetOwner()

	if SERVER and hitent:IsPlayer() and owner:IsSkillActive(SKILL_GLASSWEAPONS) then
		damagemultiplier = damagemultiplier * 3.5
		owner.GlassWeaponShouldBreak = not owner.GlassWeaponShouldBreak
	end

	damage = damage * damagemultiplier

	local dmginfo = DamageInfo()
	dmginfo:SetDamagePosition(tr.HitPos)
	dmginfo:SetAttacker(owner)
	dmginfo:SetDamageType(self.DamageType)
	dmginfo:SetInflictor(self)
	dmginfo:SetDamage(damage)
	dmginfo:SetDamageForce(math.min(self.MeleeDamage, 50) * 50 * owner:GetAimVector())

	local vel
	if hitent:IsPlayer() then

		if owner.MeleePowerAttackMul and owner.MeleePowerAttackMul > 1 then
			self:SetPowerCombo(self:GetPowerCombo() + 1)

			damage = damage + damage * (owner.MeleePowerAttackMul - 1) * (self:GetPowerCombo()/4)
			dmginfo:SetDamage(damage)

			if self:GetPowerCombo() >= 4 then
				self:SetPowerCombo(0)
				if SERVER then
					local pitch = math.Clamp(math.random(90, 110) + 15 * (1 - damage/45), 50 , 200)
					owner:EmitSound("npc/strider/strider_skewer1.wav", 75, pitch)
				end
			end
		end

		hitent:MeleeViewPunch(damage)
		if hitent:IsHeadcrab() then
			damage = damage * 2
			dmginfo:SetDamage(damage)
		end

		if SERVER then
			hitent:SetLastHitGroup(tr.HitGroup)
			if tr.HitGroup == HITGROUP_HEAD then
				hitent:SetWasHitInHead()
			end

			if hitent:WouldDieFrom(damage, tr.HitPos) then
				dmginfo:SetDamageForce(math.min(self.MeleeDamage, 50) * 400 * owner:GetAimVector())
			end
		end

		vel = hitent:GetVelocity()
	else
		if owner.MeleePowerAttackMul and owner.MeleePowerAttackMul > 1 then
			self:SetPowerCombo(0)
		end
	end

	--if not hitent.LastHeld or CurTime() >= hitent.LastHeld + 0.1 then -- Don't allow people to shoot props out of their hands
		if self.PointsMultiplier then
			POINTSMULTIPLIER = self.PointsMultiplier
		end

		hitent:DispatchTraceAttack(dmginfo, tr, owner:GetAimVector())

		if self.PointsMultiplier then
			POINTSMULTIPLIER = nil
		end

		-- Invalidate the engine knockback vs. players
		if vel then
			hitent:SetLocalVelocity(vel)
		end
	--end

	-- Perform our own knockback vs. players
	if hitent:IsPlayer() then
		local knockback = self.MeleeKnockBack * (owner.MeleeKnockbackMultiplier or 1)
		if knockback > 0 then
			hitent:ThrowFromPositionSetZ(tr.StartPos, knockback, nil, true)
		end

		if owner.MeleeLegDamageAdd and owner.MeleeLegDamageAdd > 0 then
			hitent:AddLegDamage(owner.MeleeLegDamageAdd)
		end
	end

	local owner = self:GetOwner()
	if not owner:IsValidLivingHuman() then owner = self end

   if SERVER then 
	 if hitent then
		 local target = hitent
		 local shocked = {}
		 
		 if target then
			 shocked[target] = true
			 for i = 1, 3 do
				 local tpos = target:WorldSpaceCenter()
 
				 for k, ent in pairs(ents.FindInSphere(tpos, 120)) do
					 if not shocked[ent] and ent:IsValidLivingZombie() and not ent:GetZombieClassTable().NeverAlive then
						 if WorldVisible(tpos, ent:NearestPoint(tpos)) then
							 shocked[ent] = true
							 target = ent
 
							 timer.Simple(i * 0.07, function()
								 if not ent:IsValid() or not ent:IsValidLivingZombie() or not WorldVisible(tpos, ent:NearestPoint(tpos)) then return end
 
								 target:TakeSpecialDamage(self.MeleeDamage * 0.55, DMG_DISSOLVE, owner, owner:GetActiveWeapon())
 
								 if self.Burn and not target:IsOnFire() then
									local fire = target:GiveStatus("human_fire")
									if fire and fire:IsValid() then
										fire:AddDamage(self.BurnDamage)
										fire.Damager = owner
									end
								end
								if self.Ice then
									target:AddLegDamageExt(4, owner, self, SLOWTYPE_COLD)
								end

								if self.Pulse then
									target:AddLegDamageExt(4, owner, self, SLOWTYPE_PULSE)
								end
 
								 local worldspace = ent:WorldSpaceCenter()
								 effectdata = EffectData()
									 effectdata:SetOrigin(worldspace)
									 effectdata:SetStart(tpos)
									 effectdata:SetEntity(target)
								 util.Effect("tracer_zapper", effectdata)
							 end)
 
							 break
						 end
					 end
				 end
			 end
		 end
	 end
 end
 
	 local effectdata = EffectData()
	 effectdata:SetOrigin(tr.HitPos)
	 effectdata:SetStart(tr.StartPos)
	 effectdata:SetNormal(tr.HitNormal)
	 util.Effect("RagdollImpact", effectdata)
	 if not tr.HitSky then
		 effectdata:SetSurfaceProp(tr.SurfaceProps)
		 effectdata:SetHitBox(tr.HitBox)
		 effectdata:SetEntity(hitent)
		 util.Effect("Impact", effectdata)
	 end
 end	