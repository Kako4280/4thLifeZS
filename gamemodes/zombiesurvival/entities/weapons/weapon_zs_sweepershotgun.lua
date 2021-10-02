AddCSLuaFile()

SWEP.Base = "weapon_zs_baseshotgun"

SWEP.PrintName = "'Sweeper' Shotgun"
SWEP.Description = "A pump shotgun with a modest shell number and packs a hefty punch."

if CLIENT then
	SWEP.ViewModelFlip = false

	SWEP.HUD3DBone = "v_weapon.M3_PARENT"
	SWEP.HUD3DPos = Vector(-1, -4, -3)
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DScale = 0.015
end

SWEP.Base = "weapon_zs_baseshotgun"

SWEP.HoldType = "shotgun"

SWEP.ViewModel = "models/weapons/cstrike/c_shot_m3super90.mdl"
SWEP.WorldModel = "models/weapons/w_shot_m3super90.mdl"
SWEP.UseHands = true

SWEP.ReloadDelay = 0.45

SWEP.Primary.Sound = Sound("Weapon_M3.Single")
SWEP.Primary.Damage = 11
SWEP.Primary.NumShots = 10
SWEP.Primary.Delay = 0.74
SWEP.Pierces = 1

SWEP.Primary.ClipSize = 6
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "buckshot"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.Burn = false
SWEP.BurnChance = 0.28
SWEP.BurnDamage = 8

SWEP.ConeMax = 5
SWEP.ConeMin = 3.75

SWEP.FireAnimSpeed = 1.2
SWEP.WalkSpeed = SPEED_SLOWER

SWEP.Tier = 4
--SWEP.MaxStock = 3

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_CLIP_SIZE, 1)

local branch = GAMEMODE:AddNewRemantleBranch(SWEP, 1, "'Sweeper' Incendiary Shotgun", "Fires incendiary Buckshot shells, but reduced damage", function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 0.85
	wept.Burn = true
end)
branch.Colors = {Color(214, 46, 4), Color(229, 95, 0), Color(255, 182, 0)}
branch.NewNames = {"Warm", "Hot", "Searing"}