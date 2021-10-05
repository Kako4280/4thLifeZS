AddCSLuaFile()

SWEP.Base = "weapon_zs_basefood"

SWEP.PrintName = "Taco"

if CLIENT then
	SWEP.ViewModelBoneMods = {
		["ValveBiped.Bip01_R_Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 59, 0) },
	}
	
	SWEP.VElements = {
		["taco1"] = { type = "Model", model = "models/hunter/tubes/circle2x2c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.5, 3.5, -1.5), angle = Angle(28.024, -90, 90), size = Vector(0.04, 0.05, 0.05), color = Color(246, 201, 92, 255), surpresslightning = false, material = "phoenix_storms/roadside", skin = 0, bodygroup = {} },
		["taco2"] = { type = "Model", model = "models/hunter/tubes/circle2x2c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "taco1", pos = Vector(0, 0, 2.23), angle = Angle(0, 0, 0), size = Vector(0.04, 0.05, 0.05), color = Color(246, 201, 92, 255), surpresslightning = false, material = "phoenix_storms/roadside", skin = 0, bodygroup = {} },
		["taco3"] = { type = "Model", model = "models/hunter/tubes/tube1x1x2c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "taco1", pos = Vector(0, -2.37, 1.11), angle = Angle(180, 0, 90), size = Vector(0.05, 0.05, 0.05), color = Color(246, 201, 92, 255), surpresslightning = false, material = "phoenix_storms/roadside", skin = 0, bodygroup = {} },
		["taco4"] = { type = "Model", model = "models/props_junk/garbage128_composite001c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "taco1", pos = Vector(0.5, 0, 1.25), angle = Angle(90, 0, 0), size = Vector(0.05, 0.04, 0.1), color = Color(91, 67, 0, 255), surpresslightning = false, material = "phoenix_storms/road", skin = 0, bodygroup = {} },
		["taco5"] = { type = "Model", model = "models/props_junk/garbage256_composite001b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "taco1", pos = Vector(0.5, 0, 1.35), angle = Angle(90, 90, 90), size = Vector(0.02, 0.015, 0.02), color = Color(255, 255, 0, 255), surpresslightning = false, material = "phoenix_storms/white_chrome", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["taco1"] = { type = "Model", model = "models/hunter/tubes/circle2x2c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.5, 3.5, -1.5), angle = Angle(28.024, -90, 90), size = Vector(0.04, 0.05, 0.05), color = Color(246, 201, 92, 255), surpresslightning = false, material = "phoenix_storms/roadside", skin = 0, bodygroup = {} },
		["taco2"] = { type = "Model", model = "models/hunter/tubes/circle2x2c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "taco1", pos = Vector(0, 0, 2.23), angle = Angle(0, 0, 0), size = Vector(0.04, 0.05, 0.05), color = Color(246, 201, 92, 255), surpresslightning = false, material = "phoenix_storms/roadside", skin = 0, bodygroup = {} },
		["taco3"] = { type = "Model", model = "models/hunter/tubes/tube1x1x2c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "taco1", pos = Vector(0, -2.37, 1.11), angle = Angle(180, 0, 90), size = Vector(0.05, 0.05, 0.05), color = Color(246, 201, 92, 255), surpresslightning = false, material = "phoenix_storms/roadside", skin = 0, bodygroup = {} },
		["taco4"] = { type = "Model", model = "models/props_junk/garbage128_composite001c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "taco1", pos = Vector(0.5, 0, 1.25), angle = Angle(90, 0, 0), size = Vector(0.05, 0.04, 0.1), color = Color(91, 67, 0, 255), surpresslightning = false, material = "phoenix_storms/road", skin = 0, bodygroup = {} },
		["taco5"] = { type = "Model", model = "models/props_junk/garbage256_composite001b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "taco1", pos = Vector(0.5, 0, 1.35), angle = Angle(90, 90, 90), size = Vector(0.02, 0.015, 0.02), color = Color(255, 255, 0, 255), surpresslightning = false, material = "phoenix_storms/white_chrome", skin = 0, bodygroup = {} }
	}
end

SWEP.ViewModel = "models/weapons/c_grenade.mdl"
SWEP.WorldModel = "models/weapons/w_grenade.mdl"
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false

SWEP.Primary.Ammo = "foodtaco"

SWEP.FoodHealth = 20
SWEP.FoodEatTime = 5
