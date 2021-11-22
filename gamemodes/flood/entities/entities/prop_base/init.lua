AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

--Owner of the prop.
function ENT:SetPropOwner(ent)
	self:SetDTEntity(0, ent)
end

--If the owner is a member of a team, this assigns the prop to that team.
function ENT:SetPropTeam(team)
	self:SetDTInt(0, team)
end

--Health of a prop.
function ENT:SetPropHealth(num)
	self:SetDTFloat(0, math.max(num, 0))
end

--Maximum health of a prop. Used for drawing health bars or something.
function ENT:SetPropMaxHealth(num)
	self:SetDTFloat(1, math.max(num, 0))
end

--Alter the weight of a prop.
function ENT:SetPropMass(num)
	self:SetDTFloat(2, math.max(num, 0))
end

--Alter the size of a prop.
function ENT:SetPropScale(num)
	self:SetDTFloat(3, math.max(num, 0.01))
end

--Alter how well a prop floats.
function ENT:SetPropBuoyancy(num)
	self:SetDTFloat(4, math.max(num, 0))
end

--Chance for prop to acquire a rare attribute. Value range: 0-1
function ENT:SetLuck(num)
	self:SetDTFloat(5, math.Clamp(num, 0, 1))
end

--Standard type of prop: Generic(Typeless), Metal, Wood, Plastic, Rubber, or Stone.
function ENT:SetPrimaryElement(str)
	self:SetDTString(0, str)
end

--Rare attributes,
function ENT:SetSecondaryElement(str)
	if IsValid(str) then
		self:SetDTString(1, str)
	end
end

--What are you going to name it?
function ENT:SetPropName(str)
	return self:SetDTString(2, str)
end

function ENT:Initialize()
	print(self.PropHealth or 1)
	self:SetPropName(self.PropName)
	self:SetPropHealth(self.PropHealth or 1)
	self:SetPropMaxHealth(self.MaxPropHealth or 1)
	self:SetModel(self.Model)
	self:SetMaterial(self.Material or self:GetMaterial())
	self:SetPropMass(self.Mass or 1)
	self:SetPropScale(self.Scale or 1)
	self:SetPropBuoyancy(self.Buoyancy or 1)
	self:SetLuck(self.Luck or 0)
	self:SetPrimaryElement(self.PrimaryElement or "Generic")
	self:SetSecondaryElement(self.SecondaryElement or nil)
	
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
	
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:SetMaterial("material")
		phys:EnableMotion(true)
		phys:EnableGravity(true)
		phys:SetMass(45)
		phys:Wake()
	end
end
