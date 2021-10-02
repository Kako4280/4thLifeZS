INC_CLIENT()

ENT.NextEmit = 0

local matTrail = Material("cable/rope")
function ENT:Draw()
	if self:GetParent() ~= NULL then
		self:SetLocalPos(Vector(0, 0, -30))
	end
	self:DrawModel()
	if self:GetParent() ~= NULL then
		self:SetLocalPos(Vector(0, 0, 0))
	end

	local pos = self:GetPos()
	--pos.z = pos.z

	render.SetMaterial(matTrail)
	render.DrawBeam(pos, self:GetPuller():WorldSpaceCenter(), 3, 4, 0, Color(155, 100, 55, 255))
end

function ENT:Initialize()
	self.AmbientSound = CreateSound(self, "npc/strider/strider_skewer1.wav")
	self.Created = CurTime()
end

function ENT:Think()
	self.AmbientSound:PlayEx(1, 50 + math.min(1, CurTime() - self.Created) * 30)

	self:NextThink(CurTime())
	return true
end
