DeriveGamemode("sandbox")

GM.Name 	= "Flood"
GM.Author 	= "Mythikos & Freezebug"
GM.Version  = "2.0.0"
GM.Email 	= "n/a"
GM.Website 	= "n/a"

-- Include Shared files
for _, file in pairs (file.Find("flood/gamemode/shared/*.lua", "LUA")) do
   include("flood/gamemode/shared/"..file); 
end

TEAM_PLAYER = 2

team.SetUp(TEAM_PLAYER, "Player", Color(16, 153, 156))

-- Format coloring because garry likes vectors for playermodels
function GM:FormatColor(col)
	col = Color(col.r * 255, col.g * 255, col.b * 255)
	return col
end

function GM:PlayerNoClip(ply)
	if ply:IsAdmin() then
		return true
	end

	return false
end

function PlayerCreateTeam(teamname, teamcolor, teamowner, teamisjoinable) -- clientside team creation (MEN)
	local allteams = team.GetAllTeams()

	local count = 0
	for k, v in pairs(allteams) do
		count = count + 1
	end

	for i = 1, count do
		if team.GetName(i) == teamname then
			teamowner:PrintMessage(HUD_PRINTTALK, "There is already a team with that name!")
			return
		end
	end

	local teamnumber = count + 1

	team.SetUp(teamnumber, teamname, teamcolor, teamisjoinable)
end

if SERVER then -- serverside team creation (MEN)
	net.Receive("flood_customteamcreation", function()
		local teamname = net.ReadString()
		local teamcolor = net.ReadColor()
		local teamowner = net.ReadEntity()
		local teamisjoinable = net.ReadBool()
	
		local allteams = team.GetAllTeams()
	
		local count = 0
		for k, v in pairs(allteams) do
			count = count + 1
		end
	
		local teamnumber = count + 1
	
		team.SetUp(teamnumber, teamname, teamcolor, teamisjoinable)
	
		if teamowner:Team() ~= teamnumber then
			teamowner:SetTeam(teamnumber)
		end
	end)
end