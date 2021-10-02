SWEP.Base = "weapon_zs_zombie"

SWEP.PrintName = "Wraith"

SWEP.MeleeDelay = 0.8
SWEP.MeleeReach = 40
SWEP.MeleeSize = 4.5
SWEP.MeleeDamage = 43
SWEP.MeleeDamageType = DMG_SLASH
SWEP.MeleeAnimationDelay = 0.25

SWEP.AlertDelay = 6

SWEP.Primary.Delay = 1.8

SWEP.ViewModel = Model("models/weapons/zombie_arms/z_poison.mdl")
SWEP.WorldModel = ""

SWEP.Secondary.Automatic = false

SWEP.ShadeControl = "env_wraithcontrol"
SWEP.ShadeProjectile = "projectile_wraith"

SWEP.ProjectileDamageMin = 18
SWEP.ProjectileDamageMax = 25


function SWEP:StopMoaningSound()
end

function SWEP:StartMoaningSound()
	self:GetOwner():EmitSound("zombiesurvival/wraithdeath"..math.random(4)..".ogg")
end

function SWEP:PlayHitSound()
	self:EmitSound("ambient/machines/slicer"..math.random(4)..".wav", 75, 80, nil, CHAN_AUTO)
end

function SWEP:PlayMissSound()
	self:EmitSound("npc/zombie/claw_miss"..math.random(2)..".wav", 75, 80, nil, CHAN_AUTO)
end

function SWEP:PlayAttackSound()
	self:EmitSound("npc/antlion/distract1.wav")
end


local function viewpunch(ent, power)
	if ent:IsValid() and ent:Alive() then
		ent:ViewPunch(Angle(math.Rand(0.75, 1) * (math.random(0, 1) == 0 and 1 or -1), math.Rand(0.75, 1) * (math.random(0, 1) == 0 and 1 or -1), math.Rand(0.75, 1) * (math.random(0, 1) == 0 and 1 or -1)) * power)
	end
end

function SWEP:DoAlert()
end

util.PrecacheSound("npc/antlion/distract1.wav")
util.PrecacheSound("ambient/machines/slicer1.wav")
util.PrecacheSound("ambient/machines/slicer2.wav")
util.PrecacheSound("ambient/machines/slicer3.wav")
util.PrecacheSound("ambient/machines/slicer4.wav")
util.PrecacheSound("npc/zombie/claw_miss1.wav")
util.PrecacheSound("npc/zombie/claw_miss2.wav")
