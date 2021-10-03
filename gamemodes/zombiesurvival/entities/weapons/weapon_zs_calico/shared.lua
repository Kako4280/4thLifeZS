SWEP.PrintName = "'M960' Calico SMG"
SWEP.Description = "This SMG has a special ability, right click activates an ability to buff yourself for 10 seconds."

SWEP.Slot = 2
SWEP.SlotPos = 0

if CLIENT then
	SWEP.HUD3DBone = "ValveBiped.base"
	SWEP.HUD3DPos = Vector(1.5, -0.4, 0.7)
	SWEP.HUD3DAng = Angle(180, 0, 0)
	SWEP.HUD3DScale = 0.015
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "smg"

SWEP.ViewModel = "models/weapons/c_smg1.mdl"
SWEP.WorldModel = "models/weapons/w_smg1.mdl"
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false
SWEP.UseHands = true

SWEP.ReloadSound = Sound("Weapon_SMG1.Reload")
SWEP.Primary.Sound = Sound("Weapon_MP5Navy.Single")
SWEP.Primary.Damage = 18
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.09

SWEP.Primary.ClipSize = 50
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "smg1"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.ReloadSpeed = 0.68
SWEP.FireAnimSpeed = 3

SWEP.Primary.Gesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1
SWEP.ReloadGesture = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.ConeMax = 3
SWEP.ConeMin = 1.5

SWEP.WalkSpeed = SPEED_NORMAL

SWEP.Tier = 5

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MAX_SPREAD, -0.2, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MIN_SPREAD, -0.1, 1)

function SWEP:Initialize()
	self.BaseClass.Initialize(self)
    self.Special = CurTime()
    self.SpecialCD = 30

	self.Special = CurTime() + self.SpecialCD
end

function SWEP:EmitFireSound()
	self:EmitSound(self.Primary.Sound)
	self:EmitSound("weapons/zs_scar/scar_fire1.ogg", 70, 140, 1, CHAN_WEAPON)
end

function SWEP:SecondaryAttack()
	if self:GetNextSecondaryFire() <= CurTime() and not self:GetOwner():IsHolding() and self:GetReloadFinish() == 0 then
		self:SetIronsights(false)
	end

	local owner = self:GetOwner()

	if self.Special - CurTime() <= 0 then
        owner:GiveStatus("strengthdartboost", 10)
        owner:GiveStatus("rapidfire", 10)
        self.Special = CurTime() + self.SpecialCD
    end
end