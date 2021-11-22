function AddXP(pl, amount)
	if not pl:IsBot() then
		pl.PlayerData.Experience = pl.PlayerData.Experience + amount
		pl:SetNWFloat("Experience", pl.PlayerData.Experience)
		PlayerDataUpdate(pl)
	end
end

