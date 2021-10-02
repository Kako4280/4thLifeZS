AddCSLuaFile()

SWEP.Base = "weapon_zs_baseproj"

SWEP.PrintName = "PUNISHEDIERIEST STICK"
SWEP.Description = "DOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOM."

SWEP.Slot = 3
SWEP.SlotPos = 0

if CLIENT then
	SWEP.HUD3DBone = "ValveBiped.Gun"
	SWEP.HUD3DPos = Vector(1.65, 0, -8)
	SWEP.HUD3DScale = 0.025

	SWEP.ViewModelFlip = false
end

SWEP.ViewModel = "models/weapons/c_shotgun.mdl"
SWEP.WorldModel = "models/weapons/w_shotgun.mdl"
SWEP.UseHands = true

SWEP.CSMuzzleFlashes = false

SWEP.ReloadDelay = 3

SWEP.Primary.Sound = Sound("weapons/shotgun/shotgun_dbl_fire.wav")
SWEP.Primary.Damage = 75
SWEP.Primary.NumShots = 11
SWEP.Primary.Delay = 10

SWEP.Recoil = 2

SWEP.Primary.Projectile = "projectile_zsflakgrenade"
SWEP.Primary.ProjVelocity = 10
SWEP.Primary.ProjExplosionTaper = 0.95


SWEP.Primary.ClipSize = 4
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "impactmine"
SWEP.Primary.DefaultClip = 28

SWEP.ConeMax = 11.5
SWEP.ConeMin = 10

SWEP.WalkSpeed = SPEED_SLOWER
SWEP.FireAnimSpeed = 0.4
SWEP.Knockback = 1

SWEP.PumpActivity = ACT_SHOTGUN_PUMP
SWEP.PumpSound = Sound("Weapon_Shotgun.Special1")
SWEP.ReloadSound = Sound("Weapon_Shotgun.Reload")