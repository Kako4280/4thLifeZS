ENT.Type = "anim"

ENT.PropName = "Base Prop"
ENT.PropHealth = nil
ENT.MaxPropHealth = nil
ENT.Model = "models/props_c17/FurnitureWashingmachine001a.mdl"
ENT.Material = nil
ENT.Mass = nil
ENT.Scale = nil
ENT.Buoyancy = nil
ENT.Luck = nil
ENT.PrimaryElement = nil
ENT.SecondaryElement = nil
ENT.Prop = true

--Owner of the prop.
function ENT:GetPropOwner()
	return self:GetDTEntity(0)
end

--If the owner is a member of a team, this assigns the prop to that team.
function ENT:GetPropTeam()
	return self:GetDTInt(0)
end

--Health of a prop.
function ENT:GetPropHealth(num)
	return self:GetDTFloat(0)
end

--Maximum health of a prop. Used for drawing health bars or something.
function ENT:GetPropMaxHealth(num)
	return self:GetDTFloat(1)
end

--Weight of a prop.
function ENT:GetPropMass(num)
	return self:GetDTFloat(2)
end

--Size of a prop.
function ENT:GetPropScale(num)
	return self:GetDTFloat(3)
end

--How well a prop floats.
function ENT:GetPropBuoyancy(num)
	return self:GetDTFloat(4)
end

--Chance for prop to acquire a rare attribute. Value range: 0-1
function ENT:GetLuck(num)
	return self:GetDTFloat(5)
end

--Standard type of prop: Generic(Typeless), Metal, Wood, Plastic, Rubber, or Stone.
function ENT:GetPrimaryElement()
	return self:GetDTString(0)
end

--Rare attributes,
function ENT:GetSecondaryElement()
	return self:GetDTString(1)
end

--What are you going to name it?
function ENT:GetPropName()
	return self:GetDTString(2)
end