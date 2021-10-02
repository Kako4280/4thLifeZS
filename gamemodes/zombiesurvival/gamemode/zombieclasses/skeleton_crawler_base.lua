CLASS.Base = "zombie_torso"

CLASS.Name = "Skeletal Crawler"
CLASS.TranslationName = "class_skeletal_lurker"
CLASS.Description = "description_skeletal_lurker"
CLASS.Help = "controls_skeletal_lurker"

CLASS.Model = Model("models/zombie/classic_torso.mdl")
CLASS.OverrideModel = Model("models/player/skeleton.mdl")

CLASS.Hull = {Vector(-16, -16, 0), Vector(16, 16, 22)}
CLASS.HullDuck = {Vector(-16, -16, 0), Vector(16, 16, 22)}
CLASS.ViewOffset = Vector(0, 0, 16)
CLASS.ViewOffsetDucked = Vector(0, 0, 16)

CLASS.SWEP = "weapon_zs_skeleton_crawler_base"

CLASS.Wave = 0 / 6
CLASS.Unlocked = true
CLASS.Hidden = true

CLASS.BetterVersion = "Brittle Skeletal Crawler"

CLASS.Health = 150
CLASS.Speed = 165
CLASS.JumpPower = 160

CLASS.Points = CLASS.Health/GM.SkeletonPointRatio

CLASS.VoicePitch = 0.8

CLASS.IsTorso = true

CLASS.Skeletal = true
CLASS.SkeletalRes = true

CLASS.BleedImmune = true
CLASS.ColdImmune = true
CLASS.DamageReduction = 0
CLASS.ResistanceBullet = 0.20
CLASS.ResistanceElectric = 0.40
CLASS.ResistanceFire = 0.40
CLASS.MeleeDamageReflection = 0

local math_random = math.random
local ACT_IDLE = ACT_IDLE
local ACT_WALK = ACT_WALK
local bit_band = bit.band
local DMG_BULLET = DMG_BULLET
local DMG_CLUB = DMG_CLUB
local DMG_SLASH = DMG_SLASH
local string_format = string.format

function CLASS:CalcMainActivity(pl, velocity)
	if velocity:Length2DSqr() <= 1 then
		return ACT_IDLE, -1
	end

	return ACT_WALK, -1
end

function CLASS:PlayPainSound(pl)
	pl:EmitSound(string_format("npc/metropolice/pain%d.wav", math_random(4)), 65, math_random(80, 85))

	return true
end

function CLASS:PlayDeathSound(pl)
	pl:EmitSound(string_format("npc/zombie/zombie_die%d.wav", math_random(3)), 75, math_random(132, 138))

	return true
end

local StepSounds = {
	Sound("npc/barnacle/neck_snap1.wav"),
	Sound("npc/barnacle/neck_snap2.wav")
}
function CLASS:PlayerFootstep(pl, vFootPos, iFoot, strSoundName, fVolume, pFilter)
	pl:EmitSound(StepSounds[math_random(#StepSounds)], 50, math_random(210, 220), 0.5)

	return true
end

function CLASS:PlayerStepSoundTime(pl, iType, bWalking)
	return GAMEMODE.BaseClass.PlayerStepSoundTime(GAMEMODE, pl, iType, bWalking) --* 2
end

function CLASS:UpdateAnimation(pl, velocity, maxseqgroundspeed)
end

function CLASS:ManipulateOverrideModel(pl, overridemodel)
	overridemodel:ManipulateBoneScale(0, vector_origin)
	overridemodel:ManipulateBoneScale(2, vector_origin)
	overridemodel:ManipulateBoneScale(4, vector_origin)
	for i=18, 25 do
		overridemodel:ManipulateBoneScale(i, vector_origin)
	end
end

if SERVER then
function CLASS:ProcessDamage(pl, dmginfo)
	local attacker, inflictor = dmginfo:GetAttacker(), dmginfo:GetInflictor()
	
	if dmginfo:GetInflictor().IsMelee then
		if IsValid(attacker) then
			local dmgReflected = math.Round(math.min(pl:Health(), dmginfo:GetDamage()) * self.MeleeDamageReflection / 100 * math.Rand(0.5, 2), 0)
			if dmgReflected > 0 then
				attacker:TakeSpecialDamage(dmgReflected, DMG_GENERIC, attacker, attacker)
			end
		end
	end
		
	if bit_band(dmginfo:GetDamageType(), DMG_BULLET) ~= 0 then
		dmginfo:SetDamage(math.max((dmginfo:GetDamage() - self.DamageReduction) * (1 - self.ResistanceBullet),1))
	elseif bit_band(dmginfo:GetDamageType(), DMG_SHOCK) ~= 0 then
		dmginfo:SetDamage(math.ceil(dmginfo:GetDamage() * (1 - self.ResistanceElectric)))
	elseif dmginfo:GetInflictor():GetClass() == "status_human_fire" then
		dmginfo:SetDamage(math.ceil(dmginfo:GetDamage() * (1 - self.ResistanceFire)))
	end
end

function CLASS:OnKilled(pl, attacker, inflictor, suicide, headshot, dmginfo, assister)
	local fakedeath = pl:FakeDeath(462, 1, 1, 1)
	if fakedeath and fakedeath:IsValid() then
		fakedeath:SetModel(self.OverrideModel)
		fakedeath:SetPos(fakedeath:GetPos() - fakedeath:GetDeathAngles():Up() * 46)

		self:ManipulateOverrideModel(pl, fakedeath)
	end

	return true
end
end

if not CLIENT then return end

CLASS.Icon = "zombiesurvival/killicons/skeletal_lurker"
