SWEP.PrintName = "'Contaminator' Acid Pistol"
SWEP.Description = "Launches acidic projectiles that have a chance to remove damage resistance"

SWEP.Base = "weapon_zs_baseproj"

SWEP.HoldType = "revolver"

SWEP.ViewModel = "models/weapons/c_357.mdl"
SWEP.WorldModel = "models/weapons/w_357.mdl"
SWEP.UseHands = true

SWEP.CSMuzzleFlashes = false

SWEP.Primary.ClipSize = 10
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "chemical"
SWEP.Primary.Delay = 0.30
SWEP.Primary.DefaultClip = 20
SWEP.Primary.Damage = 25
SWEP.Primary.NumShots = 1

SWEP.ConeMax = 3
SWEP.ConeMin = 2.5

SWEP.WalkSpeed = SPEED_SLOW

SWEP.Tier = 3

SWEP.FireAnimSpeed = 0.4

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.05)


function SWEP:EmitFireSound()
	self:EmitSound("^weapons/mortar/mortar_fire1.wav", 70, math.random(88, 92), 0.65)
	self:EmitSound("npc/barnacle/barnacle_gulp2.wav", 70, 70, 0.85, CHAN_AUTO + 20)
end
