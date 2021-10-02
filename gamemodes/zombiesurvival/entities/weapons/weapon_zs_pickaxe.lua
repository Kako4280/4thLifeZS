AddCSLuaFile()

SWEP.PrintName = "Pickaxe"
SWEP.Description = "aaaaaa"


if CLIENT then
	SWEP.ViewModelFOV = 60

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

	SWEP.VElements = {
		["base"] = { type = "Model", model = "models/props_mining/pickaxe01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5, 0.5, 8), angle = Angle(180, 0, 0), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	SWEP.WElements = {
		["base"] = { type = "Model", model = "models/props_mining/pickaxe01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 1, 5), angle = Angle(180, 0, 0), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.Base = "weapon_zs_basemelee"

SWEP.HoldType = "melee2"

SWEP.DamageType = DMG_CLUB

SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.UseHands = true

SWEP.MeleeDamage = 50
SWEP.MeleeRange = 60
SWEP.MeleeSize = 3
SWEP.MeleeKnockBack = 150

SWEP.Primary.Delay = 1.1

SWEP.Bleed = true
SWEP.BleedDamage = 15

SWEP.Tier = 3

SWEP.WalkSpeed = SPEED_SLOWEST

SWEP.SwingRotation = Angle(60, 0, -80)
SWEP.SwingOffset = Vector(0, -30, 0)
SWEP.SwingTime = 0.85
SWEP.SwingHoldType = "melee"

SWEP.AllowQualityWeapons = true

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MELEE_IMPACT_DELAY, -0.1, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.1, 1)