AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_animations.lua")

include("shared.lua")

function ENT:Initialize()
	self.DieTime = CurTime() + self.LifeTime

	self:SetModel("models/weapons/w_grenade.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_WEAPON)

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
		phys:SetMass(8)
		phys:SetMaterial("metal")
	end

	local spriteTrail = ents.Create("env_spritetrail")
	if IsValid(spriteTrail) then
		spriteTrail:SetKeyValue("startwidth", "1")
		spriteTrail:SetKeyValue("endwith", "1")
		spriteTrail:SetKeyValue("lifetime", "0.5")
		spriteTrail:SetKeyValue("rendermode", "5")
		spriteTrail:SetKeyValue("renderamt", "255")
		spriteTrail:SetKeyValue("rendercolor", "255 0 0")
		spriteTrail:SetKeyValue("spritename", "sprites/laser.vmt")
		spriteTrail:SetPos(self:GetPos() + self:GetUp() * 8)
		spriteTrail:SetParent(self)
		spriteTrail:SetOwner(self)
		spriteTrail:Spawn()
	end
end

function ENT:PhysicsCollide(data, phys)
	if (data.Speed > 20) and (data.DeltaTime > 0.25) then
		local phys = self:GetPhysicsObject()
		if phys:IsValid() then
			phys:SetVelocity(self:GetVelocity() * 0.2)
		end

		self:EmitSound("physics/metal/metal_grenade_impact_hard"..math.random(1,3)..".wav")
	end
end

function ENT:Think()
	if self.Exploded then
		self:Remove()
	elseif self.DieTime <= CurTime() then
		self:Explode()
	end
end

local projectileDamage = 8
function ENT:Explode()
	if self.Exploded then return end
	self.Exploded = true

	local owner = self:GetOwner()
	if owner:IsValid() and owner:IsPlayer() and (owner:Team() == TEAM_HUMAN) then
		local pos = self:GetPos()
		for i=1, 20 do
			local ent = ents.Create("projectile_devourer")
			if ent:IsValid() then
				ent:SetPos(pos)
				ent:SetOwner(owner)
				ent.ProjDamage = projectileDamage
				ent.ProjSource = self
				ent.ShotMarker = i
				ent.Team = owner:Team()
				ent:Spawn()

				local phys = ent:GetPhysicsObject()
				if phys:IsValid() then
					phys:Wake()

					local angle = Angle(math.random(180, 360), math.random(0, 360), 0)
					angle:RotateAroundAxis(angle:Forward(), math.Rand(0, 360))
					angle:RotateAroundAxis(angle:Up(), math.Rand(-0, 360))

					ent.PreVel = angle:Forward() * 1500
					phys:SetVelocityInstantaneous(ent.PreVel)
				end
			end
		end

		local effectdata = EffectData()
			effectdata:SetOrigin(pos)
		util.Effect("Explosion", effectdata)
	end
end