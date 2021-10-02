AddCSLuaFile()

SWEP.Base = "weapon_zs_baseshotgun"

SWEP.PrintName = "Boom Stick"
SWEP.Description = "This shotgun allows you to load up to four shells in the chamber at once. Hold down reload for faster loading of each shell."

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

SWEP.ReloadDelay = 0.5

SWEP.Primary.Sound = Sound("weapons/shotgun/shotgun_dbl_fire.wav")
SWEP.Primary.Damage = 18
SWEP.Primary.NumShots = 12
SWEP.Primary.Delay = 1

SWEP.Recoil = 7.5

SWEP.Primary.ClipSize = 2
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "buckshot"
SWEP.Primary.DefaultClip = 28

SWEP.ConeMax = 11.5
SWEP.ConeMin = 10
SWEP.Pierces = 2

SWEP.Tier = 5

SWEP.WalkSpeed = SPEED_SLOWER
SWEP.FireAnimSpeed = 0.4
SWEP.Knockback = 35

SWEP.PumpActivity = ACT_SHOTGUN_PUMP
SWEP.PumpSound = Sound("Weapon_Shotgun.Special1")
SWEP.ReloadSound = Sound("Weapon_Shotgun.Reload")

GAMEMODE:SetPrimaryWeaponModifier(SWEP, WEAPON_MODIFIER_RELOAD_SPEED, 0.07)

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

function SWEP:ShootBullets(dmg, numbul, cone)
	local owner = self:GetOwner()
	owner:DoAttackEvent()

	local dir = owner:GetAimVector()
	local dirang = dir:Angle()
	local start = owner:GetShootPos()

	dir = dirang:Forward()
	local tr = owner:CompensatedPenetratingMeleeTrace(4092, 0.01, start, dir)
	local ent

	local dmgf = function(i) return dmg * (1 - 0.1 * i) end

	owner:LagCompensation(true)
	for i = 1, numbul do
		for i, trace in ipairs(tr) do
			if not trace.Hit then continue end
			if i > self.Pierces - 1 then break end

			ent = trace.Entity

			if ent and ent:IsValid() then
				owner:FireBulletsLua(trace.HitPos, dir, 0, numbul, dmgf(i-1), nil, self.Primary.KnockbackScale, "", self.BulletCallback, self.Primary.HullSize, nil, self.Primary.MaxDistance, nil, self)
			end
		end
	end
	owner:FireBulletsLua(start, dir, cone, numbul, 0, nil, self.Primary.KnockbackScale, self.TracerName, self.BulletCallback, self.Primary.HullSize, nil, self.Primary.MaxDistance, nil, self)
	owner:LagCompensation(false)
end
