INC_SERVER()

function ENT:Initialize()
	self:SetModel("models/props_junk/sawblade001a.mdl")
	self:PhysicsInitSphere(1)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetModelScale(0.2)
	self:SetupGenericProjectile(false)

	self:Fire("kill", "", 0.5)

	self.NextShoot = 0
	self.PostOwner = self:GetOwner()
end


	



function ENT:PhysicsCollide(data, physobj)
	self.PhysicsData = data
	self:NextThink(CurTime())
end

function ENT:OnRemove()
	local hitpos = self.PhysicsData and self.PhysicsData.HitPos or self:GetPos()
	local normal = self.PhysicsData and self.PhysicsData.HitNormal or Vector(0, 0, 1)

	local effectdata = EffectData()
		effectdata:SetOrigin(hitpos)
		effectdata:SetNormal(normal)
	util.Effect("explosion_fusordisc", effectdata)

	local owner = self.PostOwner
	if not owner:IsValidLivingHuman() then owner = self end

	local oldvel = self.PhysicsData and self.PhysicsData.OurOldVelocity or self:GetVelocity()

	local backvel = oldvel:GetNormalized()
	local pos = self:GetPos() - backvel * 10
	local dmg = self.ProjDamage
	local me = self:ProjectileDamageSource()
		end

function ENT:Explode(hitpos, normal, hitent)
	if self.Exploded then return end
	self.Exploded = true

	self:Remove()
end

function ENT:Explode(hitpos, hitnormal)
	if self.Exploded then return end
	self.Exploded = true

	hitpos = hitpos or self:GetPos()
	hitnormal = hitnormal or self:GetForward()

	local owner = self:GetOwner()
	if owner:IsValidHuman() then
		local source = self:ProjectileDamageSource()
		local ent = self.HitData.HitEntity
		util.BlastDamagePlayer(source, owner, self:GetPos(), 80, (self.ProjDamage or 85) * 1.0, DMG_ALWAYSGIB, 0.96)
		if ent:IsValidLivingZombie() and not ent:GetZombieClassTable().NeverAlive then
			ent:TakeSpecialDamage((self.ProjDamage or 80) * 0.9, DMG_GENERIC, owner, source, hitpos)
		end
	end
end

function ENT:ExplodeAlt()
	if self.Exploded then return end
	self.Exploded = true

	local owner = self:GetOwner()
	if owner:IsValidHuman() then
		local source = self:ProjectileDamageSource()
		util.BlastDamagePlayer(source, owner, self:GetPos(), 80, (self.ProjDamage or 85) * 2.25, DMG_ALWAYSGIB, 0.96)
	end

	local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos())
		effectdata:SetNormal(self:GetForward())
	util.Effect("explosion_fusordisc", effectdata)

	self:Remove()
end

function ENT:OnTakeDamage(dmginfo)
	local attacker = dmginfo:GetAttacker()
	if attacker:IsValidLivingHuman() then
		local inflictor = dmginfo:GetInflictor()

		if inflictor:IsValid() and dmginfo:GetDamageType() == DMG_GENERIC and inflictor.ASMD and attacker == self:GetOwner() then
			self:ExplodeAlt()
		end
	end
end

function ENT:PhysicsCollide(data, phys)
	if self.HitData then return end
	self.HitData = data
	self:NextThink(CurTime())
end

function ENT:Think()
	if self.HitData then
		self:Explode(self.HitData.HitPos, self.HitData.HitNormal)
		self:Remove()
	end
end