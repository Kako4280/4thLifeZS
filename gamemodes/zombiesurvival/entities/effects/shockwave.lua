function EFFECT:Init(effectdata)
	local pos = effectdata:GetOrigin()
	local normal = effectdata:GetNormal()
	
	sound.Play("weapons/physcannon/energy_sing_explosion2.wav", pos, 80, math.random(100, 120))

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(24, 32)

	for i=1, 3 do
		local particle = emitter:Add("effects/select_ring", pos)
		particle:SetDieTime(0.1 + i * 0.1)
		particle:SetColor(255,255,255)
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(0)
		particle:SetStartSize(0)
		particle:SetEndSize(50)
		particle:SetAngles(normal:Angle())
		local particle2 = emitter:Add("effects/select_ring", pos)
		particle2:SetDieTime(0.2 + i * 0.1)
		particle2:SetColor(255,255,255)
		particle2:SetStartAlpha(255)
		particle2:SetEndAlpha(0)
		particle2:SetStartSize(0)
		particle2:SetEndSize(75)
		particle2:SetAngles(normal:Angle())
	end
	for i=1, 50 do
		local particle = emitter:Add("effects/splash2", pos)
		particle:SetDieTime(0.2)
		particle:SetColor(255,255,255)
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(0)
		particle:SetStartSize(3)
		particle:SetEndSize(3)
		particle:SetStartLength(30)
		particle:SetEndLength(30)
		particle:SetVelocity(VectorRand():GetNormal() * math.random(300,450))
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end

