function EFFECT:Init(data)
	local pos = data:GetOrigin()
	local norm = data:GetNormal()

	local particle

	sound.Play("nox/scatterfrost.ogg", pos, 75, math.Rand(95, 115))
	sound.Play("ambient/wind/wind_hit"..math.random(3)..".wav", pos, 75, math.Rand(160, 180))

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(16, 24)

	for i=1, math.random(15, 20) do
        local RandDarkness = math.Rand(0.8, 1.0)
		particle = emitter:Add("particle/sparkles", pos)
		particle:SetVelocity(VectorRand():GetNormal() * math.random(400,520))
		particle:SetAirResistance(math.random(400,600))
		particle:SetGravity(Vector(0,0,-45))
		particle:SetDieTime(math.Rand(3, 5))
		particle:SetStartAlpha(200)
		particle:SetEndAlpha(100)
		particle:SetStartSize(0.85)
		particle:SetEndSize(0)
		particle:SetRoll(math.Rand(0, 360))
		particle:SetRollDelta(math.Rand(-6, 6))
        particle:SetGravity(Vector(0, 0, -450))
		particle:SetColor(145 * RandDarkness, 230 * RandDarkness, 255 * RandDarkness)
        particle:SetBounce(0.45)
        particle:SetCollide(true)
	end
	for i=1, 16 do
		particle = emitter:Add("particles/smokey", pos)
		particle:SetVelocity(VectorRand():GetNormal() * 140)
		particle:SetDieTime(math.Rand(0.55, 0.85))
		particle:SetStartAlpha(math.Rand(70, 90))
		particle:SetStartSize(0.6)
		particle:SetEndSize(math.Rand(60, 90))
		particle:SetRoll(math.Rand(-360, 360))
		particle:SetRollDelta(math.Rand(-4.5, 4.5))
		particle:SetColor(40, 160, 255)
	end


	emitter:Finish() emitter = nil collectgarbage("step", 64)

end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end