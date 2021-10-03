AddCSLuaFile()

SWEP.PrintName = "Type XIIIa Longsword"
SWEP.Description = "Can cleave through multiple zombies in one swing."

if CLIENT then
	SWEP.ViewModelFOV = 55
	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

	SWEP.VElements = {
		["base+++"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(0, 0, -5.791), angle = Angle(-90, 0, 0), size = Vector(0.035, 0.029, 0.3), color = Color(209, 209, 228, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
		["base+++++"] = { type = "Model", model = "models/props_c17/utilityconnecter005.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(0, 0, -5.791), angle = Angle(90, 90, 0), size = Vector(0.223, 0.259, 0.196), color = Color(209, 209, 228, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
		["base"] = { type = "Model", model = "models/props_junk/popcan01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.743, 1.294, 3.095), angle = Angle(6.436, 0, 0), size = Vector(0.412, 0.257, 1.68), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_junk/shoe001a", skin = 0, bodygroup = {} },
		["base++++"] = { type = "Model", model = "models/props_phx/misc/flakshell_big.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(0, 0, -5.827), angle = Angle(180, 0, 0), size = Vector(0.093, 0.012, 0.97), color = Color(223, 223, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
		["base+"] = { type = "Model", model = "models/props_c17/streetsign002b.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(0, 0, 6.59), angle = Angle(0, 0, 0), size = Vector(0.09, 3.848, 0.09), color = Color(156, 155, 173, 255), surpresslightning = false, material = "models/props_pipes/pipesystem01a_skin1", skin = 0, bodygroup = {} },
		["base++"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(0, 0, -5.791), angle = Angle(90, 0, 0), size = Vector(0.035, 0.029, 0.3), color = Color(209, 209, 228, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} }
	}

	SWEP.WElements = {
		["base+++++"] = { type = "Model", model = "models/props_c17/utilityconnecter005.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, -5.791), angle = Angle(90, 90, 0), size = Vector(0.223, 0.259, 0.196), color = Color(209, 209, 228, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
		["base++"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, -5.791), angle = Angle(90, 0, 0), size = Vector(0.035, 0.029, 0.3), color = Color(209, 209, 228, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
		["base"] = { type = "Model", model = "models/props_junk/popcan01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.665, 1.264, 2.4), angle = Angle(-5.286, 16.554, -2.345), size = Vector(0.412, 0.257, 1.68), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_junk/shoe001a", skin = 0, bodygroup = {} },
		["base+++"] = { type = "Model", model = "models/props_trainstation/trainstation_ornament002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, -5.791), angle = Angle(-90, 0, 0), size = Vector(0.035, 0.029, 0.3), color = Color(209, 209, 228, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
		["base+"] = { type = "Model", model = "models/props_c17/streetsign002b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 6.59), angle = Angle(0, 0, 0), size = Vector(0.09, 3.848, 0.09), color = Color(156, 155, 173, 255), surpresslightning = false, material = "models/props_pipes/pipesystem01a_skin1", skin = 0, bodygroup = {} },
		["base++++"] = { type = "Model", model = "models/props_phx/misc/flakshell_big.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, -5.827), angle = Angle(180, 0, 0), size = Vector(0.093, 0.012, 0.97), color = Color(223, 223, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} }
	}
end

SWEP.Base = "weapon_zs_basemelee"

SWEP.HoldType = "melee2"

SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.UseHands = true

SWEP.MeleeDamage = 70
SWEP.MeleeRange = 67
SWEP.MeleeSize = 2.5

SWEP.Primary.Delay = 1.4

SWEP.Tier = 3

SWEP.WalkSpeed = SPEED_SLOW

SWEP.SwingRotation = Angle(30, -20, 10)
SWEP.SwingOffset = Vector(0, -30, 0)
SWEP.SwingTime = 0.65
SWEP.SwingHoldType = "melee"

SWEP.AllowQualityWeapons = true

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.125)
local branch = GAMEMODE:AddNewRemantleBranch(SWEP, 1, "Type XIIIb Longsword", "Burns zombies with holy light.", function(wept)
	wept.MeleeDamage = wept.MeleeDamage * 0.70
	wept.Primary.Delay = wept.Primary.Delay * 0.75

	wept.Burn = true
	wept.BurnChance = 40
	wept.BurnDamage = 5

	if CLIENT then
		wept.ViewModelFOV = 65
		wept.ShowViewModel = false
		wept.ShowWorldModel = false

		wept.VElements = {
			["kb_ridge_detail"] = { type = "Model", model = "models/phxtended/bar1x45a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.5, 1.95, -7), angle = Angle(0, 90, 85), size = Vector(0.15, 0.05, 0.15), color = Color(40, 40, 40, 255), surpresslightning = false, material = "phoenix_storms/construct/concrete_barrier00", skin = 0, bodygroup = {} },
			["kb_grip_detail"] = { type = "Model", model = "models/phxtended/bar1x.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 2.059, -4.45), angle = Angle(0, 90, 85), size = Vector(0.189, 0.18, 0.115), color = Color(220, 220, 220, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
			["kb_ridge2_1"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.4, 1.5, -32.951), angle = Angle(-5, 180, 90), size = Vector(0.029, 0.039, 0.1), color = Color(255, 0, 0, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
			["kb_grip"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.099, 2, 0), angle = Angle(95, 0, -90), size = Vector(0.2, 0.15, 0.1), color = Color(40, 40, 40, 255), surpresslightning = false, material = "phoenix_storms/construct/concrete_barrier00", skin = 0, bodygroup = {} },
			["kb_ridge1"] = { type = "Model", model = "models/hunter/blocks/cube025x4x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.849, 1.2, -16.101), angle = Angle(5, 0, 90), size = Vector(0.09, 0.15, 0.05), color = Color(40, 40, 40, 255), surpresslightning = false, material = "phoenix_storms/construct/concrete_barrier00", skin = 0, bodygroup = {} },
			["kb_guard"] = { type = "Model", model = "models/hunter/blocks/cube05x075x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.5, 1.5, -4.6), angle = Angle(0, 90, -5), size = Vector(0.1, 0.125, 0.025), color = Color(40, 40, 40, 255), surpresslightning = false, material = "phoenix_storms/construct/concrete_barrier00", skin = 0, bodygroup = {} },
			["kb_ridge1_2"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.26, 1.5, -33.03), angle = Angle(-5, 180, 90), size = Vector(0.023, 0.029, 0.2), color = Color(40, 40, 40, 255), surpresslightning = false, material = "phoenix_storms/construct/concrete_barrier00", skin = 0, bodygroup = {} },
			["kb_ridge2"] = { type = "Model", model = "models/hunter/blocks/cube025x4x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.5, 1.35, -17.701), angle = Angle(5, 0, 90), size = Vector(0.09, 0.135, 0.025), color = Color(255, 0, 0, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} }
		}
		
		wept.WElements = {
			["kb_grip_detail"] = { type = "Model", model = "models/phxtended/bar1x.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.65, 2.174, -2.701), angle = Angle(-5, 90, 90), size = Vector(0.189, 0.18, 0.115), color = Color(220, 220, 220, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
			["kb_grip"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 1.75, 1.75), angle = Angle(-95, 90, 0), size = Vector(0.2, 0.15, 0.1), color = Color(40, 40, 40, 255), surpresslightning = false, material = "phoenix_storms/construct/concrete_barrier00", skin = 0, bodygroup = {} },
			["kb_ridge2_1"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.329, 4.07, -31.101), angle = Angle(0, 180, 95), size = Vector(0.029, 0.039, 0.1), color = Color(255, 0, 0, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
			["kb_ridge2"] = { type = "Model", model = "models/hunter/blocks/cube025x4x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.75, 2.599, -16), angle = Angle(0, 0, 85), size = Vector(0.09, 0.135, 0.025), color = Color(255, 0, 0, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
			["kb_cutaway"] = { type = "Model", model = "models/hunter/plates/platehole1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.759, 1.636, -3.25), angle = Angle(0, 0, 85), size = Vector(0.009, 0.05, 0.1), color = Color(255, 0, 0, 255), surpresslightning = false, material = "phoenix_storms/grey_chrome", skin = 0, bodygroup = {} },
			["kb_ridge1"] = { type = "Model", model = "models/hunter/blocks/cube025x4x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.349, 2.325, -14.322), angle = Angle(0, 0, 85), size = Vector(0.09, 0.15, 0.05), color = Color(40, 40, 40, 255), surpresslightning = false, material = "phoenix_storms/construct/concrete_barrier00", skin = 0, bodygroup = {} },
			["kb_guard"] = { type = "Model", model = "models/hunter/blocks/cube05x075x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 1.6, -2.901), angle = Angle(-5, 90, 0), size = Vector(0.1, 0.125, 0.025), color = Color(40, 40, 40, 255), surpresslightning = false, material = "phoenix_storms/construct/concrete_barrier00", skin = 0, bodygroup = {} },
			["kb_ridge1_2"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.279, 4.09, -31.101), angle = Angle(0, 180, 95), size = Vector(0.023, 0.029, 0.2), color = Color(40, 40, 40, 255), surpresslightning = false, material = "phoenix_storms/construct/concrete_barrier00", skin = 0, bodygroup = {} },
			["kb_ridge_detail"] = { type = "Model", model = "models/phxtended/bar1x45a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2, 2.299, -5.401), angle = Angle(-5, 90, 90), size = Vector(0.15, 0.05, 0.15), color = Color(40, 40, 40, 255), surpresslightning = false, material = "phoenix_storms/construct/concrete_barrier00", skin = 0, bodygroup = {} }
		}
	end
end)
branch.Colors = {Color(214, 46, 4), Color(229, 95, 0), Color(255, 182, 0)}
branch.NewNames = {"Warm", "Hot", "Searing"}


local branch = GAMEMODE:AddNewRemantleBranch(SWEP, 2, "'Type XIIIc' Ice Fragment", "slow zombies down with ice at the cost of damage.", function(wept)
	wept.MeleeDamage = wept.MeleeDamage * 0.74

	wept.Ice = true
    wept.IceSlowPower = 9
	
	if CLIENT then
		wept.ViewModelFOV = 65
		wept.ShowViewModel = false
		wept.ShowWorldModel = false
	
		wept.VElements = {
			["if1"] = { type = "Model", model = "models/props_combine/breenlight.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.299, 1.399, -2.47), angle = Angle(10, 0, -180), size = Vector(0.4, 0.3, 0.8), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/player/shared/ice_player", skin = 0, bodygroup = {} },
			["if3"] = { type = "Model", model = "models/props_combine/combinebuttress.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.799, 1.399, -11.75), angle = Angle(165, -180, 0), size = Vector(0.019, 0.014, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/player/shared/ice_player", skin = 0, bodygroup = {} },
			["if4"] = { type = "Model", model = "models/combine_helicopter/bomb_debris_2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.25, 1.399, -7.5), angle = Angle(105, 0, 0), size = Vector(0.275, 0.2, 0.224), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/player/shared/ice_player", skin = 0, bodygroup = {} },
			["if2"] = { type = "Model", model = "models/props_combine/combine_barricade_bracket01b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.799, 0.925, -8), angle = Angle(110, 0, 90), size = Vector(0.2, 0.2, 0.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/player/shared/ice_player", skin = 0, bodygroup = {} }
		}
		
		wept.WElements = {
			["if1"] = { type = "Model", model = "models/props_combine/breenlight.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.099, 1.399, 0), angle = Angle(180, 15, 4), size = Vector(0.349, 0.3, 0.899), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/player/shared/ice_player", skin = 0, bodygroup = {} },
			["if3"] = { type = "Model", model = "models/props_combine/combinebuttress.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.2, 2.7, -9.5), angle = Angle(170, -165, -5), size = Vector(0.019, 0.014, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/player/shared/ice_player", skin = 0, bodygroup = {} },
			["if4"] = { type = "Model", model = "models/combine_helicopter/bomb_debris_2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.8, 1.1, -6), angle = Angle(-97, 150, -50), size = Vector(0.3, 0.15, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/player/shared/ice_player", skin = 0, bodygroup = {} },
			["if2"] = { type = "Model", model = "models/props_combine/combine_barricade_bracket01b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.25, 1.45, -6.401), angle = Angle(103.333, -5, 112.222), size = Vector(0.2, 0.2, 0.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/player/shared/ice_player", skin = 0, bodygroup = {} }
		}
	end

wept.SwingRotation = Angle(0, 0, -80)
wept.SwingOffset = Vector(0, -30, 0)
wept.SwingTime = 0.6
end)
branch.Colors = {Color(100, 75, 255), Color(120, 165, 255), Color(135, 200, 255)}
branch.NewNames = {"Cold", "Frigid", "Glacial"}

function SWEP:PlaySwingSound()
	self:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 75, math.random(65, 85))
end

function SWEP:PlayHitSound()
	self:EmitSound("ambient/machines/slicer"..math.random(4)..".wav", 75)
end

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
		return basedamage * math.Clamp(1.25 - numplayers * 0.25, 0.5, 1)
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

	local effectdata = EffectData()
	effectdata:SetOrigin(tr.HitPos)
	effectdata:SetStart(tr.StartPos)
	effectdata:SetNormal(tr.HitNormal)
	util.Effect("RagdollImpact", effectdata)
	if not tr.HitSky then
		effectdata:SetSurfaceProp(tr.SurfaceProps)
		effectdata:SetDamageType(self.DamageType)
		effectdata:SetHitBox(tr.HitBox)
		effectdata:SetEntity(hitent)
		util.Effect("Impact", effectdata)
	end
end