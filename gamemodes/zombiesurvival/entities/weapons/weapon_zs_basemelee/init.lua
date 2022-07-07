INC_SERVER()

AddCSLuaFile("animations.lua")

function SWEP:ServerMeleeHitEntity(tr, hitent, damagemultiplier)
	if not hitent or not hitent:IsValid() then return end

	

	local phys = hitent:GetPhysicsObject()
	if hitent:GetMoveType() == MOVETYPE_VPHYSICS and phys:IsValid() and phys:IsMoveable() then
		hitent:SetPhysicsAttacker(self:GetOwner())
	end
end

function SWEP:ServerMeleePostHitEntity(tr, hitent, damagemultiplier)
	local owner = self:GetOwner()

	if owner.GlassWeaponShouldBreak and hitent:IsPlayer() and not self.NoGlassWeapons and owner:IsSkillActive(SKILL_GLASSWEAPONS) and owner.GlassWeaponShouldBreak then
		local effectdata = EffectData()
		effectdata:SetOrigin(owner:EyePos())
		effectdata:SetEntity(owner)
		util.Effect("weapon_shattered", effectdata, true, true)

		owner:StripWeapon(self:GetClass())
	end

	if SERVER then
		if hitent:IsValidZombie() and hitent:Alive() then
			if self.Bleed and not hitent:GetZombieClassTable().BleedImmune then
				self:ApplyBleeding(hitent)
			end
				
			if self.Pulse and not hitent:GetZombieClassTable().PulseImmune then
				self:ApplyPulse(hitent, attacker)
			end
				
			if self.Electric and not hitent:GetZombieClassTable().ElectricImmune then
				self:ApplyElectric(hitent, attacker, dmginfo)
			end
				
			if self.Burn and not hitent:GetZombieClassTable().BurnImmune then
				self:ApplyBurn(hitent, attacker)
			end
				
			if self.Cold and not hitent:GetZombieClassTable().ColdImmune then
				self:ApplyCold(hitent, attacker, inf)
			end
		end
	end
end

function SWEP:ServerHitFleshEffects(hitent, tr, damagemultiplier)
	local owner = self:GetOwner()
	local damage = self.MeleeDamage

	if isnumber(damagemultiplier) then damage = damage * damagemultiplier end

	if hitent:IsValid() and hitent:IsPlayer() and hitent:Team() == owner:Team() then return end

	util.Blood(tr.HitPos, math.Rand(damage * 0.25, damage * 0.6), (tr.HitPos - owner:GetShootPos()):GetNormalized(), math.min(400, math.Rand(damage * 6, damage * 12)), true)
end

function SWEP:ApplyBleeding(hitent)
	local owner = self:GetOwner()
	
	if hitent:IsPlayer() then
		local bleed = hitent:GiveStatus("human_bleed")
		if bleed and bleed:IsValid() then
			bleed:AddDamage(self.BleedDamage)
			bleed.Damager = owner
		end
	end
end

function SWEP:ApplyPulse(hitent)
	local owner = self:GetOwner()
	local PulseSlowPower = self.PulseSlowPower * owner.PulseWeaponSlowMul

	if hitent:IsValidLivingZombie() then
		hitent:AddLegDamageExt(PulseSlowPower, owner, self, SLOWTYPE_PULSE)
	end
end

-- function SWEP:ApplyElectric(hitent, attacker, dmginfo)	
	-- if hitent:IsPlayer() then
		-- if math.random(1,10000) < (self.ElectricChance * 10000) then
			-- local target = hitent
			-- local shocked = {}
			
			-- if target then
				-- shocked[target] = true
				-- for i = 1,3 do
					-- local tpos = target:WorldSpaceCenter()

					-- for k, ent in pairs(ents.FindInSphere(tpos, 105)) do
						-- if not shocked[ent] and ent:IsValidLivingZombie() and not ent:GetZombieClassTable().NeverAlive then
							-- if WorldVisible(tpos, ent:NearestPoint(tpos)) then
								-- shocked[ent] = true
								-- target = ent

								-- timer.Simple(i * 0.15, function()
								-- if not ent:IsValid() or not ent:IsValidLivingZombie() or not WorldVisible(tpos, ent:NearestPoint(tpos)) then return end

									-- target:TakeSpecialDamage(dmginfo:GetDamage() / ((i * 0.5) + 1) * self.ElectricStrength, DMG_DISSOLVE, attacker, attacker:GetActiveWeapon())

									-- local worldspace = ent:WorldSpaceCenter()
									-- effectdata = EffectData()
										-- effectdata:SetOrigin(worldspace)
										-- effectdata:SetStart(tpos)
										-- effectdata:SetEntity(target)
									-- util.Effect("tracer_zapper", effectdata)
								-- end)

								-- break
							-- end
						-- end
					-- end
							
					-- if math.random(1,10) <= 3 then
						-- break
					-- end
				-- end
			-- end
		-- end
	-- end
-- end

function SWEP:ApplyBurn(hitent, attacker)
	if self.BurnChance * 10000 > math.random(1, 10000) then
		local owner = self:GetOwner()
		
		if hitent:IsPlayer() then
			local fire = hitent:GiveStatus("human_fire")
			if fire and fire:IsValid() then
				fire:AddDamage(math.Round((self.BurnDamage * math.Rand(0.5,2)) + (owner.FireAddedDuration or 0),0))
				fire.Damager = owner
			end
		end
	end
end

function SWEP:ApplyCold(hitent)
	local owner = self:GetOwner()
	local IceSlowPower = self.IceSlowPower

	if hitent:IsValidLivingZombie() then
	   hitent:AddLegDamageExt(IceSlowPower, owner, self, SLOWTYPE_COLD)
	end
end
