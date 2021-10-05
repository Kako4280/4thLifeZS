AddCSLuaFile()

SWEP.Base = "weapon_zs_basefood"

SWEP.PrintName = "Coffee"

if CLIENT then
	SWEP.ViewModelBoneMods = {
		["ValveBiped.Bip01_R_Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 59, 0) },
	}

	SWEP.VElements = {
		["coffee"] = { type = "Model", model = "models/props_junk/garbage_coffeemug001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.5, 3, -1), angle = Angle(180, -155, 0), size = Vector(0.69999998807907, 0.69999998807907, 0.69999998807907), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["coffee"] = { type = "Model", model = "models/props_junk/garbage_coffeemug001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.5, 3, -0.5), angle = Angle(170, -155, 0), size = Vector(0.69999998807907, 0.69999998807907, 0.69999998807907), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}	
end

SWEP.ViewModel = "models/weapons/c_grenade.mdl"
SWEP.WorldModel = "models/props_junk/garbage_coffeemug001a.mdl"

SWEP.Primary.Ammo = "foodcoffee"

SWEP.FoodHealth = 7
SWEP.FoodEatTime = 2
SWEP.FoodIsLiquid = true
