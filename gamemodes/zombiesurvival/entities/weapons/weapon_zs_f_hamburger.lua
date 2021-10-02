AddCSLuaFile()

SWEP.Base = "weapon_zs_basefood"

SWEP.PrintName = "Hamburger"

if CLIENT then
	SWEP.ViewModelBoneMods = {
	["ValveBiped.Grenade_body"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(2.036, 0, 0), angle = Angle(-18.889, 0, 36.666) },
	["ValveBiped.Bip01_Spine4"] = { scale = Vector(1, 1, 1), pos = Vector(-6.112, -1.668, 1.667), angle = Angle(0, 0, 0) }
	}

	SWEP.VElements = {
	["hamburger"] = { type = "Model", model = "models/food/burger.mdl", bone = "ValveBiped.Grenade_body", rel = "", pos = Vector(8.831, 2.596, -1.558), angle = Angle(87.662, -5.844, 3.506), size = Vector(0.82, 0.82, 0.82), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}

	SWEP.WElements = {
	["hamburger"] = { type = "Model", model = "models/food/burger.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.557, 11.947, 1.557), angle = Angle(-139.092, 157.792, 82.986), size = Vector(0.755, 0.755, 0.755), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.ViewModel = "models/weapons/c_grenade.mdl"
SWEP.WorldModel = "models/food/burger.mdl"

SWEP.Primary.Ammo = "foodhamburger"

SWEP.FoodHealth = 15
SWEP.FoodEatTime = 4