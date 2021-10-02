AddCSLuaFile()

SWEP.PrintName = "'Battleaxe' Handgun"
SWEP.Description = "An accurate, reliable pistol with considerable damage."

SWEP.Slot = 1
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 60

	SWEP.HUD3DPos = Vector(-0.95, 0, 1)
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DBone = "v_weapon.USP_Slide"
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "pistol"

SWEP.ViewModel = "models/weapons/cstrike/c_pist_usp.mdl"
SWEP.WorldModel = "models/weapons/w_pist_usp.mdl"
SWEP.UseHands = true

SWEP.Primary.Sound = Sound("Weapon_USP.Single")
SWEP.Primary.Damage = 25
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.17

SWEP.Primary.ClipSize = 12
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pistol"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.IronSightsPos = Vector(-5.9, 12, 2.3)

SWEP.ConeMax = 2.5
SWEP.ConeMin = 0.75

SWEP.Burn = false
SWEP.BurnChance = 0.45
SWEP.BurnDamage = 8

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_CLIP_SIZE, 1, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.0175, 1)

local branch = GAMEMODE:AddNewRemantleBranch(SWEP, 1, "'Ember' Handgun", "A Battleaxe modified to handle incendiary rounds.", function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 0.8
	wept.ConeMax = wept.ConeMax * 1.1
	wept.ConeMin = wept.ConeMin * 1.1
	wept.Burn = true
end)
branch.Colors = {Color(214, 46, 4), Color(229, 95, 0), Color(255, 182, 0)}
branch.NewNames = {"Warm", "Hot", "Searing"}