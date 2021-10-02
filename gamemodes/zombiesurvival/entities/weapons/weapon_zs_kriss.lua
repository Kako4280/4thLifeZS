AddCSLuaFile()
DEFINE_BASECLASS("weapon_zs_base")

SWEP.PrintName = "'Kriss' Vector SMG"
SWEP.Description = "An all round SMG thats spread is not affected by movement or if you're in the air."

SWEP.Slot = 2
SWEP.SlotPos = 0

SWEP.WElements = {
	["Weapon"] = { type = "Model", model = "models/weapons/c_krissv.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2, 4, -8), angle = Angle(-5, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

if CLIENT then
	SWEP.HUD3DBone = "stock"
	SWEP.HUD3DPos = Vector(-1.7, -5.5, 0)
	SWEP.HUD3DScale = 0.0135
	SWEP.HUD3DAng = Angle(0, 0, 90)

	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 70

	-- To fix weapon position when ironsighting
	local ghostlerp = 0
	function SWEP:CalcViewModelView(vm, oldpos, oldang, pos, ang)
		local bIron = self:GetIronsights() and not GAMEMODE.NoIronsights

		if bIron ~= self.bLastIron then
			self.bLastIron = bIron
			self.fIronTime = CurTime()

			if bIron then
				self.SwayScale = 0.3
				self.BobScale = 0.1
			else
				self.SwayScale = 2.0
				self.BobScale = 1.5
			end
		end

		local Mul = math.Clamp((CurTime() - (self.fIronTime or 0)) * 4, 0, 1)
		if not bIron then Mul = 1 - Mul end

		if Mul > 0 then
			local Offset = self.IronSightsPos
			if self.IronSightsAng then
				ang = Angle(ang.p, ang.y, ang.r)
				ang:RotateAroundAxis(ang:Right(), self.IronSightsAng.x * Mul)
				ang:RotateAroundAxis(ang:Up(), self.IronSightsAng.y * Mul)
				ang:RotateAroundAxis(ang:Forward(), self.IronSightsAng.z * Mul)
			end

			pos = pos - ( ( Offset.x * Mul * ang:Right() ) * -0.555) + ( Offset.y * Mul * ang:Forward() ) + ( Offset.z * Mul * ang:Up() )
		end

		if self:GetOwner():GetBarricadeGhosting() then
			ghostlerp = math.min(1, ghostlerp + FrameTime() * 4)
		elseif ghostlerp > 0 then
			ghostlerp = math.max(0, ghostlerp - FrameTime() * 5)
		end

		if ghostlerp > 0 then
			pos = pos + 3.5 * ghostlerp * ang:Up()
			ang:RotateAroundAxis(ang:Right(), -30 * ghostlerp)
		end

		return pos, ang
	end

end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "smg"
SWEP.IronSightsHoldType = "smg"

SWEP.ViewModel = "models/weapons/c_krissv.mdl"
SWEP.WorldModel = "models/weapons/w_krissv.mdl"
SWEP.ShowWorldModel = false

SWEP.UseHands = true

SWEP.CSMuzzleFlashes = true

SWEP.ReloadSound = "weapons/krissv/mp5k_magout.wav"
SWEP.Primary.Sound = Sound("Weapon_AR2.NPC_Single")
SWEP.Primary.Damage = 16
SWEP.Primary.NumShots = 2
SWEP.Primary.Delay = 0.072

SWEP.Primary.ClipSize = 32
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "smg1"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.Primary.Gesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1
SWEP.ReloadGesture = ACT_VM_RELOAD

SWEP.ReloadSpeed = 1
SWEP.FireAnimSpeed = 1

SWEP.ConeMax = 2
SWEP.ConeMin = 2

SWEP.HeadshotMulti = 1.6

SWEP.Tier = 5

SWEP.IronSightsPos = Vector(-6.425, 5, 1.02)

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.015)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, "Blazing Garbage", "Hot garbage that's such hot garbage it sets zombies on fire", function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 0.8
	wept.Burn = true
end)

-- Cone Max and cone Min being the same is not enough. I had to remove the variables that affect the cone by movement
function SWEP:GetCone()
	local owner = self:GetOwner()

	local basecone = self.ConeMin
	local conedelta = self.ConeMax - basecone

	local orphic = not owner.Orphic and 1 or self:GetIronsights() and 0.9 or 1.1
	local tiervalid = (self.Tier or 1) <= 3
	local spreadmul = (owner.AimSpreadMul or 1) - ((tiervalid and owner:HasTrinket("refinedsub")) and 0.27 or 0)

	if owner.TrueWooism then
		return (basecone + conedelta * 0.5 ^ self.ConeRamp) * spreadmul * orphic
	end

	return (basecone + conedelta * (self.FixedAccuracy and 0.6 or 0.6) ^ self.ConeRamp) * spreadmul * orphic
end

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end
	local ironsights = self:GetIronsights()

	self:SetNextPrimaryFire(CurTime() + self:GetFireDelay())

	self:EmitSound("weapons/krissv/fire_1.wav", 75, 70, 0.65)
	
	if math.random(1,10) > 1 then
		self:TakeAmmo(true)
	end
	
	self:ShootBullets(self.Primary.Damage, self.Primary.NumShots, self:GetCone())
	self.IdleAnimation = CurTime() + self:SequenceDuration()
end

function SWEP:BulletCallback(attacker, tr, dmginfo)
	local owner = self:GetOwner()
	local ent = tr.Entity
	if SERVER and math.random(1,8) == 1 then
			if self.Burn and hitent:IsValidLivingZombie() and not hitent:IsOnFire() then
				hitent:Ignite(6)
				for __, fire in pairs(ents.FindByClass("entityflame")) do
					if fire:IsValid() and fire:GetParent() == hitent then
						fire:SetOwner(owner)
						fire:SetPhysicsAttacker(owner)
						fire.AttackerForward = owner
					end
				end
			end
	end
end