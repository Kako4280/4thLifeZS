ENT.Type = "anim"

ENT.CanPackUp = true
ENT.PackUpTime = 2
ENT.MaxAmmo = 120

ENT.WrenchRepairMultiplier = 0.5

ENT.m_NoNailUnfreeze = true
ENT.NoNails = true

ENT.IsBarricadeObject = false
ENT.AlwaysGhostable = true

function ENT:GetObjectHealth()
	return self:GetDTFloat(0)
end

function ENT:SetMaxObjectHealth(health)
	self:SetDTFloat(1, health)
end

function ENT:GetMaxObjectHealth()
	return self:GetDTFloat(1)
end

function ENT:SetObjectOwner(owner)
	self:SetDTEntity(0, owner)
end

function ENT:GetObjectOwner()
	return self:GetDTEntity(0)
end

function ENT:SetAmmo(ammo)
	self:SetDTFloat(2, ammo)
end

function ENT:GetAmmo()
	return self:GetDTFloat(2)
end

function ENT:SetMaxAmmo(ammo)
	self:SetDTInt(0, ammo)
end

function ENT:GetMaxAmmo()
	return self:GetDTInt(0)
end
