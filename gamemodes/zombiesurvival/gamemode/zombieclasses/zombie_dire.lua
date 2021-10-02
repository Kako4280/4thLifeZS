CLASS.Base = "zombie"

CLASS.Name = "Dire Zombie"
CLASS.TranslationName = "class_zombie_dire"
CLASS.Description = "description_zombie_dire"
CLASS.Help = "controls_zombie_dire"

CLASS.BetterVersion = "Eradicator"

CLASS.Unlocked = false

CLASS.Health = 275
CLASS.Speed = 188
CLASS.Revives = true
CLASS.CanFeignDeath = true

CLASS.Wave = 3 / 6

--CLASS.DamagePerPoint = 34
CLASS.Points = CLASS.Health/34

CLASS.SWEP = "weapon_zs_zombie_dire"

function CLASS:PlayPainSound(pl)
	pl:EmitSound("npc/zombie/zombie_pain"..math.random(6)..".wav", 75, math.random(87, 92))

	pl.NextPainSound = CurTime() + .5

	return true
end

function CLASS:PlayDeathSound(pl)
	pl:EmitSound("npc/zombie/zombie_die"..math.random(3)..".wav", 70, math.random(87, 92))

	return true
end

if SERVER then
	function CLASS:AltUse(pl)
		pl:StartFeignDeath()
	end

	function CLASS:ProcessDamage(pl, dmginfo)
		local damage = dmginfo:GetDamage()
		if damage >= 70 or damage < pl:Health() then return end

		local attacker, inflictor = dmginfo:GetAttacker(), dmginfo:GetInflictor()
		if attacker == pl or not attacker:IsPlayer() or inflictor.IsMelee or inflictor.NoReviveFromKills then return end

		local hitgroup = pl:LastHitGroup()
		if pl:WasHitInHead() or pl:GetStatus("shockdebuff") or hitgroup == HITGROUP_LEFTLEG or hitgroup == HITGROUP_RIGHTLEG then return end

		local dmgtype = dmginfo:GetDamageType()
		if bit.band(dmgtype, DMG_ALWAYSGIB) ~= 0 or bit.band(dmgtype, DMG_BURN) ~= 0 or bit.band(dmgtype, DMG_CRUSH) ~= 0 then return end

		if pl.FeignDeath and pl.FeignDeath:IsValid() then return end

		if CurTime() < (pl.NextZombieRevive or 0) then return end
		pl.NextZombieRevive = CurTime() + 3

		dmginfo:SetDamage(0)
		pl:SetHealth(10)

		local status = pl:GiveStatus("revive_slump")
		if status then
			status:SetReviveTime(CurTime() + 1.5)
			status:SetReviveAnim(1.65)
			status:SetReviveHeal(100)
		end

		return true
	end

	function CLASS:OnSecondWind(pl)
		pl:EmitSound("npc/zombie/zombie_voice_idle"..math_random(14)..".wav", 100, 85)
	end
end

if not CLIENT then return end

CLASS.Icon = "zombiesurvival/killicons/zombie"
CLASS.IconColor = Color(255, 0, 0)

local matSkin = Material("models/Zombie_Classic/Zombie_Classic_sheet.vtf")

function CLASS:PrePlayerDraw(pl)
	render.ModelMaterialOverride(matSkin)
	render.SetColorModulation(0.5, 0, 0)
end

function CLASS:PostPlayerDraw(pl)
	render.ModelMaterialOverride()
	render.SetColorModulation(1, 1, 1)
end
