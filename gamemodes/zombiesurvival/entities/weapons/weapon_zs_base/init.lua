INC_SERVER()

AddCSLuaFile("animations.lua")

function SWEP:Think()
	if self:GetIronsights() and not self:GetOwner():KeyDown(IN_ATTACK2) then
		self:SetIronsights(false)
	end

	if self:GetReloadFinish() > 0 then
		if CurTime() >= self:GetReloadFinish() then
			self:FinishReload()
		end
	elseif self.IdleAnimation and self.IdleAnimation <= CurTime() then
		self.IdleAnimation = nil
		self:SendWeaponAnim(self.IdleActivity)
	end
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

function SWEP:ApplyPulse(hitent, attacker)
	local owner = self:GetOwner()
	if hitent:IsPlayer() then
		hitent:AddLegDamageExt(self.PulseStrength * owner.PulseWeaponSlowMul, attacker, attacker:GetActiveWeapon(), SLOWTYPE_PULSE)
	end
end

function SWEP:ApplyElectric(hitent, attacker, dmginfo)	
	if hitent:IsPlayer() then
		if math.random(1,10000) < (self.ElectricChance * 10000) then
			local target = hitent
			local shocked = {}
			
			if target then
				shocked[target] = true
				for i = 1,3 do
					local tpos = target:WorldSpaceCenter()

					for k, ent in pairs(ents.FindInSphere(tpos, 105)) do
						if not shocked[ent] and ent:IsValidLivingZombie() and not ent:GetZombieClassTable().NeverAlive then
							if WorldVisible(tpos, ent:NearestPoint(tpos)) then
								shocked[ent] = true
								target = ent

								timer.Simple(i * 0.15, function()
								if not ent:IsValid() or not ent:IsValidLivingZombie() or not WorldVisible(tpos, ent:NearestPoint(tpos)) then return end

									target:TakeSpecialDamage(dmginfo:GetDamage() / ((i * 0.5) + 1) * self.ElectricStrength, DMG_DISSOLVE, attacker, attacker:GetActiveWeapon())

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
							
					if math.random(1,10) <= 3 then
						break
					end
				end
			end
		end
	end
end

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

function SWEP:ApplyCold(hitent, attacker, inf)
	if hitent:IsPlayer() then
		hitent:AddLegDamageExt(self.ColdStrength, attacker, inf, SLOWTYPE_COLD)
	end
end

function SWEP:ApplyCorrosion(hitent)
	if self.CorrosionChance * 10000 > math.random(1, 10000) then
		if hitent:IsValid() and hitent:IsValidLivingZombie() then
			hitent:GiveStatus("zombiecorrosion", self.CorrosionDuration)
		end
	end
end

function SWEP:ApplyAcid(hitent, attacker)
	local owner = self:GetOwner()

	if self.AcidChance * 10000 > math.random(1, 10000) then
		if hitent:IsValid() and hitent:IsValidLivingZombie() then
			local Acid = hitent:GiveStatus("acid")
			if Acid and Acid:IsValid() then
			   Acid:AddDamage(self.AcidDamage)
			   Acid.Damager = owner
			end
		end
	end
end