ENT.Type = "anim"
function ENT:Initialize()
util.PrecacheModel("models/props_junk/sawblade001a.mdl")
end

function ENT:ShouldNotCollide(ent)
	return ent:IsPlayer() and ent:Team() == TEAM_HUMAN
end