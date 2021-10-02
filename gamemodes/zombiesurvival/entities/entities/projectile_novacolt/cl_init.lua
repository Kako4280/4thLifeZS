INC_CLIENT()

local matGlow = Material("effects/splashwake1")
local matGlow2 = Material("sprites/glow04_noz")
local matWhite = Material("models/debug/debugwhite")
local vector_origin = vector_origin

function ENT:Draw()

	render.ModelMaterialOverride(matWhite)
	render.SetColorModulation(1, 0.5, 0.2)
	render.SuppressEngineLighting(true)
	self:DrawModel()
	render.SuppressEngineLighting(false)
	render.SetColorModulation(1, 1, 1)
	render.ModelMaterialOverride(nil)

	local pos = self:GetPos()

	if self:GetVelocity() ~= vector_origin then
		render.SetMaterial(matGlow2)
		render.DrawSprite(pos, 50, 50, Color(175, 175, 75, 75))
		render.SetMaterial(matGlow)
		render.DrawSprite(pos, 12, 12, Color(100, 100, 100))

		local emitter = ParticleEmitter(pos)
		emitter:SetNearClip(24, 32)
		local particle
		for i=0, 1 do
			local RandCol = math.random(155, 205)
			particle = emitter:Add(matGlow2, pos)
			particle:SetVelocity(VectorRand() * 5)
			particle:SetDieTime(0.1)
			particle:SetStartAlpha(125)
			particle:SetEndAlpha(0)
			particle:SetStartSize(5)
			particle:SetEndSize(0)
			particle:SetRollDelta(math.Rand(-10, 10))
			particle:SetColor(RandCol, RandCol, 100)
		end
		emitter:Finish() emitter = nil collectgarbage("step", 64)
	end
end

function ENT:OnRemove()
	local randvel = 0
	local pos = self:GetPos()

	sound.Play("weapons/physcannon/energy_bounce1.wav", pos, 75, math.random(124, 135))

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(24, 32)
	local particle
	for i=0, 16 do
		randvel = Vector( math.random(-1, 1), math.random(-1, 1), math.Rand( -0.25, 0.75) )
		local RandCol = math.random(135, 190)

		particle = emitter:Add(matGlow, pos)
		particle:SetVelocity(VectorRand() * 75)
		particle:SetDieTime(1.2)
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(100)
		particle:SetStartSize(math.random(2.5, 3.75))
		particle:SetEndSize(math.random(0.5, 0.75))
		particle:SetRoll(math.Rand(-0.8, 0.8))
		particle:SetRollDelta(math.Rand(-3, 3))
		particle:SetVelocity( randvel:GetNormal() * 200)
		particle:SetGravity(Vector(0, 0, -250))
		particle:SetColor( 200, RandCol, 100 )
	end
	for i=0,5 do
		local RandCol = math.random(175, 205)
		particle = emitter:Add(matGlow, pos)
		particle:SetVelocity(VectorRand() * 5)
		particle:SetDieTime(0.5)
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(0)
		particle:SetStartSize(5)
		particle:SetEndSize(math.Rand(21,24))
		particle:SetRoll(math.Rand(-0.8, 0.8))
		particle:SetRollDelta(math.Rand(-3, 3))
		particle:SetColor(RandCol, RandCol, 65)
	end
	emitter:Finish() emitter = nil collectgarbage("step", 64)
end

function ENT:Initialize()
end

function ENT:Think()
end
