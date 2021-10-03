SWEP.Base = "weapon_zs_basemelee"

SWEP.PrintName = "Fox Pack"
SWEP.Description = "It's simply a pack of wooden junk kept together with some duct tape.\nVery useful for making barricades when no materials are around.\nNeeds something like a hammer and nails to keep the things in place."

SWEP.ViewModel = "models/weapons/c_aegiskit.mdl"
SWEP.WorldModel = "models/models/model/minecraft/fox_stand.mdl"
SWEP.UseHands = true

SWEP.AmmoIfHas = true
SWEP.AllowEmpty = true

SWEP.Primary.ClipSize = 1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "SniperRound"
SWEP.Primary.Delay = 1
SWEP.Primary.DefaultClip = 4

SWEP.Secondary.ClipSize = 1
SWEP.Secondary.DefaultClip = 1
SWEP.Secondary.Ammo = "dummy"
SWEP.Secondary.Automatic = true
SWEP.Secondary.Delay = 0.15

SWEP.WalkSpeed = SPEED_NORMAL
SWEP.FullWalkSpeed = SPEED_SLOWEST

SWEP.AdvancedJunkModelsFoxes = {
	Model("models/models/model/minecraft/fox_sit.mdl"),
	Model("models/models/model/minecraft/fox_sleep.mdl"),
	Model("models/models/model/minecraft/fox_stand.mdl")
}

SWEP.HoldType = "physgun"

function SWEP:SetReplicatedAmmo(count)
	self:SetDTInt(0, count)
end

function SWEP:GetReplicatedAmmo()
	return self:GetDTInt(0)
end

function SWEP:GetWalkSpeed()
	if self:GetPrimaryAmmoCount() > 0 then
		return self.FullWalkSpeed
	end
end

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end

	local owner = self:GetOwner()
	local aimvec = owner:GetAimVector()
	local shootpos = owner:GetShootPos()
	local tr = util.TraceLine({start = shootpos, endpos = shootpos + aimvec * 32, filter = owner})

	self:SetNextPrimaryAttack(CurTime() + self.Primary.Delay)

	self:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 75, math.random(75, 80))

	self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	self.IdleAnimation = CurTime() + math.min(self.Primary.Delay, self:SequenceDuration())
	
	local ModelTable = self.JunkModels
	local n = 1
	local f = false
	
	if math.random(1,5) <= 3 then
		ModelTable = self.AdvancedJunkModelsSmall
		n = math.random(1,3)
	end

	if SERVER then
		owner:RestartGesture(ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE)
		
		for i = 1, n do
			timer.Simple((i - 1) / 4, function()
				local ent = ents.Create("prop_physics")
				if ent:IsValid() then
					local ang = aimvec:Angle()
					ang:RotateAroundAxis(ang:Forward(), 90)
					ent:SetPos(tr.HitPos)
					ent:SetAngles(ang)
					ent:SetModel(ModelTable[math.random(#ModelTable)])
					ent:Spawn()
					ent:SetHealth(600)
					ent:SetMaxHealth(94821) -- creating a unique identifier for junk pack props.. not my proudest moment!
					ent.NoVolumeCarryCheck = true
					ent.NoDisTime = CurTime() + 15
					ent.NoDisOwner = self:GetOwner()
					local phys = ent:GetPhysicsObject()
					if phys:IsValid() then
						phys:SetMass(math.min(phys:GetMass(), 50))
						phys:SetVelocityInstantaneous(self:GetOwner():GetVelocity())
					end
					ent:SetPhysicsAttacker(self:GetOwner())
				end
			end)
		end
		
		if f then
			timer.Simple((n) / 5, function()
				local ent = ents.Create("prop_physics")
				if ent:IsValid() then
					local ang = aimvec:Angle()
					ang:RotateAroundAxis(ang:Forward(), 90)
					ent:SetPos(tr.HitPos)
					ent:SetAngles(ang)
					ent:SetModel(self.AdvancedJunkModelsFoxes[math.random(#self.AdvancedJunkModelsFoxes)])
					ent:Spawn()
					ent:SetHealth(350)
					ent.NoVolumeCarryCheck = true
					ent.NoDisTime = CurTime() + 15
					ent.NoDisOwner = self:GetOwner()
					local phys = ent:GetPhysicsObject()
					if phys:IsValid() then
						phys:SetMass(math.min(phys:GetMass(), 50))
						phys:SetVelocityInstantaneous(self:GetOwner():GetVelocity())
					end
					ent:SetPhysicsAttacker(self:GetOwner())
				end
			end)
		end
		
		self:TakePrimaryAmmo(1)
	end
end

function SWEP:SecondaryAttack()
end

function SWEP:Reload()
end

function SWEP:CanPrimaryAttack()
	if self:GetOwner():IsHolding() or self:GetOwner():GetBarricadeGhosting() then return false end

	if math.abs(self:GetOwner():GetVelocity().z) >= 256 then return false end

	if self:GetPrimaryAmmoCount() <= 0 then
		self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
		return false
	end

	return true
end

function SWEP:Think()
	if self.IdleAnimation and self.IdleAnimation <= CurTime() then
		self.IdleAnimation = nil
		self:SendWeaponAnim(ACT_VM_IDLE)
	end

	if SERVER then
		local count = self:GetPrimaryAmmoCount()
		if count ~= self:GetReplicatedAmmo() then
			self:SetReplicatedAmmo(count)
			self:GetOwner():ResetSpeed()
		end
	end
end
