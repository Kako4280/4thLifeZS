INC_SERVER()
AddCSLuaFile("animations.lua")

function SWEP:ApplyFire()

end

function SWEP:ApplyElectric()

end

function SWEP:ApplyIce(hitent)
    if hitent:GetClass() == "prop_base" then
        hitent.Frozen = true
        hitent.FrozenDuration = CurTime() + 5
    end
end

function SWEP:ApplyAcid()

end

function SWEP:ApplyCurse()

end