AddCSLuaFile()
DEFINE_BASECLASS("weapon_zs_base")

SWEP.PrintName = "'Ravager' Shotgun"
SWEP.Description = "message here."

SWEP.Slot = 2
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 60

	SWEP.ViewModelFlip = false
	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

SWEP.HUD3DBone = "ValveBiped.Gun"
SWEP.HUD3DPos = Vector(1.65, 0, -8)
SWEP.HUD3DScale = 0.025


SWEP.Slot = 4
SWEP.SlotPos = 0


SWEP.VElements = {
	["ravager2"] = { type = "Model", model = "models/props_combine/combine_generator01.mdl", bone = "ValveBiped.Gun", rel = "", pos = Vector(1.5, 6.3, 10), angle = Angle(0, 0, -180), size = Vector(0.1, 0.1, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["ravager3"] = { type = "Model", model = "models/props_combine/combinethumper002.mdl", bone = "ValveBiped.Gun", rel = "", pos = Vector(1, 5.5, -9.5), angle = Angle(0, 180, 0), size = Vector(0.075, 0.075, 0.125), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["ravager1"] = { type = "Model", model = "models/props_combine/combinecrane002.mdl", bone = "ValveBiped.Gun", rel = "", pos = Vector(-1, 5, 8), angle = Angle(180, 0, 0), size = Vector(0.085, 0.085, 0.085), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["ravager4"] = { type = "Model", model = "models/props_combine/combine_lock01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(17, 2.299, -5), angle = Angle(0, -95, 93), size = Vector(0.125, 0.125, 0.125), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["ravager2"] = { type = "Model", model = "models/props_combine/combine_generator01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(13, 2.5, -3.401), angle = Angle(0, -90, 87), size = Vector(0.045, 0.045, 0.045), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["ravager3"] = { type = "Model", model = "models/props_combine/combinethumper002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-2.5, 2.5, -1.25), angle = Angle(0, 90, 93), size = Vector(0.064, 0.064, 0.064), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["ravager1"] = { type = "Model", model = "models/props_combine/combinecrane002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6, 2.5, -2.597), angle = Angle(0, 90, -87), size = Vector(0.05, 0.05, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
end


SWEP.Base = "weapon_zs_baseshotgun"

SWEP.HoldType = "shotgun"

SWEP.ViewModel = "models/weapons/c_shotgun.mdl"
SWEP.WorldModel = "models/weapons/w_shotgun.mdl"
SWEP.UseHands = true

SWEP.CSMuzzleFlashes = false

SWEP.Primary.Sound = Sound("Weapon_Oberon.Single")
SWEP.Primary.Damage = 14
SWEP.Primary.NumShots = 7
SWEP.Primary.Delay = 0.35

SWEP.FireAnimSpeed = 0.55

SWEP.Primary.ClipSize = 16
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "pulse"
SWEP.Primary.DefaultClip = 30
SWEP.RequiredClip = 2

SWEP.ConeMax = 7.5
SWEP.ConeMin = 5

SWEP.ReloadDelay = 0.33

SWEP.WalkSpeed = SPEED_SLOWER

SWEP.TracerName = "AR2Tracer"

SWEP.PumpSound = Sound("Weapon_Shotgun.Special1")
SWEP.ReloadSound = Sound("Weapon_Shotgun.Reload")

SWEP.LegDamage = 9
SWEP.Tier = 4

