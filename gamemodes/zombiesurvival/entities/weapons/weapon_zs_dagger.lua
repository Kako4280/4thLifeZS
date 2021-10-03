AddCSLuaFile()

SWEP.PrintName = "'Archaic' Dagger"
SWEP.Description = "A small bladed weapon that deals Increased damage to the back and inflicts bleeding, causing damage over time."

if CLIENT then
    SWEP.ViewModelFOV = 65
    SWEP.ViewModelFlip = false
	SWEP.ViewModelBoneMods = {}
    SWEP.VElements = {
	    ["antique_blade"] = { type = "Model", model = "models/props_phx/misc/flakshell_big.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "antique_grip", pos = Vector(0, 0, 0), angle = Angle(180, 90, 0), size = Vector(0.012, 0.075, 0.275), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 1, bodygroup = {} },
	    ["antique_grip"] = { type = "Model", model = "models/props_phx/games/chess/black_dama.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.1, 1.25, -2.75), angle = Angle(0, -25, 0), size = Vector(0.075, 0.05, 1.5), color = Color(40, 40, 40, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
	    ["antique_hilt"] = { type = "Model", model = "models/gibs/metal_gib1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "antique_grip", pos = Vector(0, 0, 0), angle = Angle(0, -90, 60), size = Vector(0.5, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	    ["antique_hilt_center"] = { type = "Model", model = "models/mechanics/wheels/wheel_speed_72.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "antique_grip", pos = Vector(0, 0, -0.075), angle = Angle(1, 0, 0), size = Vector(0.035, 0.012, 0.04), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	    ["antique_pommel"] = { type = "Model", model = "models/props_phx/wheels/drugster_front.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "antique_grip", pos = Vector(0, -0.47, 6.65), angle = Angle(0, 0, 90), size = Vector(0.05, 0.05, 0.055), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} }
    }

    SWEP.WElements = {
	    ["antique_blade"] = { type = "Model", model = "models/props_phx/misc/flakshell_big.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "antique_grip", pos = Vector(0, 0, 0), angle = Angle(180, 90, 0), size = Vector(0.012, 0.075, 0.275), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 1, bodygroup = {} },
	    ["antique_grip"] = { type = "Model", model = "models/props_phx/games/chess/black_dama.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.1, 1.25, -2.75), angle = Angle(10, -25, 0), size = Vector(0.075, 0.05, 1.5), color = Color(40, 40, 40, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
	    ["antique_hilt"] = { type = "Model", model = "models/gibs/metal_gib1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "antique_grip", pos = Vector(0, 0, 0), angle = Angle(0, -90, 60), size = Vector(0.5, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	    ["antique_hilt_center"] = { type = "Model", model = "models/mechanics/wheels/wheel_speed_72.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "antique_grip", pos = Vector(0, 0, -0.075), angle = Angle(1, 0, 0), size = Vector(0.035, 0.012, 0.04), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	    ["antique_pommel"] = { type = "Model", model = "models/props_phx/wheels/drugster_front.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "antique_grip", pos = Vector(0, -0.47, 6.65), angle = Angle(0, 0, 90), size = Vector(0.05, 0.05, 0.055), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} }
    }
end

SWEP.Base = "weapon_zs_basemelee"

SWEP.HoldType = "knife"

SWEP.ViewModel = "models/weapons/cstrike/c_knife_t.mdl"
SWEP.WorldModel = "models/weapons/w_knife_t.mdl"
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false
SWEP.UseHands = true

SWEP.MeleeDamage = 37
SWEP.MeleeRange = 59
SWEP.MeleeSize = 0.875

SWEP.Tier = 3

SWEP.Bleed = true 
SWEP.BleedDamage = 4


SWEP.WalkSpeed = SPEED_FASTEST

SWEP.Primary.Delay = 0.85

SWEP.HitDecal = "Manhackcut"

SWEP.HitGesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE
SWEP.MissGesture = SWEP.HitGesture

SWEP.HitAnim = ACT_VM_MISSCENTER
SWEP.MissAnim = ACT_VM_PRIMARYATTACK

SWEP.NoHitSoundFlesh = true

SWEP.AllowQualityWeapons = true

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.085)

function SWEP:PlaySwingSound()
	self:EmitSound("weapons/knife/knife_slash"..math.random(2)..".wav")
end

function SWEP:PlayHitSound()
	self:EmitSound("weapons/knife/knife_hitwall1.wav")
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("weapons/knife/knife_hit"..math.random(4)..".wav")
end

function SWEP:OnMeleeHit(hitent, hitflesh, tr)
	if hitent:IsValid() and hitent:IsPlayer() and not self.m_BackStabbing and math.abs(hitent:GetForward():Angle().yaw - self:GetOwner():GetForward():Angle().yaw) <= 90 then
		self.m_BackStabbing = true
		self.MeleeDamage = self.MeleeDamage * 2.5
	end
end

function SWEP:PostOnMeleeHit(hitent, hitflesh, tr)
	if self.m_BackStabbing then
		self.m_BackStabbing = false

		self.MeleeDamage = self.MeleeDamage / 2.5
	end
end

if SERVER then
	function SWEP:InitializeHoldType()
		self.ActivityTranslate = {}
		self.ActivityTranslate[ACT_HL2MP_IDLE] = ACT_HL2MP_IDLE_KNIFE
		self.ActivityTranslate[ACT_HL2MP_WALK] = ACT_HL2MP_WALK_KNIFE
		self.ActivityTranslate[ACT_HL2MP_RUN] = ACT_HL2MP_RUN_KNIFE
		self.ActivityTranslate[ACT_HL2MP_IDLE_CROUCH] = ACT_HL2MP_IDLE_CROUCH_PHYSGUN
		self.ActivityTranslate[ACT_HL2MP_WALK_CROUCH] = ACT_HL2MP_WALK_CROUCH_KNIFE
		self.ActivityTranslate[ACT_HL2MP_GESTURE_RANGE_ATTACK] = ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE
		self.ActivityTranslate[ACT_HL2MP_GESTURE_RELOAD] = ACT_HL2MP_GESTURE_RELOAD_KNIFE
		self.ActivityTranslate[ACT_HL2MP_JUMP] = ACT_HL2MP_JUMP_KNIFE
		self.ActivityTranslate[ACT_RANGE_ATTACK1] = ACT_RANGE_ATTACK_KNIFE
	end
end
