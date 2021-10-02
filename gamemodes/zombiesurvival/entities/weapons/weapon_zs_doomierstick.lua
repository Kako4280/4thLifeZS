AddCSLuaFile()

SWEP.Base = "weapon_zs_baseproj"

SWEP.PrintName = "Doomier Stick"
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
SWEP.Primary.Damage = 175
SWEP.Primary.NumShots = 15
SWEP.Primary.Delay = 2

SWEP.Recoil = 2

SWEP.Primary.Projectile = "projectile_emi"
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

GAMEMODE:SetPrimaryWeaponModifier(SWEP, WEAPON_MODIFIER_RELOAD_SPEED, 0.07)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_CLIP_SIZE, 1)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, "litheeeeeeeeeeeeedhasdjflhsa Stick", "Decreased damage but faster reload, more knockback and more move speed", function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 0.75
	wept.ReloadSpeed = wept.ReloadSpeed * 1.25
	wept.Primary.Delay = wept.Primary.Delay * 0.5
	wept.Knockback = 2
	wept.WalkSpeed = SPEED_SLOW
end)

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end

	local owner = self:GetOwner()

	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	self:EmitSound(self.Primary.Sound)

	local clip = self:Clip1()

	self:ShootBullets(self.Primary.Damage, self.Primary.NumShots * clip, self:GetCone())

	self:TakePrimaryAmmo(clip)
	owner:ViewPunch(clip * 0.5 * self.Recoil * Angle(math.Rand(-0.1, -0.1), math.Rand(-0.1, 0.1), 0))

	owner:SetGroundEntity(NULL)
	owner:SetVelocity(-self.Knockback * clip * owner:GetAimVector())

	self.IdleAnimation = CurTime() + self:SequenceDuration()
end