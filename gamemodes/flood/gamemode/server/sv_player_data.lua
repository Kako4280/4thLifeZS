function PlayerDataStart()
	if !sql.TableExists("PlayerData_Flood") then
		sql.Query("CREATE TABLE PlayerData_Flood(SteamID64 STRING, Experience FLOAT, Currency FLOAT, Wins INTEGER, Losses INTEGER, TotalDamage FLOAT, PropsDestroyed INTEGER);")
	end
end
hook.Add("Initialize", "PlayerDataStart", PlayerDataStart)

function PlayerDataLoad(pl)
	if not pl:IsBot() then	
		--sql.Query("DELETE FROM PlayerData_Flood WHERE SteamID64='".. pl:SteamID64() .."';")
		pl.PlayerData = sql.QueryRow("SELECT * FROM PlayerData_Flood WHERE SteamID64='".. pl:SteamID64() .."';")

		if !sql.TableExists("PlayerData_Flood") then
			sql.Query("CREATE TABLE PlayerData_Flood(SteamID64 STRING, Experience FLOAT, Currency FLOAT, Wins INTEGER, Losses INTEGER, TotalDamage FLOAT, PropsDestroyed INTEGER);")
		end
	
		if not IsValid(pl.PlayerData) then
			sql.Query("INSERT INTO PlayerData_Flood(SteamID64, Experience, Currency, Wins, Losses, TotalDamage, PropsDestroyed) VALUES('".. pl:SteamID64() .."', 0, 0, 0, 0, 0, 0);")
			pl.PlayerData = sql.QueryRow("SELECT * FROM PlayerData_Flood WHERE SteamID64='".. pl:SteamID64() .."';")
		end	
		
		pl:SetNWFloat("Experience", pl.PlayerData.Experience)
	end
end
hook.Add("PlayerInitialSpawn", "PlayerDataLoad", PlayerDataLoad)

function PlayerDataUpdate(pl)--To be called on round end and player disconnect events.
	sql.Query("UPDATE PlayerData_Flood SET Experience='".. pl.PlayerData.Experience .."', SET Currency='".. pl.PlayerData.Currency .."', SET Wins='".. pl.PlayerData.Wins .."', SET Losses='".. pl.PlayerData.Losses .."', SET TotalDamage='".. pl.PlayerData.TotalDamage .."', SET PropsDestroyed='".. pl.PlayerData.PropsDestroyed .."' WHERE SteamID64='"..pl:SteamID64().."';")
end
hook.Add("PlayerDisconnected", "PlayerDataUpdate", PlayerDataUpdate)

function PlayerDataUpdateOnRoundEnd()
	timer.Simple(1, function()
		for _, v in pairs(player.GetAll()) do
			if not v:IsBot() then
				v.PlayerData.Experience = v.PlayerData.Experience + 1
				print(v.PlayerData.Experience)
				PlayerDataUpdate(v)
			end
		end
	end)
end