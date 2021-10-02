ENT.Type = "anim"

function ENT:ShouldNotCollide(ent)
	return ent:IsPlayer()
end

util.PrecacheModel("models/Combine_Helicopter/helicopter_bomb01.mdl")
