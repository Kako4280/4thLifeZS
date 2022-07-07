INC_SERVER()

ENT.HealthLock = 0

function ENT:Initialize()
	self:DrawShadow(false)
	self:SetRenderFX(kRenderFxDistort)

	self:SetModel("models/props_wasteland/medbridge_post01.mdl")
	self:PhysicsInitBox(Vector(-16.285, -16.285, -0.29) * self.ModelScale, Vector(16.285, 16.285, 104.29) * self.ModelScale)
	self:SetUseType(SIMPLE_USE)
	self.AreaCheck = 5

	self:CollisionRulesChanged()

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:EnableMotion(false)
		phys:Wake()
	end

	self:SetSigilHealthBase(self.MaxHealth)
	self:SetSigilHealthRegen(self.HealthRegen)
	self:SetSigilLastDamaged(0)

	local ent = ents.Create("prop_prop_blocker")
	if ent:IsValid() then
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		ent:Spawn()
		ent:SetOwner(self)
		--ent:SetParent(self) -- Prevents collisions
		self:DeleteOnRemove(ent)
	end
end

function ENT:Use(pl)
	if pl.NextSigilTPTry and pl.NextSigilTPTry >= CurTime() then return end

	if pl:Team() == TEAM_HUMAN and pl:Alive() and not self:GetSigilCorrupted() then
		local tpexist = pl:GetStatus("sigilteleport")
		if tpexist and tpexist:IsValid() then return end

		if GAMEMODE:NumUncorruptedSigils() >= 2 then
			local status = pl:GiveStatus("sigilteleport")
			if status:IsValid() then
				status:SetFromSigil(self)
				status:SetEndTime(CurTime() + 2 * (pl.SigilTeleportTimeMul or 1))

				pl.NextSigilTPTry = CurTime() + 1
			end
		end
	end
end

function ENT:OnTakeDamage(dmginfo)
	if self:GetSigilHealth() <= 0 or dmginfo:GetDamage() <= 0 then return end

	if dmginfo:GetAttacker() == self then
		local oldhealth = self:GetSigilHealth()
		self:SetSigilLastDamaged(CurTime())
		self:SetSigilHealthBase(oldhealth - dmginfo:GetDamage())

		if self:GetSigilHealth() <= 0 then
			if self:GetSigilCorrupted() then
				gamemode.Call("PreOnSigilUncorrupted", self, dmginfo)
				self:SetSigilCorrupted(false)
				self:SetSigilHealthBase(self.MaxHealth)
				self:SetSigilLastDamaged(0)
				gamemode.Call("OnSigilUncorrupted", self, dmginfo)
			else
				gamemode.Call("PreOnSigilCorrupted", self, dmginfo)
				self:SetSigilCorrupted(true)
				self:SetSigilHealthBase(self.MaxHealth)
				self:SetSigilLastDamaged(0)
				gamemode.Call("OnSigilCorrupted", self, dmginfo)
			end
		end
	end
end

function ENT:UpdateTransmitState()
	return TRANSMIT_ALWAYS
end

function ENT:Think()
	local x = CurTime()
	
	if self.AreaCheck < x then
		local plCount = 0
		local plTable = {}
		for k, v in pairs(ents.FindInSphere(self:GetPos(), 100)) do
			if GAMEMODE:GetWave() <= 0 then break end
			if v:IsPlayer() then
				if self:GetSigilCorrupted() then
					if v:Team() == TEAM_HUMAN then
						plCount = plCount + 1
						table.insert(plTable, v)
					elseif v:Team() == TEAM_UNDEAD then
						plCount = plCount - 1
					end
				else
					if v:Team() == TEAM_HUMAN then
						plCount = plCount - 1
					elseif v:Team() == TEAM_UNDEAD then
						plCount = plCount + 1
						table.insert(plTable, v)
					end
				end
			end
		end
		
		if plCount > 0 then
			self:TakeDamage(40 * plCount, self)
			
			for _, v in pairs(plTable) do
				if v:Team() == TEAM_HUMAN then
					v:AddPoints(0.2 * plCount, self)
				elseif v:Team() == TEAM_UNDEAD then
					v:SetNWFloat("zscore", v:GetNWFloat("zscore") + (2 * plCount))
				end
			end
		end
		
		self.AreaCheck = x + 1
	end
	
		-- if attacker:IsPlayer() then
		-- if ent:IsValid() and ent:GetClass() == "prop_obj_sigil" and attacker:Team() == TEAM_UNDEAD and not ent:GetSigilCorrupted() then
			-- local ZScore = math.Round(dmginfo:GetDamage() / 11, 1)
			-- attacker:SetNWFloat("zscore", attacker:GetNWFloat("zscore") + ZScore)
		-- end
	-- end
end