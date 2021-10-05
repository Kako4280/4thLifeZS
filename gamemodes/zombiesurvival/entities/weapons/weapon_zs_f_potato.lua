AddCSLuaFile()

SWEP.Base = "weapon_zs_basefood"

SWEP.PrintName = "Potato"

if CLIENT then
	SWEP.ViewModelBoneMods = {
		["ValveBiped.Bip01_R_Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 59, 0) },
	}
	
	SWEP.VElements = {
		["potato"] = { type = "Model", model = "models/props_phx/misc/potato.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.5, 3.5, -0.5), angle = Angle(0, -45, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["potato"] = { type = "Model", model = "models/props_phx/misc/potato.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.5, 3.5, -0.5), angle = Angle(0, -45, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.ViewModel = "models/weapons/c_grenade.mdl"
SWEP.WorldModel = "models/weapons/w_grenade.mdl"
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false

SWEP.Primary.Ammo = "foodpotato"

SWEP.FoodHealth = 5
SWEP.FoodEatTime = 1.4
