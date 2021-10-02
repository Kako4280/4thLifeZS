INC_SERVER()

ENT.PointsMultiplier = 1.25

function ENT:Initialize()

	self:SetModel("models/dav0r/hoverball.mdl")
	self:PhysicsInitSphere(0.5)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetModelScale(0.45, 0)
	self:SetupGenericProjectile(false)

	self:Fire("kill", "", 3)
	self.Creation = UnPredictedCurTime()
end

function ENT:PhysicsUpdate(phys)
	self:ProjectileTraceAhead(phys)
end

function ENT:Think()
	if self.PhysicsData then
		self:Explode()
	end

	if self.Exploded then
		local pos = self:GetPos()

		self:Remove()
	end
end

function ENT:Explode()
	if self.Exploded then return end
	self.Exploded = true

	local owner = self:GetOwner()
	if owner:IsValidHuman() then
		local pos = self:GetPos()

		local source = self:ProjectileDamageSource()
		util.BlastDamagePlayer(source, owner, pos, 50, self.ProjDamage, DMG_ALWAYSGIB, self.ProjTaper)
	end
end

function ENT:PhysicsCollide(data, phys)
	self.PhysicsData = data
	self:NextThink(CurTime())
end