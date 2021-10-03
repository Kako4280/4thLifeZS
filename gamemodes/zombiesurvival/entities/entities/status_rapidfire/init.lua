INC_SERVER()

function ENT:SetDie(fTime)
	if fTime == 0 or not fTime then
		self.DieTime = 0
	elseif fTime == -1 then
		self.DieTime = 999999999
	else
		self.DieTime = CurTime() + fTime
		self:SetDuration(fTime)
	end
end

function ENT:EntityTakeDamage(ent, dmginfo)
	local attacker = dmginfo:GetAttacker()
	if attacker ~= self:GetOwner() then return end

	if attacker:IsValid() and attacker:IsPlayer() and attacker:Team() == TEAM_HUMAN --[[and inflictor == wep and wep.IsMelee]] then
		local dmg = dmginfo:GetDamage()
		local rapidfire = dmg * 0.10


		if self.Applier and self.Applier:IsValidLivingHuman() and ent:IsPlayer() and ent:Team() == TEAM_ZOMBIE then
			local applier = self.Applier

			ent.DamagedBy[applier] = (ent.DamagedBy[applier] or 0) + rapidfire
			applier.StrengthBoostDamage = (applier.StrengthBoostDamage or 0) + rapidfire
			local points = (rapidfire / ent:GetMaxHealth() * ent:GetZombieClassTable().Points) / 1.5
			applier.PointQueue = applier.PointQueue + points * 1.15

			local pos = ent:GetPos()
			pos.z = pos.z + 32
			applier.LastDamageDealtPos = pos
			applier.LastDamageDealtTime = CurTime()
		end
	end
end