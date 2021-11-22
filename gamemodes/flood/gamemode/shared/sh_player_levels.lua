function CalculateLevel(pl)
	local Level = 0
	
	if not pl:IsBot() then
		local Exp = tonumber(pl:GetNWFloat("Experience"))
		
		for i=1,1000 do
			local ExpForLevel = math.floor(1.095808^i+99+(i-1)*5)
			
			if Exp >= ExpForLevel then
				Exp = Exp - ExpForLevel
				Level = Level + 1
			else
				return Level
			end
		end
	end
end

function ExtraExp(pl)
	local Level = 0
	
	if not pl:IsBot() then
		local Exp = tonumber(pl:GetNWFloat("Experience"))
		
		for i=1,1000 do
			local ExpForLevel = math.floor(1.095808^i+99+(i-1)*5)
			
			if Exp >= ExpForLevel then
				Exp = Exp - ExpForLevel
				Level = Level + 1
			else
				return Exp
			end
		end
	end
end

function ExpForLevel(pl)
	if not pl:IsBot() then
		local NextLevel = CalculateLevel(pl) + 1
		
		return math.floor(1.095808^NextLevel+99+(NextLevel-1)*5)
	end
end