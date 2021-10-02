CLASS.Name = "Skeletal Horror Base"
CLASS.TranslationName = "class_skeletal_horror"
CLASS.Description = "description_skeletal_horror"
CLASS.Help = "controls_skeletal_horror"

--CLASS.BetterVersion = "Lacerator"

CLASS.Model = Model("models/player/zombie_fast.mdl")
CLASS.OverrideModel = Model("models/player/skeleton.mdl")

CLASS.Wave = 0 / 6
CLASS.Unlocked = true
CLASS.Hidden = true

CLASS.BetterVersion = "Brittle Skeletal Horror"

CLASS.Health = 225
CLASS.Speed = 225
CLASS.SWEP = "weapon_zs_skeleton_horror_base"

CLASS.Points = CLASS.Health/25

CLASS.CanTaunt = true

CLASS.Skeletal = true
CLASS.SkeletalRes = true

CLASS.BleedImmune = true
CLASS.ColdImmune = true
CLASS.DamageReduction = 0
CLASS.ResistanceBullet = 0.20
CLASS.ResistanceElectric = 0.40
CLASS.ResistanceFire = 0.40
CLASS.MeleeDamageReflection = 0

CLASS.Hull = {Vector(-16, -16, 0), Vector(16, 16, 58)}
CLASS.HullDuck = {Vector(-16, -16, 0), Vector(16, 16, 32)}
CLASS.ViewOffset = Vector(0, 0, 50)
CLASS.ViewOffsetDucked = Vector(0, 0, 24)

CLASS.PainSounds = {"NPC_FastZombie.Pain"}
CLASS.DeathSounds = {"npc/fast_zombie/leap1.wav"} --{"NPC_FastZombie.Die"}

CLASS.VoicePitch = 1.8

CLASS.NoFallDamage = true
CLASS.NoFallSlowdown = true
CLASS.Skeletal = true
CLASS.SkeletalRes = true
CLASS.BloodColor = -1

local math_random = math.random
local math_min = math.min
local math_Clamp = math.Clamp
local CurTime = CurTime
local STEPSOUNDTIME_NORMAL = STEPSOUNDTIME_NORMAL
local STEPSOUNDTIME_WATER_FOOT = STEPSOUNDTIME_WATER_FOOT
local STEPSOUNDTIME_ON_LADDER = STEPSOUNDTIME_ON_LADDER
local STEPSOUNDTIME_WATER_KNEE = STEPSOUNDTIME_WATER_KNEE
local ACT_ZOMBIE_CLIMB_UP = ACT_ZOMBIE_CLIMB_UP
local ACT_ZOMBIE_LEAP_START = ACT_ZOMBIE_LEAP_START
local ACT_ZOMBIE_LEAPING = ACT_ZOMBIE_LEAPING
local ACT_HL2MP_RUN_ZOMBIE = ACT_HL2MP_RUN_ZOMBIE
local ACT_HL2MP_RUN_ZOMBIE_FAST = ACT_HL2MP_RUN_ZOMBIE_FAST
local ACT_HL2MP_IDLE_CROUCH_ZOMBIE = ACT_HL2MP_IDLE_CROUCH_ZOMBIE
local ACT_HL2MP_WALK_CROUCH_ZOMBIE_01 = ACT_HL2MP_WALK_CROUCH_ZOMBIE_01

function CLASS:Move(pl, mv)
	local wep = pl:GetActiveWeapon()
	if wep.Move and wep:Move(mv) then
		return true
	end

	if mv:GetForwardSpeed() <= 0 then
		mv:SetMaxSpeed(math_min(mv:GetMaxSpeed(), 90))
		mv:SetMaxClientSpeed(math_min(mv:GetMaxClientSpeed(), 90))
	end
end

local StepLeftSounds = {
	"npc/fast_zombie/foot1.wav",
	"npc/fast_zombie/foot2.wav"
}
local StepRightSounds = {
	"npc/fast_zombie/foot3.wav",
	"npc/fast_zombie/foot4.wav"
}
function CLASS:PlayerFootstep(pl, vFootPos, iFoot, strSoundName, fVolume, pFilter)
	if iFoot == 0 then
		pl:EmitSound(StepLeftSounds[math_random(#StepLeftSounds)], 70)
	else
		pl:EmitSound(StepRightSounds[math_random(#StepRightSounds)], 70)
	end

	return true
end
--[[function CLASS:PlayerFootstep(pl, vFootPos, iFoot, strSoundName, fVolume, pFilter)
	if iFoot == 0 then
		pl:EmitSound("NPC_FastZombie.GallopLeft")
	else
		pl:EmitSound("NPC_FastZombie.GallopRight")
	end

	return true
end]]

function CLASS:PlayerStepSoundTime(pl, iType, bWalking)
	if iType == STEPSOUNDTIME_NORMAL or iType == STEPSOUNDTIME_WATER_FOOT then
		return 450 - pl:GetVelocity():Length()
	elseif iType == STEPSOUNDTIME_ON_LADDER then
		return 400
	elseif iType == STEPSOUNDTIME_WATER_KNEE then
		return 550
	end

	return 250
end

function CLASS:ScalePlayerDamage(pl, hitgroup, dmginfo)
	if hitgroup == HITGROUP_HEAD then
		dmginfo:ScaleDamage(1.5)
	else
		dmginfo:ScaleDamage(1)
	end
end

function CLASS:IgnoreLegDamage(pl, dmginfo)
	return true
end

function CLASS:CalcMainActivity(pl, velocity)
	local wep = pl:GetActiveWeapon()
	if not wep:IsValid() or not wep.GetClimbing or not wep.GetPounceTime then return end

	if wep:GetClimbing() then
		return ACT_ZOMBIE_CLIMB_UP, -1
	end

	if wep:GetPounceTime() > 0 then
		return ACT_ZOMBIE_LEAP_START, -1
	end

	if not pl:OnGround() or pl:WaterLevel() >= 3 then
		return ACT_ZOMBIE_LEAPING, -1
	end

	local speed = velocity:Length2DSqr()

	if speed <= 1 and wep:IsRoaring() then
		return 1, pl:LookupSequence("menu_zombie_01")
	end

	if speed > 256 and wep:GetSwinging() then --16^2
		return ACT_HL2MP_RUN_ZOMBIE, -1
	end

	if pl:Crouching() then
		return speed <= 1 and ACT_HL2MP_IDLE_CROUCH_ZOMBIE or ACT_HL2MP_WALK_CROUCH_ZOMBIE_01, -1
	end

	return ACT_HL2MP_RUN_ZOMBIE_FAST, -1
end

function CLASS:UpdateAnimation(pl, velocity, maxseqgroundspeed)
	local wep = pl:GetActiveWeapon()
	if not wep:IsValid() or not wep.GetClimbing or not wep.GetPounceTime then return end

	if wep.GetSwinging and wep:GetSwinging() then
		if not pl.PlayingFZSwing then
			pl.PlayingFZSwing = true
			pl:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_GMOD_GESTURE_RANGE_FRENZY)
		end
	elseif pl.PlayingFZSwing then
		pl.PlayingFZSwing = false
		pl:AnimResetGestureSlot(GESTURE_SLOT_ATTACK_AND_RELOAD) --pl:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_GMOD_GESTURE_RANGE_FRENZY, true)
	end

	if wep:GetClimbing() then
		local vel = pl:GetVelocity()
		local speed = vel:LengthSqr()
		if speed > 64 then --8^2
			pl:SetPlaybackRate(math_Clamp(speed / 25600, 0, 1) * (vel.z < 0 and -1 or 1)) --160^2
		else
			pl:SetPlaybackRate(0)
		end

		return true
	end

	if wep.GetPounceTime and wep:GetPounceTime() > 0 then
		pl:SetPlaybackRate(0.25)

		if not pl.m_PrevFrameCycle then
			pl.m_PrevFrameCycle = true
			pl:SetCycle(0)
		end

		return true
	elseif pl.m_PrevFrameCycle then
		pl.m_PrevFrameCycle = nil
	end

	if not pl:OnGround() or pl:WaterLevel() >= 3 then
		pl:SetPlaybackRate(1)

		if pl:GetCycle() >= 1 then
			pl:SetCycle(pl:GetCycle() - 1)
		end

		return true
	end

	if wep:IsRoaring() and velocity:Length2DSqr() <= 1 then
		pl:SetPlaybackRate(0)
		pl:SetCycle(math_Clamp(1 - (wep:GetRoarEndTime() - CurTime()) / wep.RoarTime, 0, 1) * 0.9)

		return true
	end
end

function CLASS:DoAnimationEvent(pl, event, data)
	if event == PLAYERANIMEVENT_ATTACK_PRIMARY then
		pl:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_GMOD_GESTURE_RANGE_ZOMBIE_SPECIAL, true)
		return ACT_INVALID
	elseif event == PLAYERANIMEVENT_RELOAD then
		return ACT_INVALID
	end
end


CLASS.Icon = "zombiesurvival/killicons/skeletal_walker"

function CLASS:CreateMove(pl, cmd)
	local wep = pl:GetActiveWeapon()
	if wep:IsValid() and wep.IsPouncing then
		if wep.m_ViewAngles and wep:IsPouncing() then
			local maxdiff = FrameTime() * 20
			local mindiff = -maxdiff
			local originalangles = wep.m_ViewAngles
			local viewangles = cmd:GetViewAngles()

			local diff = math.AngleDifference(viewangles.yaw, originalangles.yaw)
			if diff > maxdiff or diff < mindiff then
				viewangles.yaw = math.NormalizeAngle(originalangles.yaw + math.Clamp(diff, mindiff, maxdiff))
			end

			wep.m_ViewAngles = viewangles

			cmd:SetViewAngles(viewangles)
		--[[elseif wep:IsClimbing() then
			local buttons = cmd:GetButtons()
			if bit.band(buttons, IN_DUCK) ~= 0 then
				cmd:SetButtons(buttons - IN_DUCK)
			end]]
		end
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
end
