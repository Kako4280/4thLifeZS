EFFECT.DieTime = 0

EFFECT.LifeTime = 0.3

function EFFECT:GetDelta()
	return math.Clamp(self.DieTime - CurTime(), 0, self.LifeTime) / self.LifeTime
end

function EFFECT:Init(data)
	self.StartPos = self:GetTracerShootPos(data:GetStart(), data:GetEntity(), data:GetAttachment())
	self.EndPos = data:GetOrigin()
	self.HitNormal = data:GetNormal() * -1
	self.Color = Color(0, 220, 255, 255)
	self.LifeTime = 0.15 + 0.013 * ((self.StartPos - self.EndPos):Length() ^ 0.5) -- Keep the particle relatively constant speed
	self.DieTime = CurTime() + self.LifeTime

	self.Dir = self.EndPos - self.StartPos

	self.QuadPos = self.EndPos + self.HitNormal

	self.DieTime = CurTime() + 0.1
end

function EFFECT:Think()
	return CurTime() < self.DieTime
end

local colortest = Color(0, 220, 255, 255)

local matBeam2 = Material("effects/spark")

function EFFECT:Render()
	local delta = self:GetDelta()
	if delta <= 0 then return end
	self.Color.a = delta * 155

	local startpos = self.StartPos
	local endpos = self.QuadPos

		local fDelta = (self.DieTime - CurTime()) / 0.1
	fDelta = math.Clamp(fDelta, 0, 1)
	local sinWave = math.sin(fDelta * math.pi)

	local size = delta * 50
	render.SetMaterial(matBeam2)
	render.DrawBeam(self.EndPos - self.Dir * (fDelta - sinWave * 0.2), self.EndPos - self.Dir * (fDelta + sinWave * 0.2), 4 + sinWave * 16, 1, 0, self.Color)
end

