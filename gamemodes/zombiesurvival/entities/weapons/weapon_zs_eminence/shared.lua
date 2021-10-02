SWEP.PrintName = "'Eminence' Particle Cannon"
SWEP.Description = "Projectiles fire particle tracers whilst moving."

SWEP.Base = "weapon_zs_baseproj"

SWEP.HoldType = "smg"

SWEP.ViewModel = "models/weapons/c_crossbow.mdl"
SWEP.WorldModel = "models/weapons/w_crossbow.mdl"
SWEP.UseHands = true

SWEP.CSMuzzleFlashes = false

SWEP.Primary.ClipSize = 1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "impactmine"
SWEP.Primary.Delay = 0.67
SWEP.Primary.DefaultClip = 4
SWEP.Primary.Damage = 30
SWEP.Primary.NumShots = 1

SWEP.ConeMax = 2.4
SWEP.ConeMin = 1.4

SWEP.WalkSpeed = SPEED_SLOW

SWEP.Tier = 5

SWEP.ReloadSpeed = 0.78

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_RELOAD_SPEED, 0.075)
local branch = GAMEMODE:AddNewRemantleBranch(SWEP, 1, "'Eminence' Relampago Cannon", "Projectiles shock zombies near it.", function(wept)
wept.Primary.ProjVelocity = 80
wept.Primary.Damage = wept.Primary.Damage * 0.9
wept.Primary.Delay = 0.8

	if SERVER then
		wept.EntModify = function(self, ent)
			ent:SetDTInt(5, 1)
		end
	end
end)

function SWEP:EmitFireSound()
	self:EmitSound("weapons/grenade_launcher1.wav", 75, math.random(67, 74), 0.4)
	self:EmitSound("npc/attack_helicopter/aheli_mine_drop1.wav", 75, 65, 0.8, CHAN_AUTO + 20)
end

function SWEP:EmitReloadSound()
	if IsFirstTimePredicted() then
		self:EmitSound("weapons/ar2/ar2_reload_rotate.wav", 70, 55)
		self:EmitSound("items/battery_pickup.wav", 70, 77, 0.85, CHAN_AUTO)
	end
end

function SWEP:EmitReloadFinishSound()
	if IsFirstTimePredicted() then
		self:EmitSound("weapons/ar2/ar2_reload_push.wav", pos, 70, math.Rand(130, 140))
	end
end
