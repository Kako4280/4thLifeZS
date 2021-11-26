ENT.Type = "point"

function ENT:AcceptInput(name, activator, caller, args)
	name = string.lower(name)
    if name == "setbuildtime" then
		GAMEMODE.buildtimeoverride = tonumber(args) or 30
    elseif name == "setfighttime" then
        GAMEMODE.fighttimeoverride = tonumber(args) or 30
    elseif name == "setresettime" then
        GAMEMODE.resettimeoverride = tonumber(args) or 30
    elseif name == "setfloodtime" then
        GAMEMODE.floodtimeoverride = tonumber(args) or 30
    end
end