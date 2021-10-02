AddCSLuaFile()

SWEP.Base = "weapon_zs_zombie"

SWEP.PrintName = "Fresh Dead"

SWEP.ViewModel = Model("models/weapons/zombie_arms/z_classic.mdl")

SWEP.MeleeDamage = 20

function SWEP:Reload()
	self:SecondaryAttack()
end

function SWEP:StartMoaning()
end

function SWEP:StopMoaning()
end

function SWEP:IsMoaning()
	return false
end
