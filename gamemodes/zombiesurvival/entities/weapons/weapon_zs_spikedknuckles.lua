AddCSLuaFile()

SWEP.Base = "weapon_zs_fists"

SWEP.PrintName = "Spiked Knuckles"
SWEP.Description = "A pair of Spiked brass knuckles used to concentrate strikes from one's fists, increasing the damage done, while keeping their movement speed up."

if CLIENT then
	SWEP.ViewModelFOV = 55
	SWEP.ViewModelFlip = false

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

	SWEP.VElements = {
		["left_spike_1"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(4.5, 1.25, -1.5499999523163), angle = Angle(-90, 0, 0), size = Vector(0.019999999552965, 0.019999999552965, 0.050000000745058), color = Color(215, 175, 55, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["left_spike_2"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(4.5, 1.25, -0.60000002384186), angle = Angle(-90, 0, 0), size = Vector(0.019999999552965, 0.019999999552965, 0.050000000745058), color = Color(215, 175, 55, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["left_spike_3"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(4.5, 1.25, 0.44999998807907), angle = Angle(-90, 0, 0), size = Vector(0.019999999552965, 0.019999999552965, 0.050000000745058), color = Color(215, 175, 55, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["left_spike_4"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(4.5, 1.25, 1.4500000476837), angle = Angle(-90, 0, 0), size = Vector(0.019999999552965, 0.019999999552965, 0.050000000745058), color = Color(215, 175, 55, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["right_spike_1"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.5, 1.25, -1.5499999523163), angle = Angle(-90, 0, 0), size = Vector(0.019999999552965, 0.019999999552965, 0.050000000745058), color = Color(215, 175, 55, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["right_spike_2"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.5, 1.25, -0.60000002384186), angle = Angle(-90, 0, 0), size = Vector(0.019999999552965, 0.019999999552965, 0.050000000745058), color = Color(215, 175, 55, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["right_spike_3"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.5, 1.25, 0.44999998807907), angle = Angle(-90, 0, 0), size = Vector(0.019999999552965, 0.019999999552965, 0.050000000745058), color = Color(215, 175, 55, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["right_spike_4"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.5, 1.25, 1.4500000476837), angle = Angle(-90, 0, 0), size = Vector(0.019999999552965, 0.019999999552965, 0.050000000745058), color = Color(215, 175, 55, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["spiked_knuckles_left"] = { type = "Model", model = "models/props_c17/utilityconnecter005.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(3.7000000476837, 1.2000000476837, 0), angle = Angle(0, 90, 90), size = Vector(0.40000000596046, 0.5, 0.40000000596046), color = Color(215, 175, 55, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["spiked_knuckles_right"] = { type = "Model", model = "models/props_c17/utilityconnecter005.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.7000000476837, 1.2000000476837, 0), angle = Angle(0, 90, 90), size = Vector(0.40000000596046, 0.5, 0.40000000596046), color = Color(215, 175, 55, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["left_spike_1"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(4.5, 1.25, -1.5499999523163), angle = Angle(-90, 0, 0), size = Vector(0.019999999552965, 0.019999999552965, 0.050000000745058), color = Color(215, 175, 55, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["left_spike_2"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(4.5, 1.25, -0.60000002384186), angle = Angle(-90, 0, 0), size = Vector(0.019999999552965, 0.019999999552965, 0.050000000745058), color = Color(215, 175, 55, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["left_spike_3"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(4.5, 1.25, 0.44999998807907), angle = Angle(-90, 0, 0), size = Vector(0.019999999552965, 0.019999999552965, 0.050000000745058), color = Color(215, 175, 55, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["left_spike_4"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(4.5, 1.25, 1.4500000476837), angle = Angle(-90, 0, 0), size = Vector(0.019999999552965, 0.019999999552965, 0.050000000745058), color = Color(215, 175, 55, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["right_spike_1"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.5, 1.25, -1.5499999523163), angle = Angle(-90, 0, 0), size = Vector(0.019999999552965, 0.019999999552965, 0.050000000745058), color = Color(215, 175, 55, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["right_spike_2"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.5, 1.25, -0.60000002384186), angle = Angle(-90, 0, 0), size = Vector(0.019999999552965, 0.019999999552965, 0.050000000745058), color = Color(215, 175, 55, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["right_spike_3"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.5, 1.25, 0.44999998807907), angle = Angle(-90, 0, 0), size = Vector(0.019999999552965, 0.019999999552965, 0.050000000745058), color = Color(215, 175, 55, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["right_spike_4"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.5, 1.25, 1.4500000476837), angle = Angle(-90, 0, 0), size = Vector(0.019999999552965, 0.019999999552965, 0.050000000745058), color = Color(215, 175, 55, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["spiked_knuckles_left"] = { type = "Model", model = "models/props_c17/utilityconnecter005.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(3.7000000476837, 1.2000000476837, 0), angle = Angle(0, 90, 90), size = Vector(0.40000000596046, 0.5, 0.40000000596046), color = Color(215, 175, 55, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["spiked_knuckles_right"] = { type = "Model", model = "models/props_c17/utilityconnecter005.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.7000000476837, 1.2000000476837, 0), angle = Angle(0, 90, 90), size = Vector(0.40000000596046, 0.5, 0.40000000596046), color = Color(215, 175, 55, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} }
	}
end

SWEP.WalkSpeed = SPEED_FASTEST

SWEP.ViewModel = "models/weapons/c_arms_citizen.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"

SWEP.Weight = 4

SWEP.MeleeDamage = 28
SWEP.Tier = 3

SWEP.Unarmed = false

SWEP.Undroppable = false
SWEP.NoPickupNotification = false
SWEP.NoDismantle = false

SWEP.NoGlassWeapons = false

SWEP.AllowQualityWeapons = true

SWEP.Bleed = true
SWEP.BleedDamage = 7

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.06)
