-- a bunch of random values so the console stops erroring.
-- the numbers can be worked out later.
SWEP.PrintName = "FloodMod gun Base"
SWEP.Description = "e"
SWEP.Cost = 1

SWEP.Primary.Damage = 4
SWEP.Primary.Delay = 1
SWEP.Primary.ConeMin = 1.5
SWEP.Primary.ConeMax = 3.5
SWEP.Primary.Recoil = 0
SWEP.Primary.AmmoUsed = ""
SWEP.Primary.ClipSize = 10
SWEP.Primary.AmmoAmount = 999
SWEP.Primary.Pierce = 1
SWEP.Primary.NumShot = 1

SWEP.Secondary.Damage = 4
SWEP.Secondary.Delay = 1
SWEP.Secondary.ConeMin = 1.5
SWEP.Secondary.ConeMax = 3.5
SWEP.Secondary.Recoil = 0
SWEP.Secondary.AmmoUsed = ""
SWEP.Secondary.ClipSize = 10
SWEP.Secondary.AmmoAmount = 999
SWEP.Secondary.Pierce = 1
SWEP.Secondary.NumShot = 1

SWEP.HoldType = "pistol"
SWEP.Primary.FireSound = "Weapon_AR2.Single"

SWEP.Primary.Fire = false
SWEP.Secondary.Fire = false

SWEP.Primary.Electric = false
SWEP.Secondary.Electric = false

SWEP.Primary.Ice = false
SWEP.Secondary.Ice = false

SWEP.Primary.Acid = false
SWEP.Secondary.Acid = false

SWEP.Primary.Curse = false
SWEP.Secondary.Curse = false

SWEP.Primary.Pierce = false
SWEP.Secondary.Pierce = false

SWEP.ElementColorFire = Color(245, 25, 0, 255)
SWEP.ElementColorElectric = Color(200, 225, 0, 255)
SWEP.ElementColorIce = Color(0, 220, 255, 255)
SWEP.ElementColorAcid = Color(0, 200, 100, 255)
SWEP.ElementColorCurse = Color(30, 0, 175, 255)

function SWEP:Initialize()
	self:SetWeaponHoldType(self.HoldType)

	if CLIENT then
		self:Anim_Initialize()
	end
end

function SWEP:PrimaryAttack()
	if ( !self:CanPrimaryAttack() ) then return end
	self.Weapon:EmitSound(self.Primary.FireSound)
	self:ShootBullets()
	self:TakePrimaryAmmo( 1 )
	self.Owner:ViewPunch( Angle( -1, 0, 0 ) )
end

function SWEP:SecondaryAttack()
end

function SWEP:Reload()
end

function SWEP:ShootBullets() -- lag compensation + other shit later on, reminder that the 3rd value in firebulletslua is for the cone
	local owner = self:GetOwner()
	
	owner:LagCompensation(true)
	owner:FireBulletsLua(owner:GetShootPos(), owner:GetAimVector(), 1.5, self.Primary.NumShots, self.Primary.Damage, nil, self.Primary.KnockbackScale, self.TracerName, self.BulletCallback, self.Primary.HullSize, nil, self.Primary.MaxDistance, nil, self)
	owner:LagCompensation(false)
end

--Firemode will usually be primary, but this is needed to know if it was a secondary for weapons that fire different elements.
function SWEP.BulletCallback(attacker, tr, dmginfo, inf, firemode)

	if SERVER then

		print(inf)

		local hitent = tr.Entity
		--if firemode == "Primary" then
			if inf.Primary.Fire then
				inf:ApplyFire()
			end
			
			if inf.Primary.Electric then
				inf:ApplyElectric()
			end

			if inf.Primary.Ice then
				inf:ApplyIce(hitent)
			end
			
			if inf.Primary.Acid then
				inf:ApplyAcid()
			end
			
			if inf.Primary.Curse then
				inf:ApplyCurse()
			end
			
			if inf.Primary.Pierce then
				inf:ApplyPierce()
			end

		if firemode == "Secondary" then
			if inf.Seconday.Fire then
				inf:ApplyFire()
			end
			
			if inf.Seconday.Electric then
				inf:ApplyElectric()
			end

			if inf.Seconday.Ice then
				inf:ApplyIce()
			end
			
			if inf.Seconday.Acid then
				inf:ApplyAcid()
			end
			
			if inf.Seconday.Curse then
				inf:ApplyCurse()
			end
			
			if inf.Secondary.Pierce then
				inf:ApplyPierce()
			end
		end
	end
end

local ActIndex = {
	[ "pistol" ] 		= ACT_HL2MP_IDLE_PISTOL,
	[ "smg" ] 			= ACT_HL2MP_IDLE_SMG1,
	[ "grenade" ] 		= ACT_HL2MP_IDLE_GRENADE,
	[ "ar2" ] 			= ACT_HL2MP_IDLE_AR2,
	[ "shotgun" ] 		= ACT_HL2MP_IDLE_SHOTGUN,
	[ "rpg" ]	 		= ACT_HL2MP_IDLE_RPG,
	[ "physgun" ] 		= ACT_HL2MP_IDLE_PHYSGUN,
	[ "crossbow" ] 		= ACT_HL2MP_IDLE_CROSSBOW,
	[ "melee" ] 		= ACT_HL2MP_IDLE_MELEE,
	[ "slam" ] 			= ACT_HL2MP_IDLE_SLAM,
	[ "normal" ]		= ACT_HL2MP_IDLE,
	[ "fist" ]			= ACT_HL2MP_IDLE_FIST,
	[ "melee2" ]		= ACT_HL2MP_IDLE_MELEE2,
	[ "passive" ]		= ACT_HL2MP_IDLE_PASSIVE,
	[ "knife" ]			= ACT_HL2MP_IDLE_KNIFE,
	[ "duel" ]      	= ACT_HL2MP_IDLE_DUEL,
	[ "revolver" ]		= ACT_HL2MP_IDLE_REVOLVER,
	[ "camera" ]		= ACT_HL2MP_IDLE_CAMERA
}

-- copied from zs base
function SWEP:SetWeaponHoldType( t )

	t = string.lower( t )
	local index = ActIndex[ t ]

	if ( index == nil ) then
		Msg( "SWEP:SetWeaponHoldType - ActIndex[ \""..t.."\" ] isn't set! (defaulting to normal) (from "..self:GetClass()..")\n" )
		t = "normal"
		index = ActIndex[ t ]
	end

	self.ActivityTranslate = {}
	self.ActivityTranslate [ ACT_MP_STAND_IDLE ] 				= index
	self.ActivityTranslate [ ACT_MP_WALK ] 						= index+1
	self.ActivityTranslate [ ACT_MP_RUN ] 						= index+2
	self.ActivityTranslate [ ACT_MP_CROUCH_IDLE ] 				= index+3
	self.ActivityTranslate [ ACT_MP_CROUCHWALK ] 				= index+4
	self.ActivityTranslate [ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	= index+5
	self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ] = index+5
	self.ActivityTranslate [ ACT_MP_RELOAD_STAND ]		 		= index+6
	self.ActivityTranslate [ ACT_MP_RELOAD_CROUCH ]		 		= index+6
	self.ActivityTranslate [ ACT_MP_JUMP ] 						= index+7
	self.ActivityTranslate [ ACT_RANGE_ATTACK1 ] 				= index+8
	self.ActivityTranslate [ ACT_MP_SWIM_IDLE ] 				= index+8
	self.ActivityTranslate [ ACT_MP_SWIM ] 						= index+9

	-- "normal" jump animation doesn't exist
	if t == "normal" then
		self.ActivityTranslate [ ACT_MP_JUMP ] = ACT_HL2MP_JUMP_SLAM
	end

	-- these two aren't defined in ACTs for whatever reason
	if t == "knife" or t == "melee2" then
		self.ActivityTranslate [ ACT_MP_CROUCH_IDLE ] = nil
	end
end