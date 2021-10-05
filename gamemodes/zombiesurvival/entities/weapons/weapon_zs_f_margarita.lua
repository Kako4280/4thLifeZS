AddCSLuaFile()

SWEP.Base = "weapon_zs_basefood"

SWEP.PrintName = "Margarita"

if CLIENT then
	SWEP.ViewModelBoneMods = {
		["ValveBiped.Bip01_R_Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 59, 0) },
	}
	
	SWEP.VElements = {
		["margarita1"] = { type = "Model", model = "models/props_phx/construct/glass/glass_curve360x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.4, 2.9, -2.5), angle = Angle(0, 0, 0), size = Vector(0.035, 0.035, 0.07), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["margarita2"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "margarita1", pos = Vector(0, 0, 3.2), angle = Angle(0, 0, 0), size = Vector(0.035, 0.035, 0.035), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/glass", skin = 0, bodygroup = {} },
		["margarita3"] = { type = "Model", model = "models/xqm/cylinderx1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "margarita1", pos = Vector(0, 0, 2), angle = Angle(90, 0, 0), size = Vector(0.2, 0.26, 0.26), color = Color(196, 255, 134, 200), surpresslightning = false, material = "phoenix_storms/white_chrome", skin = 0, bodygroup = {} },
		["margarita4"] = { type = "Model", model = "models/props_phx/construct/wood/wood_curve360x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "margarita1", pos = Vector(0, 0, -0.04), angle = Angle(0, 0, 0), size = Vector(0.035, 0.035, 0.001), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/player/shared/ice_player", skin = 0, bodygroup = {} },
		["margarita5"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "margarita1", pos = Vector(0, -1.6, -0.25), angle = Angle(90, 0, 0), size = Vector(0.02, 0.02, 0.02), color = Color(125, 255, 125, 255), surpresslightning = false, material = "phoenix_storms/white_brushes", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["margarita1"] = { type = "Model", model = "models/props_phx/construct/glass/glass_curve360x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.4, 2.9, -2.5), angle = Angle(0, 0, 0), size = Vector(0.035, 0.035, 0.07), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["margarita2"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "margarita1", pos = Vector(0, 0, 3.2), angle = Angle(0, 0, 0), size = Vector(0.035, 0.035, 0.035), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/glass", skin = 0, bodygroup = {} },
		["margarita3"] = { type = "Model", model = "models/xqm/cylinderx1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "margarita1", pos = Vector(0, 0, 2), angle = Angle(90, 0, 0), size = Vector(0.2, 0.26, 0.26), color = Color(196, 255, 134, 200), surpresslightning = false, material = "phoenix_storms/white_chrome", skin = 0, bodygroup = {} },
		["margarita4"] = { type = "Model", model = "models/props_phx/construct/wood/wood_curve360x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "margarita1", pos = Vector(0, 0, -0.04), angle = Angle(0, 0, 0), size = Vector(0.035, 0.035, 0.001), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/player/shared/ice_player", skin = 0, bodygroup = {} },
		["margarita5"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "margarita1", pos = Vector(0, -1.6, -0.25), angle = Angle(90, 0, 0), size = Vector(0.02, 0.02, 0.02), color = Color(125, 255, 125, 255), surpresslightning = false, material = "phoenix_storms/white_brushes", skin = 0, bodygroup = {} }
	}
end

SWEP.ViewModel = "models/weapons/c_grenade.mdl"
SWEP.WorldModel = "models/weapons/w_grenade.mdl"
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false

SWEP.Primary.Ammo = "foodmargarita"

SWEP.FoodHealth = 15
SWEP.FoodEatTime = 4
SWEP.FoodIsLiquid = true
