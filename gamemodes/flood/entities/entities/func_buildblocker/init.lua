ENT.Type = "brush"

function ENT:Initialize()
	self:SetTrigger(true)

	if self.On == nil then self.On = true end
	if self.Silent == nil then self.Silent = false end
	if self.InstantChange == nil then self.InstantChange = true end
end

function ENT:Think()
end

function ENT:AcceptInput(name, activator, caller, args)
	name = string.lower(name)
	if string.sub(name, 1, 2) == "on" then
		self:FireOutput(name, activator, caller, args)
	elseif name == "seton" then
		self.On = tonumber(args) == 1
		return true
	elseif name == "enable" then
		self.On = true
		return true
	elseif name == "disable" then
		self.On = false
		return true
	end
end

function ENT:StartTouch(ent)
    if GAMEMODE:GetGameState() <= 1 then
        if self.On and ent:GetClass() == "prop_base" then
            local ct = ChatText()
            ct:AddText("You cannot build here!", Color(158, 49, 49, 255))
            ct:Send(ent:GetPropOwner())
            
            ent:GetPropOwner():AddCash(ent:GetPropCost())
            ent:Remove()
        end
    end
end