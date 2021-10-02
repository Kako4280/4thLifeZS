AddCSLuaFile()

SWEP.PrintName = "'Aether' AUG"
SWEP.Description = "A very accurate assault rifle with great damage output and a high clip size."

SWEP.Slot = 2
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 60

	SWEP.HUD3DBone = "v_weapon.aug_Parent"
	SWEP.HUD3DPos = Vector(-1, -2.5, -3)
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DScale = 0.015
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "ar2"

SWEP.ViewModel = "models/weapons/cstrike/c_rif_aug.mdl"
SWEP.WorldModel = "models/weapons/w_rif_aug.mdl"
SWEP.UseHands = true

SWEP.Primary.Sound = Sound("Weapon_AUG.Single")
SWEP.Primary.Damage = 25
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.095

SWEP.Primary.ClipSize = 30
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "ar2"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.Primary.Gesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.ReloadGesture = ACT_HL2MP_GESTURE_RELOAD_AR2

SWEP.ConeMax = 4
SWEP.ConeMin = 1

SWEP.WalkSpeed = SPEED_SLOW

SWEP.Tier = 4
--SWEP.MaxStock = 3

SWEP.IronSightsAng = Vector(-1, -1, 0)
SWEP.IronSightsPos = Vector(-3, 4, 3)

SWEP.Burn = false
SWEP.BurnChance = 0.28
SWEP.BurnDamage = 8

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_RELOAD_SPEED, 0.1)
local branch = GAMEMODE:AddNewRemantleBranch(SWEP, 1, "'Inferno' AUG", "Fires incendiary assault rifle rounds, but reduced damage", function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 0.85
	wept.Burn = true
end)
branch.Colors = {Color(214, 46, 4), Color(229, 95, 0), Color(255, 182, 0)}
branch.NewNames = {"Warm", "Hot", "Searing"}