ENT.Type = "anim"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

ENT.CanPackUp = true
ENT.PackUpTime = 3
ENT.MaxAmmo = 300 -- 10 minutes of repair time when fully loaded.
ENT.HealValue = 8
ENT.MaxDistance = 75
ENT.Delay = 1.5
ENT.SWEP = "weapon_zs_repairfield"

ENT.m_NoNailUnfreeze = true
ENT.NoNails = true

ENT.IgnoreBullets = true

ENT.IsBarricadeObject = false
ENT.AlwaysGhostable = true

function ENT:GetObjectHealth()
	return self:GetDTFloat(1)
end

function ENT:SetMaxObjectHealth(health)
	self:SetDTFloat(2, health)
end

function ENT:GetMaxObjectHealth()
	return self:GetDTFloat(2)
end

function ENT:GetNextRepairPulse()
	return self:GetDTFloat(0)
end

function ENT:SetNextRepairPulse(time)
	self:SetDTFloat(0, time)
end

function ENT:SetObjectOwner(owner)
	self:SetDTEntity(0, owner)
end

function ENT:GetObjectOwner()
	return self:GetDTEntity(0)
end

function ENT:SetAmmo(ammo)
	self:SetDTFloat(3, ammo)
end

function ENT:GetAmmo()
	return self:GetDTFloat(3)
end

function ENT:ClearObjectOwner()
	self:SetObjectOwner(NULL)
end

function ENT:SetMaxAmmo(ammo)
	self:SetDTInt(0, ammo)
end

function ENT:GetMaxAmmo()
	return self:GetDTInt(0)
end
