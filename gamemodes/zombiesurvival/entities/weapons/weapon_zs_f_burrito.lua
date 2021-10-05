AddCSLuaFile()

SWEP.Base = "weapon_zs_basefood"

SWEP.PrintName = "Burrito"

if CLIENT then
	SWEP.ViewModelBoneMods = {
		["ValveBiped.Bip01_R_Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 59, 0) },
	}

	SWEP.VElements = {
		["burrito1"] = { type = "Model", model = "models/props_junk/garbage_metalcan002a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.25, 2.5, -1.5), angle = Angle(180, 0, 0), size = Vector(0.4, 0.6, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/egg", skin = 0, bodygroup = {} },
		["burrito2"] = { type = "Model", model = "models/props_junk/garbage_metalcan002a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "burrito1", pos = Vector(0, 0, 1.5), angle = Angle(180, 90, 0), size = Vector(0.5, 0.3, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/fender_wood", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["burrito1"] = { type = "Model", model = "models/props_junk/garbage_metalcan002a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.25, 2.5, -1.5), angle = Angle(180, 0, 0), size = Vector(0.4, 0.6, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/egg", skin = 0, bodygroup = {} },
		["burrito2"] = { type = "Model", model = "models/props_junk/garbage_metalcan002a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "burrito1", pos = Vector(0, 0, 1.5), angle = Angle(180, 90, 0), size = Vector(0.5, 0.3, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/fender_wood", skin = 0, bodygroup = {} }
	}
end

SWEP.ViewModel = "models/weapons/c_grenade.mdl"
SWEP.WorldModel = "models/weapons/w_grenade.mdl"
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false

SWEP.Primary.Ammo = "foodburrito"

SWEP.FoodHealth = 10
SWEP.FoodEatTime = 2.5
