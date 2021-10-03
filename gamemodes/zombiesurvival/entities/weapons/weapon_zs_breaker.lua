AddCSLuaFile()

SWEP.PrintName = "Breaker Blade"
SWEP.Description = "A slow melee that deals increased damage to healthy zombies."

if CLIENT then
	SWEP.ViewModelFOV = 70
	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

    SWEP.VElements = {
        ["br9+"] = { type = "Model", model = "models/props_pipes/pipe01_connector0W1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(0.6, 2.45, -9.825), angle = Angle(0, -90, 6), size = Vector(0.449, 0.449, 0.449), color = Color(255, 100, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
        ["br4"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.25, 1.475, -3.5), angle = Angle(0, 90, -96), size = Vector(0.173, 0.15, 0.173), color = Color(50, 50, 50, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
        ["br8+"] = { type = "Model", model = "models/hunter/triangles/025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.76, 1.475, -36.5), angle = Angle(-6, 180, -90), size = Vector(0.23, 0.23, 0.75), color = Color(255, 219, 150, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
        ["br3"] = { type = "Model", model = "models/hunter/triangles/trapezium3x3x1c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.4, 1.389, 5.05), angle = Angle(96.5, 0, 180), size = Vector(0.018, 0.039, 0.054), color = Color(100, 100, 100, 255), surpresslightning = false, material = "phoenix_storms/construct/concrete_barrier00", skin = 0, bodygroup = {} },
        ["br1"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.25, 1.5, -3.5), angle = Angle(6, 0, -1), size = Vector(0.5, 0.5, 0.079), color = Color(130, 50, 50, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
        ["br6"] = { type = "Model", model = "models/hunter/blocks/cube025x4x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.15, 0.92, -14.2), angle = Angle(6, 0, 90), size = Vector(0.4, 0.125, 0.1), color = Color(180, 180, 180, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
        ["br2"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.349, 1.375, 5), angle = Angle(0, 90, -6.5), size = Vector(0.15, 0.15, 0.15), color = Color(50, 50, 50, 255), surpresslightning = false, material = "phoenix_storms/construct/concrete_barrier00", skin = 0, bodygroup = {} },
        ["br5"] = { type = "Model", model = "models/hunter/blocks/cube025x05x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.25, 0.3, -3.401), angle = Angle(-180, -90, -6), size = Vector(0.2, 0.4, 0.173), color = Color(255, 219, 150, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
        ["br9"] = { type = "Model", model = "models/props_pipes/pipe01_connector01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(0.3, 2.45, -7.151), angle = Angle(0, -90, 6), size = Vector(0.449, 0.449, 0.449), color = Color(130, 255, 75, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
        ["br8"] = { type = "Model", model = "models/hunter/triangles/025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(9.09, 1.5, -32.94), angle = Angle(-6, 180, -90), size = Vector(0.4, 0.4, 0.4), color = Color(180, 180, 180, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
        ["br6+"] = { type = "Model", model = "models/hunter/blocks/cube025x4x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.7, 0.349, -17), angle = Angle(6, 0, 90), size = Vector(0.23, 0.15, 0.189), color = Color(255, 219, 150, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} }
    }
    
    SWEP.WElements = {
        ["br9+"] = { type = "Model", model = "models/props_pipes/pipe01_connector01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.051, 3.075, -6.801), angle = Angle(5, -90, 0), size = Vector(0.405, 0.405, 0.405), color = Color(130, 255, 75, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
        ["br6+"] = { type = "Model", model = "models/hunter/blocks/cube025x4x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.174, 2.575, -27.701), angle = Angle(-5, 90, -90), size = Vector(0.204, 0.214, 0.204), color = Color(255, 219, 150, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
        ["br8"] = { type = "Model", model = "models/hunter/triangles/025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.224, 5.25, -44), angle = Angle(1.11, 180, -85), size = Vector(0.449, 0.449, 0.4), color = Color(180, 180, 180, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
        ["br4"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.5, 1.75, -4), angle = Angle(0, 0, -5), size = Vector(0.173, 0.15, 0.173), color = Color(50, 50, 50, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
        ["br5"] = { type = "Model", model = "models/hunter/blocks/cube025x05x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.5, 0.699, -5.75), angle = Angle(-5, 90, 0), size = Vector(0.2, 0.4, 0.173), color = Color(255, 219, 150, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
        ["br3"] = { type = "Model", model = "models/hunter/geometric/hex1x05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.5, -0.5, 9), angle = Angle(0, 0, 85), size = Vector(0.025, 0.039, 0.73), color = Color(100, 100, 100, 255), surpresslightning = false, material = "phoenix_storms/construct/concrete_barrier00", skin = 0, bodygroup = {} },
        ["br6"] = { type = "Model", model = "models/hunter/blocks/cube025x4x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.3, 2.474, -19), angle = Angle(0, 0, 85), size = Vector(0.449, 0.175, 0.1), color = Color(180, 180, 180, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
        ["br2"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.5, 0.699, 8), angle = Angle(0, 0, -5), size = Vector(0.15, 0.15, 0.15), color = Color(50, 50, 50, 255), surpresslightning = false, material = "phoenix_storms/construct/concrete_barrier00", skin = 0, bodygroup = {} },
        ["br9++"] = { type = "Model", model = "models/props_pipes/pipe01_connector01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.051, 1.1, -9.301), angle = Angle(-5, 90, 0), size = Vector(0.405, 0.405, 0.405), color = Color(255, 100, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
        ["br9"] = { type = "Model", model = "models/props_pipes/pipe01_connector01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.051, 3.299, -9.2), angle = Angle(5, -90, 0), size = Vector(0.405, 0.405, 0.405), color = Color(255, 100, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
        ["br1"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.5, 1.7, -3.5), angle = Angle(0, 0, -5), size = Vector(0.5, 0.5, 0.1), color = Color(130, 50, 50, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
        ["br9+++"] = { type = "Model", model = "models/props_pipes/pipe01_connector01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.051, 0.899, -6.901), angle = Angle(-5, 90, 0), size = Vector(0.405, 0.405, 0.405), color = Color(130, 255, 75, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
        ["br8+"] = { type = "Model", model = "models/hunter/triangles/025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.169, 5.429, -46.401), angle = Angle(0, 180, -85), size = Vector(0.204, 0.204, 0.814), color = Color(255, 219, 150, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} }
    }
end

SWEP.Base = "weapon_zs_basemelee"

SWEP.HoldType = "melee2"

SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.UseHands = true


SWEP.HoldType = "melee2"
SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"

SWEP.Base = "weapon_zs_basemelee"


SWEP.MeleeDamage = 110
SWEP.MeleeRange = 75
SWEP.MeleeSize = 2.4

SWEP.Primary.Delay = 2

SWEP.Tier = 5
--SWEP.MaxStock = 2

SWEP.WalkSpeed = SPEED_SLOW



SWEP.AllowQualityWeapons = true

SWEP.SwingRotation = Angle(30, -20, 10)
SWEP.SwingOffset = Vector(0, -30, 0)
SWEP.SwingTime = 0.90
SWEP.SwingHoldType = "melee"

function SWEP:GetTracesNumPlayers(traces)
	local numplayers = 0

	local ent
	for _, trace in pairs(traces) do
		ent = trace.Entity
		if ent and ent:IsValidPlayer() then
			numplayers = numplayers + 1
		end
	end

	return numplayers
end

function SWEP:GetDamage(numplayers, basedamage)
	basedamage = basedamage or self.MeleeDamage

	if numplayers then
		return basedamage * math.Clamp(1.10 - numplayers * 0.2, 0.4, 0.9)
	end

	return basedamage
end

function SWEP:MeleeSwing()
	local owner = self:GetOwner()

	owner:DoAttackEvent()
	self:SendWeaponAnim(self.MissAnim)
	self.IdleAnimation = CurTime() + self:SequenceDuration()

	local hit = false
	local tr = owner:CompensatedPenetratingMeleeTrace(self.MeleeRange * (owner.MeleeRangeMul or 1), self.MeleeSize)
	local damage = self:GetDamage(self:GetTracesNumPlayers(tr))
	local ent

	local damagemultiplier = owner:Team() == TEAM_HUMAN and owner.MeleeDamageMultiplier or 1 --(owner.BuffMuscular and owner:Team()==TEAM_HUMAN) and 1.2 or 1
	if owner:IsSkillActive(SKILL_LASTSTAND) then
		if owner:Health() <= owner:GetMaxHealth() * 0.25 then
			damagemultiplier = damagemultiplier * 2
		else
			damagemultiplier = damagemultiplier * 0.85
		end
	end
	
	for _, trace in ipairs(tr) do
		if not trace.Hit then continue end

		ent = trace.Entity

		hit = true
		
		local hitflesh = trace.MatType == MAT_FLESH or trace.MatType == MAT_BLOODYFLESH or trace.MatType == MAT_ANTLION or trace.MatType == MAT_ALIENFLESH

		if hitflesh then
			util.Decal(self.BloodDecal, trace.HitPos + trace.HitNormal, trace.HitPos - trace.HitNormal)

			if SERVER then
				self:ServerHitFleshEffects(ent, trace, damagemultiplier)
			end

		end

		if ent and ent:IsValid() then
			
			if SERVER then
				self:ServerMeleeHitEntity(trace, ent, damagemultiplier)
			end

			self:MeleeHitEntity(trace, ent, damagemultiplier, damage)

			if SERVER then
				self:ServerMeleePostHitEntity(trace, ent, damagemultiplier)
			end

			if owner.GlassWeaponShouldBreak then break end
		end
	end

	if hit then
		self:PlayHitSound()
	else
		self:PlaySwingSound()

		if owner.MeleePowerAttackMul and owner.MeleePowerAttackMul > 1 then
			self:SetPowerCombo(0)
		end
	end
end

function SWEP:MeleeHitEntity(tr, hitent, damagemultiplier, damage)
	if not IsFirstTimePredicted() then return end

	local owner = self:GetOwner()

	if SERVER and hitent:IsPlayer() and owner:IsSkillActive(SKILL_GLASSWEAPONS) then
		damagemultiplier = damagemultiplier * 3.5
		owner.GlassWeaponShouldBreak = not owner.GlassWeaponShouldBreak
	end

	damage = damage * damagemultiplier

	local dmginfo = DamageInfo()
	dmginfo:SetDamagePosition(tr.HitPos)
	dmginfo:SetAttacker(owner)
	dmginfo:SetInflictor(self)
	dmginfo:SetDamageType(self.DamageType)
	dmginfo:SetDamage(damage)
	dmginfo:SetDamageForce(math.min(self.MeleeDamage, 50) * 50 * owner:GetAimVector())

	local vel
	if hitent:IsPlayer() then

		if owner.MeleePowerAttackMul and owner.MeleePowerAttackMul > 1 then
			self:SetPowerCombo(self:GetPowerCombo() + 1)

			damage = damage + damage * (owner.MeleePowerAttackMul - 1) * (self:GetPowerCombo()/4)
			dmginfo:SetDamage(damage)

			if self:GetPowerCombo() >= 4 then
				self:SetPowerCombo(0)
				if SERVER then
					local pitch = math.Clamp(math.random(90, 110) + 15 * (1 - damage/45), 50 , 200)
					owner:EmitSound("npc/strider/strider_skewer1.wav", 75, pitch)
				end
			end
		end
		
		if hitent and hitent:IsValidLivingZombie() then
            if hitent:Health() >= math.floor(hitent:GetMaxHealth() * 0.9) then
            damagemultiplier = damagemultiplier * 1.75
            damage = damage * damagemultiplier
            dmginfo:SetDamage(damage)
            end
        end

		hitent:MeleeViewPunch(damage)
		if hitent:IsHeadcrab() then
			damage = damage * 2
			dmginfo:SetDamage(damage)
		end

		if SERVER then
			hitent:SetLastHitGroup(tr.HitGroup)
			if tr.HitGroup == HITGROUP_HEAD then
				hitent:SetWasHitInHead()
			end

			if hitent:WouldDieFrom(damage, tr.HitPos) then
				dmginfo:SetDamageForce(math.min(self.MeleeDamage, 50) * 400 * owner:GetAimVector())
			end
		end

		vel = hitent:GetVelocity()
	else
		if owner.MeleePowerAttackMul and owner.MeleePowerAttackMul > 1 then
			self:SetPowerCombo(0)
		end
	end

	--if not hitent.LastHeld or CurTime() >= hitent.LastHeld + 0.1 then -- Don't allow people to shoot props out of their hands
		if self.PointsMultiplier then
			POINTSMULTIPLIER = self.PointsMultiplier
		end

		hitent:DispatchTraceAttack(dmginfo, tr, owner:GetAimVector())

		if self.PointsMultiplier then
			POINTSMULTIPLIER = nil
		end

		-- Invalidate the engine knockback vs. players
		if vel then
			hitent:SetLocalVelocity(vel)
		end
	--end

	-- Perform our own knockback vs. players
	if hitent:IsPlayer() then
		local knockback = self.MeleeKnockBack * (owner.MeleeKnockbackMultiplier or 1)
		if knockback > 0 then
			hitent:ThrowFromPositionSetZ(tr.StartPos, knockback, nil, true)
		end

		if owner.MeleeLegDamageAdd and owner.MeleeLegDamageAdd > 0 then
			hitent:AddLegDamage(owner.MeleeLegDamageAdd)
		end
	end
end

function SWEP:PlaySwingSound()
	self:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 75, math.random(25, 30))
end

function SWEP:PlayHitSound()
	self:EmitSound("weapons/melee/shovel/shovel_hit-0"..math.random(4)..".ogg", 75, math.random(50, 60))
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("physics/flesh/flesh_bloody_break.wav", 80, math.random(85, 95))
end

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.03)
