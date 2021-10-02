INC_CLIENT()

function ENT:Draw()
end

function ENT:Initialize()
	self:GetOwner().HBleed = self
end
