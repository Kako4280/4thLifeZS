INC_SERVER()

AddCSLuaFile("cl_animations.lua")

ENT.TickTime = 0.6
ENT.Ticks = 19
ENT.Damage = 15
ENT.LegDamage = 8

function ENT:Initialize()
	self:SetModel("models/weapons/w_grenade.mdl")
	self:PhysicsInitSphere(2)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCustomCollisionCheck(true)
	self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)

	local owner = self:GetOwner()
	self.Ticks = self.Ticks + owner.GrenadeTicks


	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:SetMass(1)
		phys:SetBuoyancyRatio(0.01)
		phys:SetDamping(1.5, 4)
		phys:EnableDrag(false)
		phys:Wake()
	end

	self:SetGasEmit(false)
end

function ENT:PhysicsCollide(data, phys)
	self.PhysicsData = data
	self:NextThink(CurTime())
end

function ENT:Think()
	if not self.Collided and self.PhysicsData then
		self:Fire("corrode", "", self.TickTime)
		self:Fire("kill", "", self.TickTime * self.Ticks + 0.01)
		self:SetGasEmit(true)

		self.Collided = true
	end
end

function ENT:AcceptInput(name, activator, caller, arg)
	if name ~= "corrode" then return end

	local owner = self:GetOwner()
	self.Ticks = self.Ticks - 1

	if not owner:IsValidLivingHuman() then owner = self end

	local vPos = self:GetPos()

	if self.PointsMultiplier then
		POINTSMULTIPLIER = self.PointsMultiplier
	end

	for _, ent in pairs(ents.FindInSphere(vPos, self.Radius)) do
		if ent and (ent:IsValidLivingPlayer() and (ent:Team() == TEAM_UNDEAD or ent == owner)) and WorldVisible(vPos, ent:NearestPoint(vPos)) then
			if owner:IsValidLivingHuman() then
				ent:EmitSound("player/pl_burnpain" .. math.random(1,3) .. ".wav", 65, math.random(60, 70))
				ent:TakeSpecialDamage(self.Damage, DMG_GENERIC, owner, self)
				ent:AddLegDamageExt(self.LegDamage, owner, self, SLOWTYPE_PULSE)
			end
		end
	end

	if self.PointsMultiplier then
		POINTSMULTIPLIER = nil
	end

	if self.Ticks > 0 then
		self:Fire("corrode", "", self.TickTime)
	end

	return true
end