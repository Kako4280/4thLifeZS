AddCSLuaFile()

SWEP.PrintName = "Dire Zombie"

SWEP.Base = "weapon_zs_zombie"

SWEP.MeleeDamage = 32
SWEP.MeleeDamageVsProps = 35

SWEP.AlertDelay = 2.75

function SWEP:Reload()
	self:SecondaryAttack()
end

function SWEP:PlayAttackSound()
	self:EmitSound("npc/zombie/zo_attack"..math.random(2)..".wav", 70, math.random(87, 92))
end

function SWEP:PlayAlertSound()
	self:GetOwner():EmitSound("npc/zombie/zombie_alert"..math.random(3)..".wav", 70, math.random(87, 92))
end

function SWEP:PlayIdleSound()
	self:GetOwner():EmitSound("npc/zombie/zombie_voice_idle"..math.random(14)..".wav", 70, math.random(87, 92))
end

function SWEP:MeleeHit(ent, trace, damage, forcescale)
	if not ent:IsPlayer() then
		damage = self.MeleeDamageVsProps
	end

	self.BaseClass.MeleeHit(self, ent, trace, damage, forcescale)
end

function SWEP:ApplyMeleeDamage(ent, trace, damage)
	self.BaseClass.ApplyMeleeDamage(self, ent, trace, damage)
end

if not CLIENT then return end

function SWEP:ViewModelDrawn()
	render.ModelMaterialOverride(0)
end

function SWEP:PreDrawViewModel(vm)
	render.SetColorModulation(0.5, 0, 0)
end
