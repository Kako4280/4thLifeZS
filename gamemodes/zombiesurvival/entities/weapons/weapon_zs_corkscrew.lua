AddCSLuaFile()

SWEP.Base = "weapon_zs_fists"

SWEP.PrintName = "Corkscrew"
SWEP.Description = "IT'S A CORKSCREW."

if CLIENT then
	SWEP.ViewModelFOV = 55
	SWEP.ViewModelFlip = false

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

	SWEP.VElements = {
		["corkscrew_base2_left"] = { type = "Model", model = "models/xqm/cylinderx1large.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "corkscrew_base_left", pos = Vector(0, 1, 0), angle = Angle(0, 90, 0), size = Vector(0.045, 0.005, 0.005), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
		["corkscrew_base_left"] = { type = "Model", model = "models/xqm/cylinderx1large.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(3, 1, -0.25), angle = Angle(100, 90, 0), size = Vector(0.1, 0.015, 0.015), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/white_brushes", skin = 0, bodygroup = {} },
		["corkscrew_base_right"] = { type = "Model", model = "models/xqm/cylinderx1large.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 1, 0), angle = Angle(85, 180, 0), size = Vector(0.1, 0.015, 0.015), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/white_brushes", skin = 0, bodygroup = {} },
		["corkscrew_base_right2"] = { type = "Model", model = "models/xqm/cylinderx1large.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "corkscrew_base_right", pos = Vector(0, 0, 1), angle = Angle(-90, 0, 0), size = Vector(0.045, 0.005, 0.005), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
		["corkscrew_helix1_left"] = { type = "Model", model = "models/xqm/coastertrack/special_helix_middle_full_4.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "corkscrew_base_left", pos = Vector(0, 2, 0), angle = Angle(30, 180, 90), size = Vector(0.001, 0.001, 0.002), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
		["corkscrew_helix1_right"] = { type = "Model", model = "models/xqm/coastertrack/special_helix_middle_full_4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "corkscrew_base_right", pos = Vector(0, 0, 1.45), angle = Angle(0, 0, 0), size = Vector(0.001, 0.001, 0.002), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
		["corkscrew_helix2_left"] = { type = "Model", model = "models/xqm/coastertrack/special_helix_middle_full_4.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "corkscrew_base_left", pos = Vector(0, 2.47, 0), angle = Angle(30, 180, 90), size = Vector(0.001, 0.001, 0.002), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
		["corkscrew_helix2_right"] = { type = "Model", model = "models/xqm/coastertrack/special_helix_middle_full_4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "corkscrew_base_right", pos = Vector(0, 0, 1.92), angle = Angle(0, 0, 0), size = Vector(0.001, 0.001, 0.002), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
		["corkscrew_helix3_left"] = { type = "Model", model = "models/xqm/coastertrack/special_helix_middle_full_4.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "corkscrew_base_left", pos = Vector(0, 2.94, 0), angle = Angle(30, 180, 90), size = Vector(0.001, 0.001, 0.002), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
		["corkscrew_helix3_right"] = { type = "Model", model = "models/xqm/coastertrack/special_helix_middle_full_4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "corkscrew_base_right", pos = Vector(0, 0, 2.39), angle = Angle(0, 0, 0), size = Vector(0.001, 0.001, 0.002), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
		["corkscrew_helix4_left"] = { type = "Model", model = "models/xqm/coastertrack/special_helix_middle_full_4.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "corkscrew_base_left", pos = Vector(0, 3.41, 0), angle = Angle(30, 180, 90), size = Vector(0.001, 0.001, 0.002), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
		["corkscrew_helix4_right"] = { type = "Model", model = "models/xqm/coastertrack/special_helix_middle_full_4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "corkscrew_base_right", pos = Vector(0, 0, 2.86), angle = Angle(0, 0, 0), size = Vector(0.001, 0.001, 0.002), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
		["corkscrew_helix5_left"] = { type = "Model", model = "models/xqm/coastertrack/special_helix_middle_full_4.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "corkscrew_base_left", pos = Vector(0, 3.88, 0), angle = Angle(30, 180, 90), size = Vector(0.001, 0.001, 0.002), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
		["corkscrew_helix5_right"] = { type = "Model", model = "models/xqm/coastertrack/special_helix_middle_full_4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "corkscrew_base_right", pos = Vector(0, 0, 3.33), angle = Angle(0, 0, 0), size = Vector(0.001, 0.001, 0.002), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["corkscrew_base2_left"] = { type = "Model", model = "models/xqm/cylinderx1large.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "corkscrew_base_left", pos = Vector(0, 1, 0), angle = Angle(0, 90, 0), size = Vector(0.045, 0.005, 0.005), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
		["corkscrew_base_left"] = { type = "Model", model = "models/xqm/cylinderx1large.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(3, 1, -0.25), angle = Angle(100, 90, 0), size = Vector(0.1, 0.015, 0.015), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/white_brushes", skin = 0, bodygroup = {} },
		["corkscrew_base_right"] = { type = "Model", model = "models/xqm/cylinderx1large.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 1, 0), angle = Angle(85, 180, 0), size = Vector(0.1, 0.015, 0.015), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/white_brushes", skin = 0, bodygroup = {} },
		["corkscrew_base_right2"] = { type = "Model", model = "models/xqm/cylinderx1large.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "corkscrew_base_right", pos = Vector(0, 0, 1), angle = Angle(-90, 0, 0), size = Vector(0.045, 0.005, 0.005), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
		["corkscrew_helix1_left"] = { type = "Model", model = "models/xqm/coastertrack/special_helix_middle_full_4.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "corkscrew_base_left", pos = Vector(0, 2, 0), angle = Angle(30, 180, 90), size = Vector(0.001, 0.001, 0.002), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
		["corkscrew_helix1_right"] = { type = "Model", model = "models/xqm/coastertrack/special_helix_middle_full_4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "corkscrew_base_right", pos = Vector(0, 0, 1.45), angle = Angle(0, 0, 0), size = Vector(0.001, 0.001, 0.002), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
		["corkscrew_helix2_left"] = { type = "Model", model = "models/xqm/coastertrack/special_helix_middle_full_4.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "corkscrew_base_left", pos = Vector(0, 2.47, 0), angle = Angle(30, 180, 90), size = Vector(0.001, 0.001, 0.002), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
		["corkscrew_helix2_right"] = { type = "Model", model = "models/xqm/coastertrack/special_helix_middle_full_4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "corkscrew_base_right", pos = Vector(0, 0, 1.92), angle = Angle(0, 0, 0), size = Vector(0.001, 0.001, 0.002), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
		["corkscrew_helix3_left"] = { type = "Model", model = "models/xqm/coastertrack/special_helix_middle_full_4.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "corkscrew_base_left", pos = Vector(0, 2.94, 0), angle = Angle(30, 180, 90), size = Vector(0.001, 0.001, 0.002), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
		["corkscrew_helix3_right"] = { type = "Model", model = "models/xqm/coastertrack/special_helix_middle_full_4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "corkscrew_base_right", pos = Vector(0, 0, 2.39), angle = Angle(0, 0, 0), size = Vector(0.001, 0.001, 0.002), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
		["corkscrew_helix4_left"] = { type = "Model", model = "models/xqm/coastertrack/special_helix_middle_full_4.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "corkscrew_base_left", pos = Vector(0, 3.41, 0), angle = Angle(30, 180, 90), size = Vector(0.001, 0.001, 0.002), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
		["corkscrew_helix4_right"] = { type = "Model", model = "models/xqm/coastertrack/special_helix_middle_full_4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "corkscrew_base_right", pos = Vector(0, 0, 2.86), angle = Angle(0, 0, 0), size = Vector(0.001, 0.001, 0.002), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
		["corkscrew_helix5_left"] = { type = "Model", model = "models/xqm/coastertrack/special_helix_middle_full_4.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "corkscrew_base_left", pos = Vector(0, 3.88, 0), angle = Angle(30, 180, 90), size = Vector(0.001, 0.001, 0.002), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
		["corkscrew_helix5_right"] = { type = "Model", model = "models/xqm/coastertrack/special_helix_middle_full_4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "corkscrew_base_right", pos = Vector(0, 0, 3.33), angle = Angle(0, 0, 0), size = Vector(0.001, 0.001, 0.002), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} }
	}
end

SWEP.WalkSpeed = SPEED_FASTEST

SWEP.ViewModel = "models/weapons/c_arms_citizen.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"

SWEP.Weight = 4

SWEP.MeleeDamage = 23
SWEP.Tier = 2

SWEP.Unarmed = false

SWEP.Undroppable = false
SWEP.NoPickupNotification = false
SWEP.NoDismantle = false

SWEP.NoGlassWeapons = false

SWEP.AllowQualityWeapons = true

SWEP.Bleed = true
SWEP.BleedDamage = 3
SWEP.Culinary = true

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.06)
