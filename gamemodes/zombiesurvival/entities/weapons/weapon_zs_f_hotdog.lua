AddCSLuaFile()

SWEP.Base = "weapon_zs_basefood"

SWEP.PrintName = "Hotdog"

if CLIENT then
	SWEP.ViewModelBoneMods = {
	["ValveBiped.Grenade_body"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(2.036, 0, 0), angle = Angle(-18.889, 0, 36.666) },
	["ValveBiped.Bip01_Spine4"] = { scale = Vector(1, 1, 1), pos = Vector(-6.112, -1.668, 1.667), angle = Angle(0, 0, 0) }
	}

	SWEP.VElements = {
	["models/food/hotdog.mdl"] = { type = "Model", model = "models/food/hotdog.mdl", bone = "ValveBiped.Grenade_body", rel = "", pos = Vector(8.831, 2.596, 2.596), angle = Angle(108.7, -8.183, 3.506), size = Vector(0.82, 0.82, 0.82), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}

	SWEP.WElements = {
	["models/food/hotdog.mdl"] = { type = "Model", model = "models/food/hotdog.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(0.518, -6.753, -3.636), angle = Angle(-66.624, -19.871, 40.909), size = Vector(0.755, 0.755, 0.755), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.ViewModel = "models/weapons/c_grenade.mdl"
SWEP.WorldModel = "models/food/hotdog.mdl"

SWEP.Primary.Ammo = "foodhotdog"

SWEP.FoodHealth = 12
SWEP.FoodEatTime = 2