local MetaPlayer = FindMetaTable("Player")
local EntityMeta = FindMetaTable("Entity")

local P_Team = MetaPlayer.Team
local E_IsValid = EntityMeta.IsValid

local Donators = { "vip", "donator" }

function MetaPlayer:IsDonator()
	for _,v in pairs(Donators) do
		if self:IsUserGroup(v) then
			return true
		end
	end
	
	return false
end

-- Player Scores
function MetaPlayer:GetScore()
	return self:GetNWFloat("flood_score") or 0
end

function MetaPlayer:SetScore(score)
	self:SetNWFloat("flood_score", score)
end

-- Player Color
function EntityMeta:GetPlayerColor()
	return self:GetNWVector("playerColor") or Vector()
end

function EntityMeta:SetPlayerColor(vec)
	self:SetNWVector("playerColor", vec)
end

-- Can Respawn
function MetaPlayer:CanRespawn()
	return self:GetNWBool("flood_canrespawn")
end

function MetaPlayer:SetCanRespawn(bool)
	self:SetNWBool("flood_canrespawn", bool)
end

-- Currency 
function MetaPlayer:AddCash(amount)
	if amount then
		self:SetNetworkedInt("flood_cash", self:GetNetworkedInt("flood_cash") + tonumber(amount))
		self:Save()
	else
		print("Flood: Error occured in AddCash function - No amount was passed.")
		return
	end
end

function MetaPlayer:SubCash(amount)
	if amount then 
		self:SetNetworkedInt("flood_cash", self:GetNetworkedInt("flood_cash") - tonumber(amount))
		self:Save()
	else
		print("Flood: Error occured in SubCash function - No amount was passed.")
		return
	end
end

function MetaPlayer:SetCash(amount)
	self:SetNetworkedInt("flood_cash", tonumber(amount))
end

function MetaPlayer:GetCash()
	return tonumber(self:GetNetworkedInt("flood_cash"))
end

function MetaPlayer:CanAfford(price)
	if tonumber(self:GetNetworkedInt("flood_cash")) >= tonumber(price) then
		return true
	else
		return false
	end
end

-- Save Data
function MetaPlayer:Save()
	if not file.IsDir("flood","DATA") then 
		file.CreateDir("flood") 
	end

	if not self.Weapons then
		self.Weapons = { }
		table.insert(self.Weapons, "weapon_pistol")
	end

	local data = { 
		name =  string.gsub(self:Nick(), "\"", " ") or "bob",
		cash = self:GetNWFloat("flood_cash"),
		weapons = string.Implode("\n", self.Weapons)
	}
	
	file.Write("flood/"..self:UniqueID()..".txt", util.TableToKeyValues(data))
end

-- Completely Lua-side bullets
--copied from zs
local CONTENTS_LIQUID = bit.bor(CONTENTS_WATER, CONTENTS_SLIME)
local MASK_SHOT_HIT_WATER = bit.bor(MASK_SHOT, CONTENTS_LIQUID)

local bullet_tr = {}
local bullet_water_tr = {}
local temp_angle = Angle(0, 0, 0)
local temp_ignore_team
local temp_has_spread
local method_to_use, base_ang
local bullet_trace = {mask = MASK_SHOT, output = bullet_tr}
local temp_shooter = NULL
local temp_attacker = NULL
local attacker_player, inflictor_weapon
local temp_vel_ents = {}
local function BaseBulletFilter(ent)
	if ent == temp_shooter or ent == temp_attacker or ent:IsPlayer() and P_Team(ent) == temp_ignore_team then
		return false
	end

	if ent.AlwaysImpactBullets then
		return true
	end

	return true
end

local function HandleShotImpactingWater(damage)
	-- Trace again with water enabled
	bullet_trace.mask = MASK_SHOT_HIT_WATER
	bullet_trace.output = bullet_water_tr
	util.TraceLine(bullet_trace)
	bullet_trace.output = bullet_tr
	bullet_trace.mask = MASK_SHOT

	if bullet_water_tr.AllSolid then return false end

	local contents = util.PointContents(bullet_water_tr.HitPos - bullet_water_tr.HitNormal * 0.1)
	if bit.band(contents, CONTENTS_LIQUID) == 0 then return false end

	if IsFirstTimePredicted() then
		local effectdata = EffectData()
		effectdata:SetOrigin(bullet_water_tr.HitPos)
		effectdata:SetNormal(bullet_water_tr.HitNormal)
		effectdata:SetScale(math.Clamp(damage * 0.25, 5, 30))
		effectdata:SetFlags(bit.band(contents, CONTENTS_SLIME) ~= 0 and 1 or 0)
		util.Effect("gunshotsplash", effectdata)
	end

	return true
end

function EntityMeta:FireBulletsLua(src, dir, spread, num, damage, attacker, force_mul, tracer, callback, hull_size, hit_own_team, max_distance, filter, inflictor)
	max_distance = max_distance or 56756
	attacker = attacker or self
	if not E_IsValid(attacker) then attacker = self end
	force_mul = force_mul or 1

	temp_shooter = self
	temp_attacker = attacker
	attacker_player = attacker:IsPlayer()
	inflictor_weapon = inflictor and inflictor:IsWeapon()

	bullet_trace.start = src
	if filter then
		bullet_trace.filter = filter
	else
		bullet_trace.filter = BaseBulletFilter
		if not hit_own_team and attacker_player then
			temp_ignore_team = P_Team(attacker)
		else
			temp_ignore_team = nil
		end
	end

	if hull_size then
		bullet_trace.maxs = Vector(hull_size, hull_size, hull_size) * 0.5
		bullet_trace.mins = bullet_trace.maxs * -1
		method_to_use = util.TraceHull
	else
		method_to_use = util.TraceLine
	end

	base_ang = dir:Angle()
	temp_has_spread = spread > 0

	for i=0, num - 1 do
		if temp_has_spread then
			temp_angle:Set(base_ang)
			temp_angle:RotateAroundAxis(
				temp_angle:Forward(),
				inflictor_weapon and util.SharedRandom("bulletrotate" .. i, 0, 360) or math.Rand(0, 360)
			)
			temp_angle:RotateAroundAxis(
				temp_angle:Up(),
				inflictor_weapon and util.SharedRandom("bulletangle" .. i, -spread, spread) or math.Rand(-spread, spread)
			)

			dir = temp_angle:Forward()
		end

		bullet_trace.endpos = src + dir * max_distance
		bullet_tr = method_to_use(bullet_trace)

		local hitwater
		if bit.band(util.PointContents(bullet_tr.HitPos), CONTENTS_LIQUID) ~= 0 then
			hitwater = HandleShotImpactingWater(damage)
		end

		local damageinfo = DamageInfo()
		damageinfo:SetDamageType(DMG_BULLET)
		damageinfo:SetDamage(damage)
		damageinfo:SetDamagePosition(bullet_tr.HitPos)
		damageinfo:SetAttacker(attacker)
		damageinfo:SetInflictor(inflictor or self)
		if force_mul > 0 then
			damageinfo:SetDamageForce(force_mul * damage * 70 * dir:GetNormalized())
		else
			damageinfo:SetDamageForce(Vector(0, 0, 1))
		end

		local use_tracer = true
		local use_impact = true
		local use_ragdoll_impact = true
		local use_damage = true

		if callback then
			local ret = callback(attacker, bullet_tr, damageinfo, inflictor)
			if ret then
				if ret.donothing then continue end

				if ret.tracer ~= nil then use_tracer = ret.tracer end
				if ret.impact ~= nil then use_impact = ret.impact end
				if ret.ragdoll_impact ~= nil then use_ragdoll_impact = ret.ragdoll_impact end
				if ret.damage ~= nil then use_damage = ret.damage end
			end
		end

		local ent = bullet_tr.Entity
		if E_IsValid(ent) and use_damage then
			if ent:IsPlayer() then
				temp_vel_ents[ent] = temp_vel_ents[ent] or ent:GetVelocity()
			elseif IsValid(attacker) then
				local phys = ent:GetPhysicsObject()
				if ent:GetMoveType() == MOVETYPE_VPHYSICS and phys:IsValid() and phys:IsMoveable() then
					ent:SetPhysicsAttacker(attacker)
				end
			end

			ent:DispatchTraceAttack(damageinfo, bullet_tr, dir)
		end

		if IsFirstTimePredicted() then
			local effectdata = EffectData()
			effectdata:SetOrigin(bullet_tr.HitPos)
			effectdata:SetStart(src)
			effectdata:SetNormal(bullet_tr.HitNormal)

			if hitwater then
				-- We may not impact, but we DO need to affect ragdolls on the client
				if use_ragdoll_impact then
					util.Effect("RagdollImpact", effectdata)
				end
			elseif use_impact and not bullet_tr.HitSky and bullet_tr.Fraction < 1 then
				effectdata:SetSurfaceProp(bullet_tr.SurfaceProps)
				effectdata:SetDamageType(DMG_BULLET)
				effectdata:SetHitBox(bullet_tr.HitBox)
				effectdata:SetEntity(ent)
				util.Effect("Impact", effectdata)
			end

			if use_tracer then
				if self:IsPlayer() and E_IsValid(self:GetActiveWeapon()) then
					effectdata:SetFlags( 0x0003 ) --TRACER_FLAG_USEATTACHMENT + TRACER_FLAG_WHIZ
					effectdata:SetEntity(self:GetActiveWeapon())
					effectdata:SetAttachment(1)
				else
					effectdata:SetEntity(self)
					effectdata:SetFlags( 0x0001 ) -- TRACER_FLAG_WHIZ
				end
				effectdata:SetScale(2500) -- Tracer travel speed
				util.Effect(tracer or "Tracer", effectdata)
			end
		end
	end

	-- No knockback vs. players. Do this ONLY once to migitate lag compensation issues instead of per bullet. Might just disable lag comp here.
	for ent, vel in pairs(temp_vel_ents) do
		ent:SetLocalVelocity(vel)
	end
	table.Empty(temp_vel_ents)
end