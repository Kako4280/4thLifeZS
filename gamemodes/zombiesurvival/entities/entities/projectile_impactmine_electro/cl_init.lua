INC_CLIENT()

local matBeam = Material("effects/laser1")
local matGlow = Material("sprites/glow04_noz")
local colBeam = Color(0, 0, 100, 255)
local COLOR_WHITE = color_white
local trace = {mask = MASK_SHOT}

function ENT:Initialize()
	local cmodel = ClientsideModel("models/roller_spikes.mdl")
	if cmodel:IsValid() then
		cmodel:SetPos(self:LocalToWorld(Vector(0, 0, 3)))
		cmodel:SetAngles(self:LocalToWorldAngles(Angle(0, -10, 0)))
		cmodel:SetColor( Color(90, 90, 90, 255) )
		cmodel:SetSolid(SOLID_NONE)
		cmodel:SetMoveType(MOVETYPE_NONE)
		cmodel:SetParent(self)
		cmodel:SetOwner(self)
		cmodel:SetModelScale(0.32, 0)
		cmodel:Spawn()

		self.CModel = cmodel
	end
end

function ENT:DrawTranslucent()
	if not self:IsActive() then return end

	local pos = self:GetStartPos()
	if CurTime() >= self.NextTrace then
		self.NextTrace = CurTime() + 0.15

		local forward = self:GetUp()
		trace.start = pos
		trace.endpos = pos + forward * self.Range
		trace.filter = self:GetCachedScanFilter()

		self.LastPos = util.TraceLine(trace).HitPos
	end

	local hitpos = self.LastPos
	render.SetMaterial(matBeam)
	render.DrawBeam(pos, hitpos, 0.33, 0, 1, COLOR_WHITE)
	render.DrawBeam(pos, hitpos, 1.3, 0, 1, colBeam)
	render.SetMaterial(matGlow)
	render.DrawSprite(pos, 2, 2, COLOR_WHITE)
	render.DrawSprite(pos, 8, 8, colBeam)
	render.DrawSprite(hitpos, 1, 1, COLOR_WHITE)
	render.DrawSprite(hitpos, 4, 4, colBeam)
end

function ENT:OnRemove()
	if self.CModel and self.CModel:IsValid() then
		self.CModel:Remove()
	end
end