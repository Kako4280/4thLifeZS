INC_SERVER()

function ENT:PlayerSet(pPlayer, bExists)
	pPlayer.HFire = self
end

function ENT:Think()
	local owner = self:GetOwner()

	if self:GetDamage() <= 0 then
		self:Remove()
		return
	end

	local dmgDealt = math.floor(1 + (self:GetDamage() ^ (1/3)))
	
	if self.Damager:IsValid() and self.Damager:IsPlayer() and self.Damager:Team() ~= owner:Team() and self.Damager then
		dmgDealt = dmgDealt + (self.Damager.AddedDamageFire or 0)
		
		if self.Damager:HasTrinket("redruby") then
			if not self.Damager.FireSpreadCD then
				self.Damager.FireSpreadCD = 0
			end
			
			if self.Damager.FireSpreadCD < CurTime() then
				if math.random(1,10000) < (500 + (self:GetDamage() * 10)) then
					self.Damager.FireSpreadCD = CurTime() + 30
					for k, v in pairs(ents.FindInSphere(owner:GetPos(), 40 + math.floor(self:GetDamage() ^ 0.9))) do
						if v:IsValidLivingZombie() then
							local fire = v:GiveStatus("human_fire")
							
							if fire and fire:IsValid() then
								fire:AddDamage(math.Round(5 + (self:GetDamage() / 3),0))
								fire.Damager = self.Damager
							end
						end
					end
				end
			end
		end
	end
	
	if owner:Health() > 0 then
		owner:TakeDamage(dmgDealt, self.Damager and self.Damager:IsValid() and self.Damager:IsPlayer() and self.Damager:Team() ~= owner:Team() and self.Damager or owner, self)
		self:AddDamage(-1)
	else
		self:Remove()
	end

	local ticktime = 0.25 --(owner.HFireSpeedMul or 1)
	self:NextThink(CurTime() + ticktime)
	return true
end
