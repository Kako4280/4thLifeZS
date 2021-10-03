INC_SERVER()

function ENT:PlayerSet(pPlayer, bExists)
	pPlayer.Acid = self
end

function ENT:Think()
	local owner = self:GetOwner()

	if self:GetDamage() <= 0 then
		self:Remove()
		return
	end

	local dmg = self:GetDamage()

	owner:TakeDamage(math.min(dmg, 25), self.Damager and self.Damager:IsValid() and self.Damager:IsPlayer() and self.Damager:Team() ~= owner:Team() and self.Damager or owner, self)
	self:AddDamage(-2)

	local moving = owner:GetVelocity():LengthSqr() >= 19600 --140^2
	local ticktime = 0.75 --(owner.HBleedSpeedMul or 1)
	self:NextThink(CurTime() + ticktime)
	return true
end
