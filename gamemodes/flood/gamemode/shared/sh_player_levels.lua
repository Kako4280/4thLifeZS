function CalculateLevel(pl)
	local Level = 0
	
	if not pl:IsBot() then
		local Exp = pl:GetNWFloat("Experience")
		
		for i=1,1000 do
			local ExpForLevel = math.floor(1.095808^i+99+(i-1)*5)
			
			if ExpForLevel >= Exp then
				Exp - ExpForLevel
				Level = Level + 1
			else
				continue
			end
		end
	end
end