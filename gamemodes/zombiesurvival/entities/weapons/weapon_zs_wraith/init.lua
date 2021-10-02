INC_SERVER()

SWEP.MoanDelay = 3

function SWEP:Launch()
	local owner = self:GetOwner()
	if CurTime() <= self:GetNextPrimaryFire() or (owner.ShadeShield and owner.ShadeShield:IsValid()) then return end

	for _, ent in pairs(ents.FindByClass(self.ShadeControl)) do
		if ent:IsValid() and ent:GetOwner() == owner then
			local obj = ent:GetParent()
			if obj:IsValid() then
				self:SetNextSecondaryFire(CurTime() + 0.3)

				owner:DoAttackEvent()

				local vel = owner:GetAimVector() * math.random(1000,1500)

				local phys = obj:GetPhysicsObject()
				if phys:IsValid() and phys:IsMoveable() and phys:GetMass() <= 300 then
					phys:Wake()
					phys:SetVelocity(vel)
					phys:SetMass(20)
					obj:SetPhysicsAttacker(owner)
					phys:AddGameFlag(FVPHYSICS_WAS_THROWN)

					obj.LastShadeLaunch = CurTime()
				end
			end

			ent:Remove()
		end
	end
end

function SWEP:SecondaryAttack()
	if not self:CanGrab() then return end

	local owner = self:GetOwner()

	local vStart = owner:GetShootPos()
	local vEnd = vStart + owner:GetForward() * 40

	local tr = util.TraceHull({start=vStart, endpos=vEnd, filter=owner, mins=owner:OBBMins()/2, maxs=owner:OBBMaxs()/2})
	self:SetNextPrimaryFire(CurTime() + 0.4)
	self:SetNextSecondaryFire(CurTime() + 0.3)

	local rock = ents.Create(self.ShadeProjectile)
	if rock:IsValid() then
		local pos = owner:GetPos() - owner:GetForward() * 5
		if not tr.Hit then
			pos = pos + owner:GetForward() * 30
		end

		rock:SetPos(pos)
		rock:SetOwner(owner)
		rock:Spawn()
		rock:EnableCustomCollisions(true)
		rock:SetDTInt(0, math.random(self.ProjectileDamageMin, self.ProjectileDamageMax))
		local con = ents.Create(self.ShadeControl)
		if con:IsValid() then
			con:Spawn()
			con:SetOwner(owner)
			con:AttachTo(rock)
			rock.Control = con

			util.ScreenShake(owner:GetPos(), 3, 1, 0.75, 400)

			con:EmitSound("physics/concrete/concrete_break3.wav", 85, 60)
			rock:EmitSound(")weapons/physcannon/physcannon_claws_close.wav")

			owner.LastRangedAttack = CurTime()
		end
			
		timer.Simple(1, function() self:Launch() end)
	end
end

function SWEP:CanGrab()
	local owner = self:GetOwner()
	if CurTime() <= self:GetNextSecondaryFire() or (owner.ShadeShield and owner.ShadeShield:IsValid()) then return end
	self:SetNextSecondaryFire(CurTime() + 0.1)

	for _, ent in pairs(ents.FindByClass(self.ShadeControl)) do
		if ent:IsValid() and ent:GetOwner() == owner then
			ent:Remove()
			return
		end
	end

	return true
end

--[[function SWEP:Think()
	self.BaseClass.Think(self)

	self:BarricadeGhostingThink()
end

function SWEP:Holster()
	if self:GetOwner():IsValid() then
		self:GetOwner():SetBarricadeGhosting(false)
	end

	return self.BaseClass.Holster(self)
end]]
