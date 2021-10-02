INC_SERVER()

function SWEP:ApplyMeleeDamage(ent, trace, damage)
	if ent:IsPlayer() then
		ent:GiveStatus("dimvision", 4)
		local gt = ent:GiveStatus("frost", 4)
		local owner = self:GetOwner()

		if gt and gt:IsValid() then
			gt.Applier = owner
		end
		ent:AddLegDamageExt(12, owner, self, SLOWTYPE_COLD)
	end

	self.BaseClass.ApplyMeleeDamage(self, ent, trace, damage)
end
