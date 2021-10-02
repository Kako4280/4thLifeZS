INC_SERVER()

INC_SERVER()

local function RefreshZapperOwners(pl)
	for _, ent in pairs(ents.FindByClass("prop_zapper*")) do
		if ent:IsValid() and ent:GetObjectOwner() == pl then
			ent:ClearObjectOwner()
		end
	end
end
hook.Add("PlayerDisconnected", "Zapper.PlayerDisconnected", RefreshZapperOwners)
hook.Add("OnPlayerChangedTeam", "Zapper.OnPlayerChangedTeam", RefreshZapperOwners)

function ENT:Initialize()
	self:SetModel("models/props_c17/utilityconnecter006c.mdl")
	self:SetModelScale(0.75, 0)
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_WORLD)
	self:SetUseType(SIMPLE_USE)

	self:CollisionRulesChanged()

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:SetMaterial("metal")
		phys:EnableMotion(false)
		phys:Wake()
	end

	self:SetMaxObjectHealth(150)
	self:SetObjectHealth(self:GetMaxObjectHealth())

	self.NextZapCheck = CurTime()
end

function ENT:SetObjectHealth(health)
	self:SetDTFloat(1, health)
	if health <= 0 and not self.Destroyed then
		self.Destroyed = true

		if self:GetObjectOwner():IsValidLivingHuman() then
			self:GetObjectOwner():SendDeployableLostMessage(self)
		end

		local ent = ents.Create("prop_physics")
		if ent:IsValid() then
			ent:SetModel(self:GetModel())
			ent:SetMaterial(self:GetMaterial())
			ent:SetAngles(self:GetAngles())
			ent:SetPos(self:GetPos())
			ent:SetSkin(self:GetSkin() or 0)
			ent:SetColor(self:GetColor())
			ent:Spawn()
			ent:Fire("break", "", 0)
			ent:Fire("kill", "", 0.1)
		end

		local pos = self:LocalToWorld(self:OBBCenter())

		local effectdata = EffectData()
			effectdata:SetOrigin(pos)
		util.Effect("Explosion", effectdata, true, true)

		local amount = math.ceil(self:GetAmmo() * 0.5)
		while amount > 0 do
			local todrop = math.min(amount, 50)
			amount = amount - todrop
			ent = ents.Create("prop_ammo")
			if ent:IsValid() then
				local heading = VectorRand():GetNormalized()
				ent:SetAmmoType("pulse")
				ent:SetAmmo(todrop)
				ent:SetPos(pos + heading * 8)
				ent:SetAngles(VectorRand():Angle())
				ent:Spawn()

				local phys = ent:GetPhysicsObject()
				if phys:IsValid() then
					phys:ApplyForceOffset(heading * math.Rand(8000, 32000), pos)
				end
			end
		end
	end
end

function ENT:OnTakeDamage(dmginfo)
	if dmginfo:GetDamage() <= 0 then return end

	self:TakePhysicsDamage(dmginfo)

	local attacker = dmginfo:GetAttacker()
	if not (attacker:IsValid() and attacker:IsPlayer() and attacker:Team() == TEAM_HUMAN) then
		self:SetObjectHealth(self:GetObjectHealth() - dmginfo:GetDamage())
		self:ResetLastBarricadeAttacker(attacker, dmginfo)
	end
end

function ENT:Use(activator, caller)
	if self.Removing or not activator:IsPlayer() or self:GetMaterial() ~= "" then return end
	
	local numDep = 0
	limitedDeps = {"prop_zapper", "prop_zapper_q1", "prop_zapper_q2", "prop_zapper_q3", "prop_zapper_arc", "prop_zapper_arc_q1", "prop_zapper_arc_q2", "prop_zapper_arc_q3", "prop_gunturret", "prop_gunturret_rocket", "prop_gunturret_buckshot", "prop_gunturret_assault"}
	for k, v in pairs(ents.FindByClass("Prop_*")) do
		if activator == v:GetOwner() and table.HasValue(limitedDeps, v:GetClass()) then
			numDep = numDep + 1
		end
	end

	if activator:Team() == TEAM_HUMAN then
		if self:GetObjectOwner():IsValid() then
			if activator:GetInfo("zs_nousetodeposit") == "0" then
				local curammo = self:GetAmmo()
				local togive = math.min(math.min(15, activator:GetAmmoCount("pulse")), self.MaxAmmo - curammo)
				if togive > 0 then
					self:SetAmmo(curammo + togive)
					activator:RemoveAmmo(togive, "pulse")
					activator:RestartGesture(ACT_GMOD_GESTURE_ITEM_GIVE)
					self:EmitSound("npc/scanner/combat_scan1.wav", 60, 250)
				end
			end
		elseif numDep >= 3 then
			activator:PrintMessage(HUD_PRINTTALK, "Deployable could not be claimed, limit reached.")
		elseif numDep < 3 then
			activator:PrintMessage(HUD_PRINTTALK, "Claimed deployable (" .. (numDep + 1) .. "/3).")
			self:SetOwner(activator)
			self:SetObjectOwner(activator)
			self:GetObjectOwner():SendDeployableClaimedMessage(self)
		end
	end
end

function ENT:AltUse(activator, tr)
	self:PackUp(activator)
end

function ENT:OnPackedUp(pl)
	pl:GiveEmptyWeapon(self.SWEP)
	pl:GiveAmmo(1, self.DeployableAmmo)

	pl:PushPackedItem(self:GetClass(), self:GetObjectHealth())
	pl:GiveAmmo(self:GetAmmo(), "pulse")

	self:Remove()
end

function ENT:FindZapperTarget(pos, owner)
	local target
	local targethealth = 99999
	local isheadcrab

	for k, ent in pairs(ents.FindInSphere(pos, 1200 * (owner.FieldRangeMul or 1))) do
		if ent:IsValidLivingZombie() and not ent:GetZombieClassTable().NeverAlive then
			isheadcrab = ent:IsHeadcrab()
			if (isheadcrab or ent:Health() < targethealth) and TrueVisibleFilters(pos, ent:NearestPoint(pos), self, ent) then
				targethealth = ent:Health()
				target = ent

				if isheadcrab then
					break
				end
			end
		end
	end

	return target
end

function ENT:HitTarget(ent, damage, owner)
	ent:AddLegDamageExt(self.LegDamage, owner, self, SLOWTYPE_PULSE)

	if self.PointsMultiplier then
		POINTSMULTIPLIER = self.PointsMultiplier
	end
	ent:TakeSpecialDamage(damage, DMG_SHOCK, owner, self)
	if self.PointsMultiplier then
		POINTSMULTIPLIER = nil
	end

	self:EmitSound("ambient/office/zap1.wav", 70, 160, 0.6, CHAN_AUTO)
end

function ENT:Think()
	if self.Destroyed then
		self:Remove()
	end

	if CurTime() < self:GetNextZap() or CurTime() < self.NextZapCheck then return end

	local curammo = self:GetAmmo()
	local owner = self:GetObjectOwner()
	if curammo >= 0 and owner:IsValid() then
		self.NextZapCheck = CurTime() + 0.05

		local pos = self:LocalToWorld(Vector(0, 0, 29))
		local target = self:FindZapperTarget(pos, owner)

		local shocked = {}
		if target then
			self:SetAmmo(curammo - 0)

			if self:GetAmmo() == 0 then
				owner:SendDeployableOutOfAmmoMessage(self)
			end

			self:SetNextZap(CurTime() + 0.5 * (owner.FieldDelayMul or 1))
			self:HitTarget(target, self.Damage, owner)

			local effectdata = EffectData()
				effectdata:SetOrigin(target:WorldSpaceCenter())
				effectdata:SetStart(pos)
				effectdata:SetEntity(self)
			util.Effect("tracer_zapper", effectdata)

			shocked[target] = true
			for i = 1, 3 do
				local tpos = target:WorldSpaceCenter()

				for k, ent in pairs(ents.FindInSphere(tpos, 600)) do
					if not shocked[ent] and ent:IsValidLivingZombie() and not ent:GetZombieClassTable().NeverAlive then
						if WorldVisible(tpos, ent:NearestPoint(tpos)) then
							shocked[ent] = true
							target = ent

							timer.Simple(i * 0.15, function()
								if not ent:IsValid() or not ent:IsValidLivingZombie() or not WorldVisible(tpos, ent:NearestPoint(tpos)) then return end

								self:HitTarget(ent, self.Damage / (i + 0.5), owner)

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
			end
		end
	end

	self:NextThink(CurTime())
	return true
end
