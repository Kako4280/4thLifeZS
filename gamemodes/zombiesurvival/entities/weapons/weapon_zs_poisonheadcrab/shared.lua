SWEP.PrintName = "Poison Headcrab"

SWEP.ZombieOnly = true
SWEP.IsMelee = true

SWEP.ViewModel = "models/weapons/v_knife_t.mdl"
SWEP.WorldModel = ""

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"
SWEP.Primary.Delay = 0.24

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.Delay = 0.22
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo	= "none"

SWEP.PDamage = 30
SWEP.BDamage = 0
SWEP.PounceWindUp = 0.9
SWEP.SilentPounceWindUp = 2.1
SWEP.SpitWindUp = 0.8

function SWEP:Initialize()
	self:HideViewAndWorldModel()
end

function SWEP:Think()
	local curtime = CurTime()
	local owner = self:GetOwner()

	if self:IsGoingToSpit() and self:GetNextSpit() <= curtime then
		self:SetNextSpit(0)
		self:SetNextPrimaryFire(curtime + 2)
		self:SetNextSecondaryFire(self:GetNextPrimaryFire())

		if SERVER then
			owner:EmitSound("weapons/crossbow/bolt_fly4.wav", 74, 150)
			owner.LastRangedAttack = CurTime()

			local ent = ents.Create("projectile_poisonspit")
			if ent:IsValid() then
				ent:SetOwner(owner)
				local aimvec = owner:GetAimVector()
				local vStart = owner:GetShootPos()
				local tr = util.TraceLine({start=vStart, endpos=vStart + owner:GetAimVector() * 30, filter=owner})
				if tr.Hit then
					ent:SetPos(tr.HitPos + tr.HitNormal * 4)
				else
					ent:SetPos(tr.HitPos)
				end
				ent:Spawn()
				local phys = ent:GetPhysicsObject()
				if phys:IsValid() then
					phys:SetVelocityInstantaneous(aimvec * 900)
				end
			end
		end
	elseif self:IsGoingToLeap() and self:GetNextLeap() <= curtime then
		self:SetNextLeap(0)
		if owner:IsOnGround() then
			local vel = owner:GetAimVector()
			vel.z = math.max(0.45, vel.z)
			vel:Normalize()

			owner:SetGroundEntity(NULL)
			owner:SetLocalVelocity(vel * 470)

			self:SetLeaping(true)

			if SERVER then
				owner:EmitSound("NPC_BlackHeadcrab.Attack")
			end
		end
	elseif self:IsLeaping() then
		local delay = owner:GetMeleeSpeedMul()
		
		if owner:IsOnGround() or 1 < owner:WaterLevel() then
			self:SetLeaping(false)
			self:SetNextPrimaryFire(curtime + delay)
		else

			local shootpos = owner:GetShootPos()
			local trace = owner:CompensatedMeleeTrace(8, 12, shootpos, owner:GetForward())
			local ent = trace.Entity

			if trace.Hit then
				self:SetLeaping(false)
				self:SetNextPrimaryFire(curtime + delay)
			end

			if ent:IsValid() then
				self:SetLeaping(false)

				if SERVER then
					owner:EmitSound("NPC_BlackHeadcrab.Bite")
				end

				local damage = self.PounceDamage

				if ent:IsPlayer() then
					ent:MeleeViewPunch(damage)
					if SERVER then
						local nearest = ent:NearestPoint(shootpos)
						util.Blood(nearest, math.Rand(damage * 0.5, damage * 0.75), (nearest - shootpos):GetNormalized(), math.Rand(damage * 5, damage * 10), true)
					end

					owner:AirBrake()
				else
					local phys = ent:GetPhysicsObject()
					if phys:IsValid() and phys:IsMoveable() then
						phys:ApplyForceOffset(damage * 600 * owner:EyeAngles():Forward(), (ent:NearestPoint(shootpos) + ent:GetPos() * 2) / 3)
						ent:SetPhysicsAttacker(owner)
					end
				end

				if self.BDamage > 0 then
					if ent:IsPlayer() then
						local bleed = ent:GiveStatus("bleed")
						if bleed and bleed:IsValid() then
							bleed:AddDamage(self.BDamage / 2)
							bleed.Damager = owner
						end

						ent:TakeSpecialDamage(self.BDamage / 2, DMG_SLASH, owner, self)
					else
						ent:TakeSpecialDamage(self.BDamage, DMG_SLASH, owner, self)
					end
				end
				
				if self.PDamage > 0 then
					ent:PoisonDamage(self.PDamage, owner, self)
				end

				owner:ViewPunch(Angle(math.Rand(-20, 20), math.Rand(-20, 20), math.Rand(-20, 20)))
			elseif trace.HitWorld then
				if SERVER then
					owner:EmitSound("NPC_BlackHeadcrab.Impact")
				end
			end
		end
	end

	self:NextThink(curtime)
	return true
end

function SWEP:PrimaryAttack()
	local owner = self:GetOwner()
	if self:IsLeaping() or self:IsGoingToSpit() or self:IsGoingToLeap() or CurTime() < self:GetNextPrimaryFire() or not owner:IsOnGround() then return end

	self:SetNextLeap(CurTime() + self.PounceWindUp)

	self.m_ViewAngles = owner:EyeAngles()

	if SERVER then
		owner:EmitSound("NPC_BlackHeadcrab.Telegraph")
	end
end

function SWEP:SecondaryAttack()
	if self:IsLeaping() or self:IsGoingToSpit() or self:IsGoingToLeap() or CurTime() < self:GetNextSecondaryFire() or not self:GetOwner():IsOnGround() then return end

	self:SetNextSpit(CurTime() + self.SpitWindUp)

	if SERVER then
		self:GetOwner():EmitSound("npc/headcrab_poison/ph_scream"..math.random(3)..".wav")
	end
end

function SWEP:Reload()
	if self:GetNextReload() > CurTime() then return end
	self:SetNextReload(CurTime() + self.SilentPounceWindUp)

	if SERVER then
		local ent = self:GetOwner():CompensatedMeleeTrace(4096, 24).Entity
		if ent:IsValidPlayer() then
			self:GetOwner():EmitSound("npc/headcrab_poison/ph_warning"..math.random(3)..".wav")
		else
			self:GetOwner():EmitSound("npc/headcrab_poison/ph_idle"..math.random(3)..".wav")
		end
	end

	return false
end

function SWEP:Move(mv)
	if self:IsLeaping() or self:IsGoingToLeap() or self:IsGoingToSpit() then
		mv:SetSideSpeed(0)
		mv:SetForwardSpeed(0)
	end
end

function SWEP:Precache()
	util.PrecacheSound("npc/headcrab_poison/ph_scream1.wav")
	util.PrecacheSound("npc/headcrab_poison/ph_scream2.wav")
	util.PrecacheSound("npc/headcrab_poison/ph_scream3.wav")
	util.PrecacheSound("npc/headcrab_poison/ph_jump1.wav")
	util.PrecacheSound("npc/headcrab_poison/ph_jump2.wav")
	util.PrecacheSound("npc/headcrab_poison/ph_jump3.wav")
	util.PrecacheSound("npc/headcrab_poison/ph_poisonbite1.wav")
	util.PrecacheSound("npc/headcrab_poison/ph_poisonbite2.wav")
	util.PrecacheSound("npc/headcrab_poison/ph_poisonbite3.wav")
end

function SWEP:SetLeaping(leap)
	if not leap then
		self.m_ViewAngles = nil
	end
	self:SetDTBool(0, leap)
end

function SWEP:GetLeaping()
	return self:GetDTBool(0)
end
SWEP.IsLeaping = SWEP.GetLeaping

function SWEP:SetNextLeap(time)
	self:SetDTFloat(DT_WEAPON_BASE_FLOAT_RELOADEND + 1, time)
end

function SWEP:GetNextLeap()
	return self:GetDTFloat(DT_WEAPON_BASE_FLOAT_RELOADEND + 1)
end

function SWEP:IsGoingToLeap()
	return self:GetNextLeap() > 0
end

function SWEP:ShouldPlayLeapAnimation()
	return self:IsLeaping() or self:IsGoingToLeap()
end

function SWEP:SetNextSpit(time)
	self:SetDTFloat(1, time)
end

function SWEP:GetNextSpit()
	return self:GetDTFloat(1)
end

function SWEP:IsGoingToSpit()
	return self:GetNextSpit() > 0
end
