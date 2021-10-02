INC_SERVER()

function ENT:Initialize()
	self:SetModel("models/props_junk/rock001a.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
	self:SetCustomCollisionCheck(true)

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:SetMass(20)
		phys:EnableMotion(true)
		phys:Wake()
	end
end

function ENT:Think()
	if self.PhysicsData then
		self:Hit(self.PhysicsData.HitPos, self.PhysicsData.HitNormal, self.PhysicsData.HitEntity)
	end

	if self.Exploded then
		self:Remove()
	end
end

function ENT:Hit(vHitPos, vHitNormal, ent)
	if self.Exploded then return end
	self.Exploded = true

	local owner = self:GetOwner()
	if not owner:IsValid() then owner = self end

	vHitPos = vHitPos or self:GetPos()
	vHitNormal = vHitNormal or Vector(0, 0, 1)

	if ent:IsValid() then
		if not ent:IsPlayer() or (ent:IsPlayer() and ent:Team() ~= TEAM_UNDEAD) then
			local a = self:GetDTInt(0)
			ent:TakeSpecialDamage(a, DMG_GENERIC, owner, self)
		end
	end
	
	for k, v in pairs(ents.FindInSphere(vHitPos, 30)) do
		if v:IsValid() and v ~= ent then
			if not v:IsPlayer() then
				local dmg = math.Round(self:GetDTInt(0) * 0.75 * (0.97 ^ vHitPos:Distance(v:GetPos())),0)
				v:TakeSpecialDamage(dmg, DMG_GENERIC, owner, self)
				owner:SetNWFloat("zscore", owner:GetNWFloat("zscore") + (dmg / 25))
			end
		end
	end
end

function ENT:PhysicsCollide(data, phys)
	if self.Control:IsValid() then return end

	self.PhysicsData = data
	self:NextThink(CurTime())
end
