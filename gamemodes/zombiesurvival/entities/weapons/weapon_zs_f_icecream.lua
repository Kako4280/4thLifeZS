AddCSLuaFile()

SWEP.Base = "weapon_zs_basefood"

SWEP.PrintName = "Ice Cream"

if CLIENT then
	SWEP.ViewModelBoneMods = {
		["ValveBiped.Bip01_R_Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 59, 0) },
	}
	
	SWEP.VElements = {
		["ice cream1"] = { type = "Model", model = "models/props_junk/terracotta01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.9, 2.5, 1), angle = Angle(180, 0, 0), size = Vector(0.175, 0.175, 0.4), color = Color(255, 219, 150, 255), surpresslightning = false, material = "phoenix_storms/trains/track_plate", skin = 0, bodygroup = {} },
		["ice cream2"] = { type = "Model", model = "models/hunter/misc/sphere075x075.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "ice cream1", pos = Vector(-0.15, 0, 6.25), angle = Angle(0, 0, 0), size = Vector(0.1, 0.1, 0.1), color = Color(255, 225, 174, 255), surpresslightning = false, material = "phoenix_storms/white_chrome", skin = 0, bodygroup = {} },
		["ice cream3"] = { type = "Model", model = "models/hunter/misc/sphere075x075.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "ice cream1", pos = Vector(-0.5, -0.25, 8.5), angle = Angle(0, 0, 0), size = Vector(0.075, 0.075, 0.075), color = Color(255, 174, 234, 255), surpresslightning = false, material = "phoenix_storms/white_chrome", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["ice cream1"] = { type = "Model", model = "models/props_junk/terracotta01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.9, 2.5, 1), angle = Angle(180, 0, 0), size = Vector(0.175, 0.175, 0.4), color = Color(255, 219, 150, 255), surpresslightning = false, material = "phoenix_storms/trains/track_plate", skin = 0, bodygroup = {} },
		["ice cream2"] = { type = "Model", model = "models/hunter/misc/sphere075x075.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "ice cream1", pos = Vector(-0.15, 0, 6.25), angle = Angle(0, 0, 0), size = Vector(0.1, 0.1, 0.1), color = Color(255, 225, 174, 255), surpresslightning = false, material = "phoenix_storms/white_chrome", skin = 0, bodygroup = {} },
		["ice cream3"] = { type = "Model", model = "models/hunter/misc/sphere075x075.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "ice cream1", pos = Vector(-0.5, -0.25, 8.5), angle = Angle(0, 0, 0), size = Vector(0.075, 0.075, 0.075), color = Color(255, 174, 234, 255), surpresslightning = false, material = "phoenix_storms/white_chrome", skin = 0, bodygroup = {} }
	}
end

SWEP.ViewModel = "models/weapons/c_grenade.mdl"
SWEP.WorldModel = "models/weapons/w_grenade.mdl"
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false

SWEP.Primary.Ammo = "foodicecream"

SWEP.FoodHealth = 12
SWEP.FoodEatTime = 3
