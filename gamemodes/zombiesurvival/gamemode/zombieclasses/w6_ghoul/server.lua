AddCSLuaFile("shared.lua")
include("shared.lua")

function CLASS:CanPlayerSuicide(pl)
	local wep = pl:GetActiveWeapon()
	if wep:IsValid() and wep.GetCharge and wep:GetCharge() > 0 then return false end
end

local function DoExplode(pl, pos, magnitude, dmginfo)
	local inflictor = pl:GetActiveWeapon()
	if not inflictor:IsValid() then inflictor = pl end

	local effectdata = EffectData()
		effectdata:SetOrigin(pos)
		effectdata:SetMagnitude(0.5)
	util.Effect("explosion_chem", effectdata, true)

	util.PoisonBlastDamage(inflictor, pl, pos, 40, math.random(12,24), true, true)

	pl:CheckRedeem()
end

function CLASS:OnKilled(pl, attacker, inflictor, suicide, headshot, dmginfo, assister)
	local magnitude = 1
	local wep = pl:GetActiveWeapon()

	if suicide then return end

	local pos = pl:WorldSpaceCenter()

	timer.Simple(0, function() DoExplode(pl, pos, magnitude, dmginfo) end)

	return true
end

function CLASS:OnSpawned(pl)
	pl:CreateAmbience("bursterambience")
end
