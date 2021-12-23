AddCSLuaFile()
DEFINE_BASECLASS("weapon_fm_base")

SWEP.PrintName = "SCK TEST"
SWEP.Description = "eeee"

SWEP.Slot = 2
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 60

	SWEP.ViewModelFlip = false
	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

	SWEP.HUD3DBone = "v_weapon.sg550_Parent"
	SWEP.HUD3DPos = Vector(-1.3, -5.56, -2)
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DScale = 0.02

	SWEP.VElements = {
		["egon_base++++++"] = { type = "Model", model = "models/props_phx/misc/iron_beam2.mdl", bone = "", rel = "egon_base", pos = Vector(1.5, -4, -2), angle = Angle(-17.532, 90, 0), size = Vector(0.119, 0.119, 0.119), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/weapons/v_stunstick/v_stunstick_diffuse", skin = 0, bodygroup = {} },
		["egon_base+"] = { type = "Model", model = "models/props_phx/construct/metal_wire_angle360x2.mdl", bone = "", rel = "egon_base", pos = Vector(18.181, 0, 0), angle = Angle(90, 0, 0), size = Vector(0.095, 0.095, 0.11), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["egon_base+++++++++"] = { type = "Model", model = "models/props_wasteland/laundry_washer001a.mdl", bone = "", rel = "egon_base", pos = Vector(-3.5, 5, 1), angle = Angle(90, -90, 0), size = Vector(0.05, 0.05, 0.14), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["egon_base++++++++"] = { type = "Model", model = "models/props_combine/combine_interface001a.mdl", bone = "", rel = "egon_base", pos = Vector(-3, 4, 0.6), angle = Angle(70, 0, 0), size = Vector(0.15, 0.15, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["egon_base+++++++"] = { type = "Model", model = "models/props_lab/reciever01a.mdl", bone = "", rel = "egon_base", pos = Vector(-10.91, 3.635, 1.557), angle = Angle(120, 0, 0), size = Vector(0.2, 0.2, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["egon_base+++"] = { type = "Model", model = "models/props_c17/factorymachine01.mdl", bone = "", rel = "egon_base", pos = Vector(4, 0, -1.601), angle = Angle(180, 90, 0), size = Vector(0.064, 0.064, 0.064), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["egon_base+++++"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360.mdl", bone = "", rel = "egon_base", pos = Vector(-10.91, 0, 0), angle = Angle(90, 0, 0), size = Vector(0.079, 0.079, 0.237), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["egon_base"] = { type = "Model", model = "models/props_wasteland/laundry_washer003.mdl", bone = "Base", rel = "", pos = Vector(0.699, 1, -7.792), angle = Angle(90, -90, 0), size = Vector(0.301, 0.1, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["egon_base++"] = { type = "Model", model = "models/props_c17/factorymachine01.mdl", bone = "", rel = "egon_base", pos = Vector(3.635, 0, 1.5), angle = Angle(0, 90, 0), size = Vector(0.064, 0.064, 0.064), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["egon_base++++++"] = { type = "Model", model = "models/props_phx/misc/iron_beam2.mdl", bone = "", rel = "egon_base", pos = Vector(1.5, -4, -2), angle = Angle(-17.532, 90, 0), size = Vector(0.119, 0.119, 0.119), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["egon_base+"] = { type = "Model", model = "models/props_phx/construct/metal_wire_angle360x2.mdl", bone = "", rel = "egon_base", pos = Vector(15.064, 0, 0), angle = Angle(90, 0, 0), size = Vector(0.071, 0.071, 0.08), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["egon_base++++++++++"] = { type = "Model", model = "models/props_wasteland/laundry_basket001.mdl", bone = "", rel = "egon_base", pos = Vector(-4.676, 0.5, -6), angle = Angle(0, 0, 0), size = Vector(0.029, 0.029, 0.159), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["egon_base+++"] = { type = "Model", model = "models/props_c17/factorymachine01.mdl", bone = "", rel = "egon_base", pos = Vector(4, 0, -1.601), angle = Angle(180, 90, 0), size = Vector(0.05, 0.05, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["egon_base"] = { type = "Model", model = "models/props_wasteland/laundry_washer003.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(8.8, 1, -7), angle = Angle(0, 0, -170), size = Vector(0.17, 0.1, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["egon_base++++++++"] = { type = "Model", model = "models/props_combine/combine_interface001a.mdl", bone = "", rel = "egon_base", pos = Vector(4.675, 5, 0.6), angle = Angle(70, 0, 0), size = Vector(0.15, 0.15, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["egon_base+++++++++"] = { type = "Model", model = "models/props_wasteland/laundry_washer001a.mdl", bone = "", rel = "egon_base", pos = Vector(0.518, 5, 1), angle = Angle(90, -90, 0), size = Vector(0.039, 0.039, 0.119), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["egon_base+++++"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360.mdl", bone = "", rel = "egon_base", pos = Vector(-2.597, 0, 0), angle = Angle(90, 0, 0), size = Vector(0.079, 0.079, 0.129), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["egon_base+++++++"] = { type = "Model", model = "models/props_lab/reciever01a.mdl", bone = "", rel = "egon_base", pos = Vector(-2, 5, 1.557), angle = Angle(120, 0, 0), size = Vector(0.2, 0.2, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["egon_base++"] = { type = "Model", model = "models/props_c17/factorymachine01.mdl", bone = "", rel = "egon_base", pos = Vector(3.635, 0, 1.5), angle = Angle(0, 90, 0), size = Vector(0.05, 0.05, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.ViewModelBoneMods = {
		["ValveBiped.Bip01_L_UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, -3), angle = Angle(0, 0, 0) },
		["Base"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 3), angle = Angle(0, 0, 0) }
	}
end

SWEP.Base = "weapon_fm_base"

SWEP.HoldType = "physgun"

SWEP.ViewModel = "models/weapons/c_physcannon.mdl"
SWEP.WorldModel = "models/weapons/w_physics.mdl"
SWEP.UseHands = true

SWEP.Primary.FireSound = Sound("Weapon_MP5Navy.Single")
SWEP.Primary.Damage = 29
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 1

SWEP.Primary.Ice = false

SWEP.Primary.ClipSize = 320
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "ar2"