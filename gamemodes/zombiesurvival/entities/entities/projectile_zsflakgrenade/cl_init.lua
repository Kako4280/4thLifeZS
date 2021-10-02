include("shared.lua")
include("cl_animations.lua")

ENT.NextTickSound = 0
ENT.LastTickSound = 0

function ENT:Initialize()
	self.Emitter = ParticleEmitter(self:GetPos())
	self.Emitter:SetNearClip(48, 64)

	self.DieTime = CurTime() + self.LifeTime

	local weptab = weapons.GetStored("weapon_zs_grenade_flak")
	if weptab then
		self.WeaponTab = weptab
		self.ShowWorldModel = weptab.ShowWorldModel

		if weptab.WElements and (weptab.ShowDroppedWElements) then
			self.WElements = table.FullCopy(weptab.WElements)
			self:CreateModels(self.WElements)
		end
	end
end

function ENT:Think()
	if (self.NextTickSound <= CurTime()) then
		local delta = self.DieTime - CurTime()

		self.NextTickSound = CurTime() + math.max(0.2, delta * 0.25)
		self.LastTickSound = CurTime()
		self:EmitSound("weapons/grenade/tick1.wav", 75, math.Clamp((1 - delta / self.LifeTime) * 160, 100, 160))
	end
end

function ENT:OnRemove()
	self:RemoveModels()
end

local matGlow = Material("sprites/glow04_noz")
function ENT:Draw()
	if (not self.NoDrawSubModels) then
		self:RenderModels()
	end

	local noDrawWorldModel = (self.ShowWorldModel == false)
	if noDrawWorldModel then
		render.SetBlend(0)
	end

	self:DrawModel()

	if noDrawWorldModel then
		render.SetBlend(1)
	end

	if (math.abs(self.LastTickSound - CurTime()) < 0.1) then
		local pos = self:GetPos() + (self:GetUp() * 8)

		render.SetMaterial(matGlow)
		render.DrawSprite(pos, 16, 16, COLOR_RED)

		local dlight = DynamicLight(self:EntIndex())
		if dlight then
			dlight.Pos = pos
			dlight.r = 255
			dlight.g = 0
			dlight.b = 0
			dlight.Brightness = 0.75
			dlight.Size = 64
			dlight.Decay = 256
			dlight.DieTime = CurTime() + 0.1
		end
	end
end