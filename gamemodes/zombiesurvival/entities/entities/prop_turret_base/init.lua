INC_SERVER()

ENT.LastHitSomething = 0
ENT.TurretDeployableAmmo = "thumper"
ENT.LastHitPeriod = 0.5
ENT.Hitbox = "prop_hitbox_gunturret"

local function RefreshTurretOwners(pl)
	for _, ent in pairs(ents.FindByClass("prop_turret*")) do
		if ent:IsValid() and ent:GetObjectOwner() == pl then
			ent:ClearObjectOwner()
			ent:ClearTarget()
		end
	end
end
hook.Add("PlayerDisconnected", "GunTurret.PlayerDisconnected", RefreshTurretOwners)
hook.Add("OnPlayerChangedTeam", "GunTurret.OnPlayerChangedTeam", RefreshTurretOwners)

function ENT:Initialize()
	self:SetModel("models/Combine_turrets/Floor_turret.mdl")
	self:SetModelScale(self.ModelScale or 1, 0)
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_WORLD)
	self:SetUseType(SIMPLE_USE)

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:SetMass(50)
		phys:EnableMotion(false)
		phys:Wake()
	end

	self:SetMaxAmmo(self.MaxAmmo * (self:GetObjectOwner().DeployableMaxAmmo or 1))
	self:SetAmmo(self.DefaultAmmo)
	self:SetMaxObjectHealth(self.MaxHealth)
	self:SetObjectHealth(self:GetMaxObjectHealth())
	self:SetScanSpeed(1)
	self:SetScanMaxAngle(1 * self.ScanAngle)

	local ent = ents.Create(self.Hitbox)
	if ent:IsValid() then
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		ent:SetOwner(self)
		ent:SetParent(self)
		ent:Spawn()

		self:DeleteOnRemove(ent)
		self.Hitbox = ent
		self:SetTurretHitbox(ent)
	end

	self:SetupPlayerSkills()

	hook.Add("SetupPlayerVisibility", self, self.SetupPlayerVisibility)
end

function ENT:SetupPlayerSkills()
	local owner = self:GetObjectOwner()
	local scanspeed = 1
	local scanangle = 1

	if owner:IsValid() then
		scanspeed = scanspeed * (owner.TurretScanSpeedMul or 1) * (self.ScanSpeed or 1)
		scanangle = scanangle * math.max((owner.TurretScanAngleMul or 1) + (self.ScanAngle or 1) - 1, 0)
	end

	self:SetScanSpeed(scanspeed)
	self:SetScanMaxAngle(scanangle)

	self:SetupDeployableSkillHealth("TurretHealthMul")
end

function ENT:SetObjectHealth(health)
	self:SetDTFloat(3, health)
	if health <= 0 and not self.Destroyed then
		self.Destroyed = true

		local pos = self:LocalToWorld(self:OBBCenter())

		local effectdata = EffectData()
			effectdata:SetOrigin(pos)
		util.Effect("Explosion", effectdata, true, true)

		if self:GetObjectOwner():IsValidLivingHuman() then
			self:GetObjectOwner():SendDeployableLostMessage(self)
		end

		local amount = math.ceil(self:GetAmmo() * 0.5)
		while amount > 0 do
			local todrop = math.min(amount, 50)
			amount = amount - todrop
			local ent = ents.Create("prop_ammo")
			if ent:IsValid() then
				local heading = VectorRand():GetNormalized()
				ent:SetAmmoType(self.AmmoType)
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

local TEMPTURRET
function BulletCallback(attacker, tr, dmginfo)
	local ent = tr.Entity
	local inflictor = dmginfo:GetInflictor()
	if ent:IsValid() then
		if TEMPTURRET:GetTarget() == ent and ent:IsPlayer() and ent:Team() == TEAM_UNDEAD then
			TEMPTURRET.LastHitSomething = CurTime()
		end

		dmginfo:SetInflictor(TEMPTURRET)
		
		if attacker:IsValid() then
			if attacker:IsSkillActive(SKILL_TECH_OFFENSE_FIRE_TURRET_ENABLE) and inflictor.Burn then
				if ent:IsValidLivingZombie() then
					if 0.05 * (attacker.FireIncreasedChance or 1) * 10000 > math.random(1, 10000) then
						if ent:IsPlayer() then
							local fire = ent:GiveStatus("human_fire")
							if fire and fire:IsValid() then
								fire:AddDamage(math.Round((4 * math.Rand(0.5,2)) + ((attacker.FireAddedDuration or 1) * 0.5),0))
								fire.Damager = attacker
							end
						end
					end
				end
			end
		end		
	end
end

function ENT:PlayShootSound()
	-- Handled by the looping sound.
end

function ENT:FireTurret(src, dir)
	if self:GetNextFire() <= CurTime() then
		local curammo = self:GetAmmo()
		local owner = self:GetObjectOwner()
		local twinvolley = self:GetManualControl() and owner:IsSkillActive(SKILL_TWINVOLLEY)
		if curammo > (twinvolley and 1 or 0) then
			self:SetNextFire(CurTime() + self.FireDelay * (twinvolley and 1.5 or 1) * (owner.DeployableDelayMul or 1))
			self:SetAmmo(curammo - math.Round((twinvolley and 2 or 1) * (owner.DeployableOffenseEfficiency or 1), 3))

			if self:GetAmmo() < 1 then
				owner:SendDeployableOutOfAmmoMessage(self)
			end

			self:PlayShootSound()

			TEMPTURRET = self
			self:FireBulletsLua(src, dir, self.Spread, self.NumShots * (twinvolley and 2 or 1), math.Round(self.Damage * (owner.DeployableDamageMul or 1), 0), self:GetObjectOwner(), nil, nil, BulletCallback, nil, nil, nil, nil, self)
		else
			self:SetNextFire(CurTime() + 2)
			self:EmitSound("npc/turret_floor/die.wav")
		end
	end
end

function ENT:Think()
	if self.Destroyed then
		self:Remove()
		return
	end

	self:CalculatePoseAngles()

	local owner = self:GetObjectOwner()
	if owner:IsValid() and self:GetAmmo() > 0 and self:GetMaterial() == "" then
		if self:GetManualControl() then
			if owner:KeyDown(IN_ATTACK) then
				if not self:IsFiring() then self:SetFiring(true) end
				self:FireTurret(self:ShootPos(), self:GetGunAngles():Forward())
			elseif self:IsFiring() then
				self:SetFiring(false)
			end

			local target = self:GetTarget()
			if target:IsValid() then self:ClearTarget() end
		else
			if self:IsFiring() then self:SetFiring(false) end
			local target = self:GetTarget()
			if target:IsValid() then
				if self:IsValidTarget(target) and CurTime() < self.LastHitSomething + self.LastHitPeriod then
					self:FireTurret(self:ShootPos(), (self:GetTargetPos(target) - self:ShootPos()):GetNormalized())
				else
					self:ClearTarget()
					self:EmitSound("npc/turret_floor/deploy.wav")
				end
			else
				target = self:SearchForTarget()
				if target then
					self:SetTarget(target)
					self:SetTargetReceived(CurTime())
					self:EmitSound("npc/turret_floor/active.wav")
				end
			end
		end
	elseif self:IsFiring() then
		self:SetFiring(false)
	end

	self:NextThink(CurTime())
	return true
end

function ENT:SetupPlayerVisibility(pl)
	if pl ~= self:GetObjectOwner() then return end

	AddOriginToPVS(self:GetPos())
	AddOriginToPVS(self:GetPos() + pl:GetAimVector() * 1024)
end

function ENT:Use(activator, caller)
	if self.Removing or not activator:IsPlayer() or self:GetMaterial() ~= "" then return end

	if activator:Team() == TEAM_HUMAN then
		if self:GetObjectOwner():IsValid() then
			local owner = self:GetObjectOwner()
			if activator:GetInfo("zs_nousetodeposit") == "0" or activator == self:GetObjectOwner() then
				local curammo = self:GetAmmo()
				local giveammoamount = activator:GetInfo("zs_giveammoamount")
				local togive = math.min(math.min((giveammoamount or 15), activator:GetAmmoCount(self.AmmoType)), (self:GetMaxAmmo() - curammo))
				if togive > 0 then
					self:SetAmmo(curammo + togive)
					activator:RemoveAmmo(togive, self.AmmoType)
					activator:RestartGesture(ACT_GMOD_GESTURE_ITEM_GIVE)
					self:EmitSound("npc/turret_floor/click1.wav")
					--gamemode.Call("PlayerRepairedObject", activator, self, togive * 1.5, self)
				end
			end
		else
			self:SetObjectOwner(activator)
			self:GetObjectOwner():SendDeployableClaimedMessage(self)
			if not activator:HasWeapon("weapon_zs_gunturretcontrol") then
				activator:Give("weapon_zs_gunturretcontrol")
			end
		end
	end
end

function ENT:AltUse(activator, tr)
	self:PackUp(activator)
end

function ENT:OnPackedUp(pl)
	pl:GiveEmptyWeapon(self.SWEP)
	pl:GiveAmmo(1, self.TurretDeployableAmmo)

	pl:PushPackedItem(self:GetClass(), self:GetObjectHealth())
	pl:GiveAmmo(self:GetAmmo(), self.AmmoType)

	self:Remove()
end

function ENT:OnTakeDamage(dmginfo)
	self:TakePhysicsDamage(dmginfo)

	if dmginfo:GetDamage() <= 0 then return end

	local attacker = dmginfo:GetAttacker()
	if not (attacker:IsValid() and attacker:IsPlayer() and attacker:Team() == TEAM_HUMAN) then
		self:ResetLastBarricadeAttacker(attacker, dmginfo)
		self:SetObjectHealth(self:GetObjectHealth() - dmginfo:GetDamage())
	end
end

local tabSearch = {mask = MASK_SHOT}
function ENT:SearchForTarget()
	local shootpos = self:ShootPos()
	local owner = self:GetObjectOwner()

	tabSearch.start = shootpos
	tabSearch.endpos = shootpos + self:GetGunAngles():Forward() * self.SearchDistance * (owner.TurretRangeMul or 1) * (owner.DeployableRangeMul or 1)
	tabSearch.filter = self:GetCachedScanFilter()
	local tr = util.TraceLine(tabSearch)
	local ent = tr.Entity
	if ent and ent:IsValid() and self:IsValidTarget(ent) then
		return ent
	end
end

function ENT:SetAmmo(ammo)
	self:SetDTFloat(6, ammo)
end

function ENT:SetMaxAmmo(ammo)
	self:SetDTInt(0, ammo)
end

function ENT:SetMaxObjectHealth(health)
	self:SetDTInt(1, health)
end

function ENT:SetChannel(channel)
	self:SetDTInt(2, channel)
end

function ENT:SetFiring(onoff)
	self:SetDTBool(0, onoff)
end

function ENT:SetScanMaxAngle(angle)
	self:SetDTFloat(5, angle)
end

function ENT:SetScanSpeed(speed)
	self:SetDTFloat(4, speed)
end

function ENT:SetNextFire(tim)
	self:SetDTFloat(2, tim)
end

function ENT:ClearObjectOwner()
	self:SetObjectOwner(NULL)
end

function ENT:ClearTarget()
	self:SetTarget(NULL)
end

function ENT:SetTargetReceived(tim)
	self:SetDTFloat(0, tim)
end

function ENT:SetTargetLost(tim)
	self:SetDTFloat(1, tim)
end

function ENT:SetTarget(ent)
	if ent:IsValid() then
		self:SetTargetReceived(CurTime())
		self.LastHitSomething = CurTime()
	else
		self:SetTargetLost(CurTime())
	end

	self:SetDTEntity(0, ent)
end

function ENT:SetObjectOwner(ent)
	self:SetDTEntity(1, ent)
	if self.HitBox then
		self.HitBox:SetObjectOwner(ent)
	end

	self:SetupPlayerSkills()
end

function ENT:SetTurretHitbox(ent)
	self:SetDTEntity(2, ent)
end
