-- Include everything
include("shared.lua")
 
MsgN("_-_-_-_- Flood Client Side -_-_-_-_")
MsgN("Loading Clientside Files")
for _, file in pairs(file.Find("flood/gamemode/client/*.lua", "LUA")) do
	MsgN("-> "..file)
	include("flood/gamemode/client/"..file)
end

MsgN("Loading Clientside VGUI Files")
for _, file in pairs(file.Find("flood/gamemode/client/vgui/*.lua", "LUA")) do
	MsgN("-> "..file)
	include("flood/gamemode/client/vgui/"..file)
end

surface.CreateFont("FloodFontDefaultSmall", {
	font = "DermaDefault",
	extended = false,
	size = 20,
	antialias = true,
})

function GM:SpawnMenuOpen(ply)
	return false
end

function GM:ContextMenuOpen(ply)
	return false
end

function GM:CanProperty(ply, property, ent)
	return false
end

net.Receive("CreateTeam", function()
	team.SetUp(net.ReadInt(32), net.ReadString(), net.ReadColor(), net.ReadBool())
	if net.ReadBool() then
		timer.Simple(math.Round((LocalPlayer():Ping() / 1000 + 0.03), 2), function() MakepTeamMenu() end)
	end
end)