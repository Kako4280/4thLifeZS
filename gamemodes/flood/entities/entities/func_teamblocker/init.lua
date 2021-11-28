ENT.Type = "brush"

function ENT:Initialize()
	self:SetTrigger(true)

	if self.On == nil then self.On = true end

	self.IsClaimed = false
	self.Claimer = nil
	self.ClaimerTeamMembers = nil
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
        if self.On and ent:IsPlayer() and self.IsClaimed == false then
			local ct = ChatText()
	        local plyteam = ent:Team()

			if plyteam > 2 and plyteam ~= 1001 and plyteam ~= 1002 then -- check if the player has already claimed a room first.
				for k, v in pairs(team.GetPlayers(plyteam)) do
					if v.ClaimedARoom == true then
						ct:AddText("Your team has already claimed a room!", Color(158, 49, 49, 255))
						ct:Send(ent)
			
						ent:Spawn()
						return
					end
				end
			else
				if ent.ClaimedARoom == true then
					ct:AddText("You have already claimed a room!", Color(158, 49, 49, 255))
					ct:Send(ent)
	
					ent:Spawn()
					return
				end
			end

			if plyteam > 2 and plyteam ~= 1001 and plyteam ~= 1002 then -- give everyone on the team claimedaroom = true
				for k, v in pairs(team.GetPlayers(plyteam)) do
					v.ClaimedARoom = true
				end
			else
				ent.ClaimedARoom = true
			end

			ent.ClaimedARoom = true
			ct:AddText("You have claimed this room.", Color(49, 158, 49))
			ct:Send(ent)
			self.IsClaimed = true

			self:SetMaterial("dev/dev_measuregeneric01b")
			--self:SetMaterial("effects/combine_binocoverlay")

			if self.Claimer == nil then -- prevent this from being overriden (???? idk how it was getting overriden before)
				self.Claimer = ent
			end

			if self.Claimer ~= nil and plyteam > 2 and plyteam ~= 1001 and plyteam ~= 1002 then
				self.ClaimerTeamMembers = team.GetPlayers(plyteam)
			end
        end
		if self.On and ent:IsPlayer() and self.IsClaimed == true then
			local ct = ChatText()
	        local plyteam = ent:Team()

			if self.ClaimerTeamMembers ~= nil then
				if ent == self.ClaimerTeamMembers[1] or ent == self.ClaimerTeamMembers[2] or ent == self.ClaimerTeamMembers[3] or ent == self.ClaimerTeamMembers[4] then
					print("MEN")
				else
					ct:AddText("You do not own this room!", Color(158, 49, 49, 255))
					ct:Send(ent)
		
					ent:Spawn()
					return
				end
			else
				if ent ~= self.Claimer then
					ct:AddText("You do not own this room!", Color(158, 49, 49, 255))
					ct:Send(ent)
			
					ent:Spawn()
					return
				end
			end
		end
    end
end