SWEP.Name
SWEP.Description
SWEP.Cost

SWEP.Primary.Damage
SWEP.Primary.Delay
SWEP.Primary.Cone
SWEP.Primary.Recoil
SWEP.Primary.AmmoUsed
SWEP.Primary.ClipSize
SWEP.Primary.AmmoAmount
SWEP.Primary.Pierce
SWEP.Primary.NumShot

SWEP.Secondary.Damage
SWEP.Secondary.Delay
SWEP.Secondary.Cone
SWEP.Secondary.Recoil
SWEP.Secondary.AmmoUsed
SWEP.Secondary.ClipSize
SWEP.Secondary.AmmoAmount
SWEP.Secondary.Pierce
SWEP.Secondary.NumShot
SWEP.Secondary.IsIronSight

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

SWEP.ElementColor.Fire = 		Color(245, 25, 0, 255)
SWEP.ElementColor.Electric = 	Color(200, 225, 0, 255)
SWEP.ElementColor.Ice = 		Color(0, 220, 255, 255)
SWEP.ElementColor.Acid = 		Color(0, 200, 100, 255)
SWEP.ElementColor.Curse = 		Color(30, 0, 175, 255)

function SWEP:Initialize()

end

function SWEP:PrimaryAttack()
	if ( !self:CanPrimaryAttack() ) then return end
	self.Weapon:EmitSound("Weapon_AR2.Single")
	self:ShootBullet( 150, 1, 0.01 )
	self:TakePrimaryAmmo( 1 )
	self.Owner:ViewPunch( Angle( -1, 0, 0 ) )
end

function SWEP:SecondaryAttack()

end

function SWEP:Reload()

end

--Firemode will usually be primary, but this is needed to know if it was a secondary for weapons that fire different elements.
function SWEP.BulletCallback(attacker, tr, dmginfo, inf, firemode)

	if SERVER then
		if firemode == "Primary" then
			if inf.Primary.Fire then
				inf:ApplyFire()
			end
			
			if inf.Primary.Electric then
				inf:ApplyElectric()
			end

			if inf.Primary.Ice then
				inf:ApplyIce()
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
		elseif firemode == "Secondary" then
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