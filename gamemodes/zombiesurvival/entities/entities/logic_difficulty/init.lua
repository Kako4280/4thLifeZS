ENT.Type = "point"

function ENT:AcceptInput(name, activator, caller, args)
	name = string.lower(name)
	if name == "setzombiedamagemultiplier" then
		GAMEMODE.ZombieDamageMultiplier = tonumber(args) or 1
	elseif name == "setzombiespeedmultiplier" then
		GAMEMODE.ZombieSpeedMultiplier = tonumber(args) or 1
	elseif name == "setnumberofsigils" then
		GAMEMODE.MaxSigils = tonumber(args) or 3
	--[[elseif name == "barricadehealthmultiplier" then

        will work on this later maybe ((PROBABLY NOT LOL!!))
		end]]--
	end
end
