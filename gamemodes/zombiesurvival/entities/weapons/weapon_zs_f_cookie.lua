AddCSLuaFile()

SWEP.Base = "weapon_zs_basefood"

SWEP.PrintName = "Cookie"

if CLIENT then
	SWEP.VElements = {
		["chip1"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "cookie1", pos = Vector(0.2, 0.5, 0), angle = Angle(-55, 85, 90), size = Vector(0.075, 0.05, 0.025), color = Color(91, 67, 0, 255), surpresslightning = false, material = "phoenix_storms/fender_white", skin = 0, bodygroup = {} },
		["chip2"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "cookie1", pos = Vector(0.2, -1.5, 0.5), angle = Angle(-25, 92, 90), size = Vector(0.075, 0.075, 0.025), color = Color(91, 67, 0, 255), surpresslightning = false, material = "phoenix_storms/fender_white", skin = 0, bodygroup = {} },
		["chip3"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "cookie1", pos = Vector(0.2, 0.25, 1.75), angle = Angle(-25, 100, 90), size = Vector(0.05, 0.025, 0.025), color = Color(91, 67, 0, 255), surpresslightning = false, material = "phoenix_storms/fender_white", skin = 0, bodygroup = {} },
		["chip4"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "cookie1", pos = Vector(0.2, 0, -2), angle = Angle(92, 100, 90), size = Vector(0.05, 0.05, 0.025), color = Color(91, 67, 0, 255), surpresslightning = false, material = "phoenix_storms/fender_white", skin = 0, bodygroup = {} },
		["chip5"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "cookie1", pos = Vector(0.2, 1.75, -0.5), angle = Angle(5, 90, 90), size = Vector(0.02, 0.06, 0.025), color = Color(91, 67, 0, 255), surpresslightning = false, material = "phoenix_storms/fender_white", skin = 0, bodygroup = {} },
		["chip6"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "cookie1", pos = Vector(0.2, -1.25, -1), angle = Angle(0, 115, 85), size = Vector(0.04, 0.08, 0.025), color = Color(91, 67, 0, 255), surpresslightning = false, material = "phoenix_storms/fender_white", skin = 0, bodygroup = {} },
		["cookie1"] = { type = "Model", model = "models/props_trainstation/trainstation_clock001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 4, -3), angle = Angle(-150, 0, 0), size = Vector(0.1, 0.1, 0.1), color = Color(189, 140, 97, 255), surpresslightning = false, material = "phoenix_storms/fender_white", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["chip1"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "cookie1", pos = Vector(0.2, 0.5, 0), angle = Angle(-55, 85, 90), size = Vector(0.075, 0.05, 0.025), color = Color(91, 67, 0, 255), surpresslightning = false, material = "phoenix_storms/fender_white", skin = 0, bodygroup = {} },
		["chip2"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "cookie1", pos = Vector(0.2, -1.5, 0.5), angle = Angle(-25, 92, 90), size = Vector(0.075, 0.075, 0.025), color = Color(91, 67, 0, 255), surpresslightning = false, material = "phoenix_storms/fender_white", skin = 0, bodygroup = {} },
		["chip3"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "cookie1", pos = Vector(0.2, 0.25, 1.75), angle = Angle(-25, 100, 90), size = Vector(0.05, 0.025, 0.025), color = Color(91, 67, 0, 255), surpresslightning = false, material = "phoenix_storms/fender_white", skin = 0, bodygroup = {} },
		["chip4"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "cookie1", pos = Vector(0.2, 0, -2), angle = Angle(92, 100, 90), size = Vector(0.05, 0.05, 0.025), color = Color(91, 67, 0, 255), surpresslightning = false, material = "phoenix_storms/fender_white", skin = 0, bodygroup = {} },
		["chip5"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "cookie1", pos = Vector(0.2, 1.75, -0.5), angle = Angle(5, 90, 90), size = Vector(0.02, 0.06, 0.025), color = Color(91, 67, 0, 255), surpresslightning = false, material = "phoenix_storms/fender_white", skin = 0, bodygroup = {} },
		["chip6"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "cookie1", pos = Vector(0.2, -1.25, -1), angle = Angle(0, 115, 85), size = Vector(0.04, 0.08, 0.025), color = Color(91, 67, 0, 255), surpresslightning = false, material = "phoenix_storms/fender_white", skin = 0, bodygroup = {} },
		["cookie1"] = { type = "Model", model = "models/props_trainstation/trainstation_clock001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 4, -3), angle = Angle(-150, 0, 0), size = Vector(0.1, 0.1, 0.1), color = Color(189, 140, 97, 255), surpresslightning = false, material = "phoenix_storms/fender_white", skin = 0, bodygroup = {} }
	}
end

SWEP.ViewModel = "models/weapons/c_grenade.mdl"
SWEP.WorldModel = "models/weapons/w_grenade.mdl"
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false

SWEP.Primary.Ammo = "foodcookie"

SWEP.FoodHealth = 20
SWEP.FoodEatTime = 3.5
