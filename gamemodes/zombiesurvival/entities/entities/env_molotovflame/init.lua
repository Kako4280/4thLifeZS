INC_SERVER()

ENT.TickTime = 0.45
ENT.Ticks = 12
ENT.Damage = 7

function ENT:Initialize()
	self:DrawShadow(false)

	self:Fire("burn", "", self.TickTime)
	self:Fire("kill", "", self.TickTime * self.Ticks + 0.01)

	self:DropToFloor()
end

function ENT:AcceptInput(name, activator, caller, arg)
	if name ~= "burn" then return end

	self.Ticks = self.Ticks - 1

	local owner = self:GetOwner()
	if not owner:IsValidLivingHuman() then owner = self end

	local vPos = self:GetPos()
	for _, ent in pairs(ents.FindInSphere(vPos, self.Radius)) do
		if ent and (ent:IsValidLivingPlayer() and (ent:Team() == TEAM_UNDEAD or ent == owner)) and WorldVisible(vPos, ent:NearestPoint(vPos)) then
			if 4000 > math.random(1, 10000) then		
				if ent:IsPlayer() then
					local fire = ent:GiveStatus("human_fire")
					if fire and fire:IsValid() then
						fire:AddDamage(math.Round(7 * math.Rand(0.5,2),0))
						fire.Damager = owner
					end
				end
			end

			if owner:IsValidLivingHuman() then
				ent:AddLegDamage(7)
				ent:TakeSpecialDamage(self.Damage, DMG_BURN, owner, self)
			end
		end
	end

	if self.Ticks > 0 then
		self:Fire("burn", "", self.TickTime)
	end

	return true
end
