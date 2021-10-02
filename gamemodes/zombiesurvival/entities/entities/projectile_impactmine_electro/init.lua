INC_SERVER()

ENT.NoNails = true
ENT.m_IsImpactMine = true

function ENT:Initialize()
	self:SetModel("models/props_combine/combine_mine01.mdl")
	self:PhysicsInitSphere(2)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetModelScale(0.45, 0)
	self:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)

	self:SetUseType(SIMPLE_USE)

	self.CreateTime = CurTime()

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:SetMass(0.1)
		phys:SetBuoyancyRatio(0.002)
		phys:EnableMotion(true)
		phys:Wake()
	end

	self:Fire("kill", "", 900)
end

function ENT:Hit(vHitPos, vHitNormal, eHitEntity, vOldVelocity)
	if self:GetHitTime() ~= 0 or not eHitEntity:IsWorld() then return end
	self:SetHitTime(CurTime())

	local owner = self:GetOwner()
	if not owner:IsValid() then owner = self end

	vHitPos = vHitPos or self:GetPos()
	vHitNormal = (vHitNormal or Vector(0, 0, -1)) * -0.1

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:EnableMotion(false)
		phys:Sleep()
	end

	local angle = vHitNormal:Angle()
	angle:RotateAroundAxis(angle:Right(), -90)

	self:SetMoveType(MOVETYPE_NONE)
	self:SetPos(vHitPos + vHitNormal)
	self:SetAngles(angle)

	self:EmitSound("weapons/slam/mine_mode.wav", 60)
end

local trace = {mask = MASK_SHOT}
function ENT:Think()
	local owner = self:GetOwner()
	if self.PhysicsData then
		self:Hit(self.PhysicsData.HitPos, self.PhysicsData.HitNormal, self.PhysicsData.HitEntity, self.PhysicsData.OurOldVelocity)
	end

	if self:IsActive() then
		trace.start = self:GetPos()
		trace.endpos = trace.start + self:GetUp() * self.Range
		trace.filter = self:GetCachedScanFilter()
		local ent = util.TraceLine(trace).Entity
		if ent:IsValidLivingZombie() and ent:Health() > 0 then -- Maybe they died from another mine in the same spot...
			self:Explode()
		end
	end

	self:NextThink(CurTime())
	return true
end

function ENT:FindTarget(pos, owner)
	local target
	local targethealth = 99999

	for k, ent in pairs(ents.FindInSphere(pos, 135 * (owner.FieldRangeMul or 1))) do
		if ent:IsValidLivingZombie() and not ent:GetZombieClassTable().NeverAlive then
			isheadcrab = ent:IsHeadcrab()
			if (isheadcrab or ent:Health() < targethealth) and TrueVisibleFilters(pos, ent:NearestPoint(pos), self, ent) then
				targethealth = ent:Health()
				target = ent

				if isheadcrab then
					break
				end

			end
		end
	end

	return target
end

function ENT:Explode()
	if self.Exploded then return end
	self.Exploded = true

	local owner = self:GetOwner()

	local pos = self:LocalToWorld(Vector(0, 0, 3))
	local target = self:FindTarget(pos, owner)
	if target then

		local shocked = {}

		local effectdata = EffectData()
			effectdata:SetOrigin(target:WorldSpaceCenter())
			effectdata:SetStart(pos)
			effectdata:SetEntity(self)
			util.Effect("tracer_zapper", effectdata)

			target:TakeDamage( self.ProjDamage, owner, self )

		for i = 1, 3 do
			local tpos = target:WorldSpaceCenter()

			for k, ent in pairs(ents.FindInSphere(tpos, 105)) do
				if not shocked[ent] and ent:IsValidLivingZombie() and not ent:GetZombieClassTable().NeverAlive then
					if WorldVisible(tpos, ent:NearestPoint(tpos)) then
						shocked[ent] = true
						target = ent

						target:TakeDamage( self.ProjDamage, owner, self )

						timer.Simple(i * 0.15, function()
							if not ent:IsValid() or not ent:IsValidLivingZombie() or not WorldVisible(tpos, ent:NearestPoint(tpos)) then return end

							local worldspace = ent:WorldSpaceCenter()
								effectdata = EffectData()
								effectdata:SetOrigin(worldspace)
								effectdata:SetStart(tpos)
								effectdata:SetEntity(target)
							util.Effect("tracer_zapper", effectdata)
						end)

						break
					end
				end
			end
		end
	end

	self:EmitSound("npc/roller/mine/rmine_tossed1.wav", 75, 160)
	self:EmitSound("npc/scanner/cbot_energyexplosion1.wav", 80, 110, 0.5, CHAN_AUTO)

	util.ScreenShake(pos, 100, 5, 0.5, 100)

	self:Remove()
end