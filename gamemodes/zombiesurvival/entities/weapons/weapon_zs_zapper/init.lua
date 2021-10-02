INC_SERVER()

function SWEP:Deploy()
	gamemode.Call("WeaponDeployed", self:GetOwner(), self)

	self:SpawnGhost()

	return true
end

function SWEP:OnRemove()
	self:RemoveGhost()
end

function SWEP:Holster()
	self:RemoveGhost()
	return true
end

function SWEP:SpawnGhost()
	local owner = self:GetOwner()
	if owner and owner:IsValid() then
		owner:GiveStatus(self.GhostStatus)
	end
end

function SWEP:RemoveGhost()
	local owner = self:GetOwner()
	if owner and owner:IsValid() then
		owner:RemoveStatus(self.GhostStatus, false, true)
	end
end

function SWEP:CheckLimit()
	local dCount = 0
	local dLimited = {"zapper", "turret"}
	local owner = self:GetOwner()
	
	for k, v in pairs(ents.FindByClass("prop_*")) do
		if v:GetDTEntity(0) == owner or v:GetDTEntity(1) == owner then
			for k2, v2 in pairs(dLimited) do
				if v:IsValid() then
					if string.match(v:GetClass(), v2) then
						dCount = dCount + 1
						if dCount >= owner.DeployableLimit then
							PrintMessage(HUD_PRINTTALK, "Maximum deployables placed.")
							return false
						end
					end
				end
			end
		end
	end
	
	return true
end

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end
	if not self:CheckLimit() then return end

	local owner = self:GetOwner()

	local status = owner:GetStatus(self.GhostStatus)
	if not (status and status:IsValid()) then return end
	status:RecalculateValidity()
	if not status:GetValidPlacement() then return end

	local pos, ang = status:RecalculateValidity()
	if not pos or not ang then return end

	self:SetNextPrimaryAttack(CurTime() + self.Primary.Delay)

	local ent = ents.Create(self.DeployClass)
	if ent:IsValid() then
		ent:SetPos(pos)
		ent:SetAngles(ang)
		ent:Spawn()

		ent:SetObjectOwner(owner)
		ent:SetupDeployableSkillHealth()
		ent:SetMaxAmmo(math.floor(ent:GetMaxAmmo() * (owner.DeployableMaxAmmo or 1)))

		ent:EmitSound("npc/dog/dog_servo12.wav")

		ent:SetNextZap(CurTime() + 2)

		self:TakePrimaryAmmo(1)

		local stored = owner:PopPackedItem(ent:GetClass())
		if stored then
			ent:SetObjectHealth(stored[1])
		end

		local ammo = math.min(owner:GetAmmoCount("pulse"), 150)
		ent:SetAmmo(ammo)
		owner:RemoveAmmo(ammo, "pulse")

		ent.DeployableAmmo = self.Primary.Ammo
		ent.Damage = self.Primary.Damage
		ent.LegDamage = self.LegDamage
		ent.SWEP = self:GetClass()

		if self:GetPrimaryAmmoCount() <= 0 then
			owner:StripWeapon(self:GetClass())
		end
	end
end

function SWEP:Think()
	local count = self:GetPrimaryAmmoCount()
	if count ~= self:GetReplicatedAmmo() then
		self:SetReplicatedAmmo(count)
		self:GetOwner():ResetSpeed()
	end
end
