SWEP.Base = "weapon_zs_base"

SWEP.Primary.Sound = Sound("Weapon_Pistol.Single")
SWEP.DryFireSound = Sound("Weapon_Pistol.Empty")
SWEP.Primary.Damage = 30
SWEP.Primary.KnockbackScale = 1
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.15

SWEP.ConeMax = 1.5
SWEP.ConeMin = 0.5
SWEP.ConeRamp = 2

SWEP.CSMuzzleFlashes = true

SWEP.Primary.ClipSize = 1
SWEP.Primary.DefaultClip = 1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pistol"
--SWEP.RequiredClip = 1		-- Just a warning not to use this. Most of this base is to distinguish between primary and secondary
SWEP.Primary.RequiredClip = 1 -- Added Primary to distinguish between each fire's ammo consumption
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.Secondary.ClipSize = 1
SWEP.Secondary.DefaultClip = 1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "dummy"
SWEP.Secondary.RequiredClip = 1 -- Same here
SWEP.Secondary.DefaultClip = 1 -- TODO: Add a GM function for secondary to match with primary default

SWEP.EnableIron = false

function SWEP:CanPrimaryAttack()
	if self:GetOwner():IsHolding() or self:GetOwner():GetBarricadeGhosting() or self:GetReloadFinish() > 0 then return false end

	if (self.Primary.ClipSize >= 0 and self:Clip1() or self:GetOwner():GetAmmoCount(self:GetPrimaryAmmoType())) < self.Primary.RequiredClip then
		self:EmitSound(self.DryFireSound)
		self:SetNextPrimaryFire(CurTime() + math.max(0.25, self.Primary.Delay))
		self:SetNextSecondaryFire(CurTime() + math.max(0.25, self.Primary.Delay, self.Secondary.Delay)) -- Whatever is highest is the delay for secondary 
		return false
	end

	return self:GetNextPrimaryFire() <= CurTime()
end

-- Same as CanPrimaryAttack but for secondary fire
function SWEP:CanSecondaryAttack()
	if self:GetOwner():IsHolding() or self:GetOwner():GetBarricadeGhosting() or self:GetReloadFinish() > 0 then return false end

	if (self:GetMaxClip2() > 0 and self:Clip2() or self:GetOwner():GetAmmoCount(self:GetSecondaryAmmoType())) < self.Secondary.RequiredClip then
		self:EmitSound(self.DryFireSound)
		self:SetNextPrimaryFire(CurTime() + math.max(0.25, self.Secondary.Delay, self.Secondary.Delay)) -- Same here
		self:SetNextSecondaryFire(CurTime() + math.max(0.25, self.Secondary.Delay))
		return false
	end

	return self:GetNextSecondaryFire() <= CurTime()
end

function SWEP:GetPrimaryClipSize()
	local owner = self:GetOwner()
	local multi = self.Primary.ClipSize/self.Primary.RequiredClip >= 8 and owner:HasTrinket("extendedmag") and 1.15 or 1

	return math.floor(self:GetMaxClip1() * multi)
end

function SWEP:GetSecondaryClipSize()
	local owner = self:GetOwner()
	local multi = self.Secondary.ClipSize/self.Secondary.RequiredClip >= 8 and owner:HasTrinket("extendedmag") and 1.15 or 1

	return math.floor(self:GetMaxClip2() * multi)
end

function SWEP:GetPrimaryFireDelay()
	local owner = self:GetOwner()
	return self.Primary.Delay / (owner:GetStatus("frost") and 0.7 or 1)
end

function SWEP:GetSecondaryFireDelay()
	local owner = self:GetOwner()
	return self.Secondary.Delay / (owner:GetStatus("frost") and 0.7 or 1)
end

function SWEP:TakeAmmo()
	self:TakePrimaryAmmo(self.Primary.RequiredClip)
end

function SWEP:TakeAltAmmo()
	self:TakeSecondaryAmmo( self.Secondary.RequiredClip )
end

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end

	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	self:SetNextSecondaryFire(CurTime() + self.Secondary.Delay)

	self:EmitFireSound()
	self:TakeAmmo()
	self:ShootBullets(self.Primary.Damage, self.Primary.NumShots, self:GetCone())
	self.IdleAnimation = CurTime() + self:SequenceDuration()
end

function SWEP:SecondaryAttack()
	-- if swep is not using ironsights then dont set iron sights to true
	if self.EnableIron and self:GetNextSecondaryFire() <= CurTime() and not self:GetOwner():IsHolding() and self:GetReloadFinish() == 0 then
		self:SetIronsights(true)
	end

	if not self:CanPrimaryAttack() then return end

	self:SetNextPrimaryFire(CurTime() + self:GetSecondaryFireDelay())

	self:EmitFireSound()
	self:TakeAltAmmo()
	self:ShootBullets(self.Secondary.Damage, self.Secondary.NumShots, self:GetCone())
	self.IdleAnimation = CurTime() + self:SequenceDuration()
end

function SWEP:SetIronsights(b)
	-- if swep is not using ironsights, keep it disabled
	if self.EnableIron == false then
		self:SetDTBool(0, false)
	return end
	self:SetDTBool(0, b)

	if self.IronSightsHoldType then
		if b then
			self:SetWeaponHoldType(self.IronSightsHoldType)
		else
			self:SetWeaponHoldType(self.HoldType)
		end
	end

	gamemode.Call("WeaponDeployed", self:GetOwner(), self)
end

function SWEP:GetIronsights()
	return self:GetDTBool(0)
end