SWEP.Base = "weapon_zs_basemelee"

SWEP.PrintName = "Junk Pack"
SWEP.Description = "It's simply a pack of wooden junk kept together with some duct tape.\nVery useful for making barricades when no materials are around.\nNeeds something like a hammer and nails to keep the things in place."

SWEP.ViewModel = "models/weapons/c_aegiskit.mdl"
SWEP.WorldModel = "models/props_debris/wood_board06a.mdl"
SWEP.UseHands = true

SWEP.AmmoIfHas = true
SWEP.AllowEmpty = true

SWEP.Primary.ClipSize = 1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "SniperRound"
SWEP.Primary.Delay = 1
SWEP.Primary.DefaultClip = 4

SWEP.Secondary.ClipSize = 1
SWEP.Secondary.DefaultClip = 1
SWEP.Secondary.Ammo = "dummy"
SWEP.Secondary.Automatic = true
SWEP.Secondary.Delay = 0.15

SWEP.WalkSpeed = SPEED_NORMAL
SWEP.FullWalkSpeed = SPEED_SLOWEST

SWEP.JunkModels = {
	Model("models/props_debris/wood_board04a.mdl"),
	Model("models/props_debris/wood_board06a.mdl"),
	Model("models/props_debris/wood_board02a.mdl"),
	Model("models/props_debris/wood_board01a.mdl"),
	Model("models/props_debris/wood_board07a.mdl"),
	Model("models/props_c17/furnituredrawer002a.mdl"),
	Model("models/props_c17/furnituredrawer003a.mdl"),
	Model("models/props_c17/furnituredrawer001a_chunk01.mdl"),
	Model("models/props_c17/furniturechair001a_chunk01.mdl"),
	Model("models/props_c17/furnituredrawer001a_chunk02.mdl"),
	Model("models/props_c17/furnituretable003a.mdl"),
	Model("models/props_c17/furniturechair001a.mdl"),
	Model("models/props_c17/oildrum001_explosive.mdl"),
	Model("models/props_c17/oildrum001.mdl"),
	Model("models/props_junk/wood_pallet001a.mdl"),
	Model("models/props_debris/metal_panel02a.mdl")
}

SWEP.AdvancedJunkModelsLarge = {
	Model("models/props_junk/harpoon002a.mdl"),
	Model("models/props_combine/combine_barricade_short02a.mdl"),
	Model("models/props_c17/metalladder001.mdl"),
	Model("models/props_c17/signpole001.mdl"),
	Model("models/props_c17/door02_double.mdl"),
	Model("models/props_interiors/Radiator01a.mdl"),
	Model("models/props_trainstation/trainstation_clock001.mdl"),
	Model("models/props_c17/gravestone001a.mdl"),
	Model("models/props_c17/gravestone002a.mdl"),
	Model("models/props_c17/gravestone003a.mdl"),
	Model("models/props_c17/FurnitureWashingmachine001a.mdl"),
	Model("models/props_c17/FurnitureToilet001a.mdl"),
	Model("models/props_c17/FurnitureSink001a.mdl"),
	Model("models/props/cs_militia/caseofbeer01.mdl"),
	Model("models/props_vehicles/carparts_axel01a.mdl"),
	Model("models/props_vehicles/carparts_door01a.mdl"),
	Model("models/props_vehicles/carparts_muffler01a.mdl"),
	Model("models/props_junk/bicycle01a.mdl"),
	Model("models/props_c17/bench01a.mdl"),
	Model("models/props_junk/Wheebarrow01a.mdl"),
	Model("models/props_wasteland/cafeteria_table001a.mdl"),
	Model("models/props_wasteland/kitchen_shelf001a.mdl"),
	Model("models/props_junk/wood_crate002a.mdl"),
	Model("models/props_junk/wood_crate001a.mdl"),
	Model("models/props_c17/FurnitureFridge001a.mdl"),
	Model("models/props_c17/FurnitureCouch001a.mdl"),
	Model("models/props_c17/FurnitureBathtub001a.mdl"),
	Model("models/models/model/minecraft/fox_sit.mdl"),
	Model("models/models/model/minecraft/fox_sleep.mdl"),
	Model("models/models/model/minecraft/fox_stand.mdl")
}

SWEP.AdvancedJunkModelsSmall = {
	Model("models/Gibs/HGIBS.mdl"),
	Model("models/props_c17/doll01.mdl"),
	Model("models/props_junk/Shoe001a.mdl"),
	Model("models/props_junk/garbage_newspaper001a.mdl"),
	Model("models/props_junk/garbage_metalcan002a.mdl"),
	Model("models/props_lab/huladoll.mdl"),
	Model("models/props_junk/garbage_metalcan001a.mdl"),
	Model("models/props_c17/streetsign005b.mdl"),
	Model("models/props_c17/TrapPropeller_Lever.mdl"),
	Model("models/props_lab/cactus.mdl"),
	Model("models/props_c17/Frame002a.mdl"),
	Model("models/props_lab/clipboard.mdl"),
	Model("models/props_phx/misc/soccerball.mdl"),
	Model("models/balloons/balloon_dog.mdl"),
	Model("models/maxofs2d/balloon_gman.mdl"),
	Model("models/maxofs2d/balloon_mossman.mdl"),
	Model("models/props/CS_militia/fishriver01.mdl"),
	Model("models/props/cs_italy/it_mkt_container3a.mdl"),
	Model("models/props/cs_italy/it_mkt_container1a.mdl"),
	Model("models/props/de_tides/vending_turtle.mdl"),
	Model("models/props_junk/CinderBlock01a.mdl")
}

SWEP.AdvancedJunkModelsFoxes = {
	Model("models/models/model/minecraft/fox_sit.mdl"),
	Model("models/models/model/minecraft/fox_sleep.mdl"),
	Model("models/models/model/minecraft/fox_stand.mdl")
}

SWEP.HoldType = "physgun"

function SWEP:SetReplicatedAmmo(count)
	self:SetDTInt(0, count)
end

function SWEP:GetReplicatedAmmo()
	return self:GetDTInt(0)
end

function SWEP:GetWalkSpeed()
	if self:GetPrimaryAmmoCount() > 0 then
		return self.FullWalkSpeed
	end
end

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end

	local owner = self:GetOwner()
	local aimvec = owner:GetAimVector()
	local shootpos = owner:GetShootPos()
	local tr = util.TraceLine({start = shootpos, endpos = shootpos + aimvec * 32, filter = owner})

	self:SetNextPrimaryAttack(CurTime() + self.Primary.Delay)

	self:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 75, math.random(75, 80))

	self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	self.IdleAnimation = CurTime() + math.min(self.Primary.Delay, self:SequenceDuration())
	
	local ModelTable = self.JunkModels
	local n = 1
	local f = false
	
	if owner:IsSkillActive(SKILL_TECH_CADE_JUNKPACK_ADVANCED) then
		if math.random(1,5) <= 3 then
			if math.random(1,2) == 1 then
				ModelTable = self.AdvancedJunkModelsLarge
			else
				ModelTable = self.AdvancedJunkModelsSmall
				n = math.random(2,4)
			end
		end
		
		if owner:IsUserGroup("owner") or owner:IsUserGroup("superadmin") or owner:IsUserGroup("admin") or  owner:IsUserGroup("moderator") then
			if math.random(1,4) == 1 then
				f = true
			end
		end
	end

	if SERVER then
		owner:RestartGesture(ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE)
		
		for i = 1, n do
			timer.Simple((i - 1) / 4, function()
				local ent = ents.Create("prop_physics")
				if ent:IsValid() then
					local ang = aimvec:Angle()
					ang:RotateAroundAxis(ang:Forward(), 90)
					ent:SetPos(tr.HitPos)
					ent:SetAngles(ang)
					ent:SetModel(ModelTable[math.random(#ModelTable)])
					ent:Spawn()
					ent:SetHealth(350)
					ent:SetMaxHealth(94821) -- creating a unique identifier for junk pack props.. not my proudest moment!
					ent.NoVolumeCarryCheck = true
					ent.NoDisTime = CurTime() + 15
					ent.NoDisOwner = self:GetOwner()
					local phys = ent:GetPhysicsObject()
					if phys:IsValid() then
						phys:SetMass(math.min(phys:GetMass(), 50))
						phys:SetVelocityInstantaneous(self:GetOwner():GetVelocity())
					end
					ent:SetPhysicsAttacker(self:GetOwner())
				end
			end)
		end
		
		if f then
			timer.Simple((n) / 5, function()
				local ent = ents.Create("prop_physics")
				if ent:IsValid() then
					local ang = aimvec:Angle()
					ang:RotateAroundAxis(ang:Forward(), 90)
					ent:SetPos(tr.HitPos)
					ent:SetAngles(ang)
					ent:SetModel(self.AdvancedJunkModelsFoxes[math.random(#self.AdvancedJunkModelsFoxes)])
					ent:Spawn()
					ent:SetHealth(350)
					ent.NoVolumeCarryCheck = true
					ent.NoDisTime = CurTime() + 15
					ent.NoDisOwner = self:GetOwner()
					local phys = ent:GetPhysicsObject()
					if phys:IsValid() then
						phys:SetMass(math.min(phys:GetMass(), 50))
						phys:SetVelocityInstantaneous(self:GetOwner():GetVelocity())
					end
					ent:SetPhysicsAttacker(self:GetOwner())
				end
			end)
		end
		
		self:TakePrimaryAmmo(1)
	end
end

function SWEP:SecondaryAttack()
end

function SWEP:Reload()
end

function SWEP:CanPrimaryAttack()
	if self:GetOwner():IsHolding() or self:GetOwner():GetBarricadeGhosting() then return false end

	if math.abs(self:GetOwner():GetVelocity().z) >= 256 then return false end

	if self:GetPrimaryAmmoCount() <= 0 then
		self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
		return false
	end

	return true
end

function SWEP:Think()
	if self.IdleAnimation and self.IdleAnimation <= CurTime() then
		self.IdleAnimation = nil
		self:SendWeaponAnim(ACT_VM_IDLE)
	end

	if SERVER then
		local count = self:GetPrimaryAmmoCount()
		if count ~= self:GetReplicatedAmmo() then
			self:SetReplicatedAmmo(count)
			self:GetOwner():ResetSpeed()
		end
	end
end
