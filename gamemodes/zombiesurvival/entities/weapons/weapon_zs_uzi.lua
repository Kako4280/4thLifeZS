AddCSLuaFile()

SWEP.PrintName = "'Sprayer' Uzi 9mm"
SWEP.Description = "Quite inaccurate, but has good, cheap and reliable firepower potential."

SWEP.Slot = 2
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 50

	SWEP.HUD3DBone = "v_weapon.mac10_bolt"
	SWEP.HUD3DPos = Vector(-1.45, 1.25, 0)
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DScale = 0.015
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "pistol"

SWEP.ViewModel = "models/weapons/cstrike/c_smg_mac10.mdl"
SWEP.WorldModel = "models/weapons/w_smg_mac10.mdl"
SWEP.UseHands = true

SWEP.Primary.Sound = Sound("Weapon_MAC10.Single")
SWEP.Primary.Damage = 15
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.075

SWEP.Primary.ClipSize = 40
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "smg1"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.Primary.Gesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1
SWEP.ReloadGesture = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.ConeMax = 5.5
SWEP.ConeMin = 2.5

SWEP.FireAnimSpeed = 1.5

SWEP.WalkSpeed = SPEED_NORMAL

SWEP.Tier = 2

SWEP.IronSightsPos = Vector(-7, 15, 0)
SWEP.IronSightsAng = Vector(3, -3, -10)

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MAX_SPREAD, -0.58, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MIN_SPREAD, -0.27, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_CLIP_SIZE, 3, 1)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, "'Disperser' Uzi", "Decreases the clip size but increases the fire rate, and the last few shots bounce", function(wept)
	wept.Primary.ClipSize = math.floor(wept.Primary.ClipSize * 0.53)
	wept.Primary.Delay = 0.06

	local function DoRicochet(attacker, hitpos, hitnormal, normal, damage)
		attacker.RicochetBullet = true
		if attacker:IsValid() then
			attacker:FireBulletsLua(hitpos, 2 * hitnormal * hitnormal:Dot(normal * -1) + normal, 0, 1, damage, nil, nil, "tracer_rico", nil, nil, nil, nil, nil, attacker:GetActiveWeapon())
		end
		attacker.RicochetBullet = nil
	end
	wept.BulletCallback = function(attacker, tr, dmginfo)
		if SERVER and tr.HitWorld and not tr.HitSky and attacker:GetActiveWeapon():Clip1() < 8 then
			local hitpos, hitnormal, normal, dmg = tr.HitPos, tr.HitNormal, tr.Normal, dmginfo:GetDamage() * 1.5
			timer.Simple(0, function() DoRicochet(attacker, hitpos, hitnormal, normal, dmg) end)
		end
	end
end)

local branch = GAMEMODE:AddNewRemantleBranch(SWEP, 2, "'Blight' Chemical SMG", "Changes the ammo type to chemical, bullets have a chance to remove damage resistance", function(wept)
    wept.Primary.Damage = wept.Primary.Damage * 1.4
	wept.Primary.ClipSize = math.floor(wept.Primary.ClipSize * 0.6)
	wept.Primary.Delay = 0.09
	
	wept.Corrosion = true
	wept.CorrosionDuration = 6
	wept.CorrosionChance = 0.17
	wept.Primary.Ammo = "chemical"
	wept.Acid = true
	wept.AcidChance = 0.34
	wept.AcidDamage = 3

wept.ShowViewModel = false
wept.ShowWorldModel = false

if CLIENT then
	wept.HUD3DBone = "v_weapon.mac10_parent"
	wept.HUD3DPos = Vector(-2, -4.2, 0.7)
	wept.HUD3DAng = Angle(0, 0, 0)
	wept.HUD3DScale = 0.015

	wept.ViewModelBoneMods = {}

	wept.VElements = {
	["blight_base"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "blight_grip", pos = Vector(-5, 3, 0.6), angle = Angle(0, 90, 90), size = Vector(0.025, 0.025, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
	["blight_base_detail1"] = { type = "Model", model = "models/props_wasteland/laundry_basket001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "blight_grip", pos = Vector(-4, 3, 0.6), angle = Angle(45, -90, -90), size = Vector(0.045, 0.045, 0.045), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
	["blight_base_detail10"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "blight_grip", pos = Vector(6.5, 3, 0.6), angle = Angle(90, 0, 0), size = Vector(0.007, 0.007, 0.02), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
	["blight_base_detail11"] = { type = "Model", model = "models/props_c17/trappropeller_lever.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "blight_grip", pos = Vector(0.75, 1.5, 0.6), angle = Angle(0, 0, 0), size = Vector(0.4, 0.2, 0.4), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["blight_base_detail2"] = { type = "Model", model = "models/hunter/misc/roundthing4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "blight_grip", pos = Vector(1, 3.75, 0.75), angle = Angle(90, 90, 0), size = Vector(0.01, 0.013, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/GutterMetal01a", skin = 0, bodygroup = {} },
	["blight_base_detail3"] = { type = "Model", model = "models/hunter/misc/roundthing4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "blight_grip", pos = Vector(-5.1, 3.4, -0.25), angle = Angle(-25, 90, 90), size = Vector(0.01, 0.01, 0.003), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/GutterMetal01a", skin = 0, bodygroup = {} },
	["blight_base_detail4"] = { type = "Model", model = "models/hunter/geometric/hex1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "blight_grip", pos = Vector(-5.1, 3, 0.6), angle = Angle(90, 0, 0), size = Vector(0.005, 0.005, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/GutterMetal01a", skin = 0, bodygroup = {} },
	["blight_base_detail5"] = { type = "Model", model = "models/props_wasteland/horizontalcoolingtank04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "blight_grip", pos = Vector(-2.5, 3, 2.2), angle = Angle(0, 180, 0), size = Vector(0.01, 0.01, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["blight_base_detail6"] = { type = "Model", model = "models/props_pipes/pipecluster16d_001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "blight_grip", pos = Vector(-1.5, 2.1, 1.85), angle = Angle(0, 90, 0), size = Vector(0.02, 0.02, 0.02), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
	["blight_base_detail7"] = { type = "Model", model = "models/props_c17/consolebox03a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "blight_grip", pos = Vector(-0.9, 1.9, -0.125), angle = Angle(0, 90, 0), size = Vector(0.025, 0.1, 0.175), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_c17/substation_transformer01a", skin = 0, bodygroup = {} },
	["blight_base_detail8"] = { type = "Model", model = "models/props_wasteland/coolingtank02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "blight_grip", pos = Vector(-3.75, 1.25, 0.6), angle = Angle(0, 0, -90), size = Vector(0.01, 0.01, 0.003), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/indenttiles_1-2", skin = 0, bodygroup = {} },
	["blight_base_detail9"] = { type = "Model", model = "models/props_wasteland/laundry_washer001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "blight_grip", pos = Vector(3.6, 3.125, 0.67), angle = Angle(110, -90, -90), size = Vector(0.029, 0.029, 0.03), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
	["blight_bolt"] = { type = "Model", model = "models/props_c17/pottery04a.mdl", bone = "v_weapon.mac10_bolt", rel = "", pos = Vector(-0.1, 0.65, 0.1), angle = Angle(0, 0, -90), size = Vector(0.05, 0.05, 0.075), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
	["blight_grip"] = { type = "Model", model = "models/hunter/blocks/cube025x05x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.7, 0.5, -0.5), angle = Angle(5, 2, 92), size = Vector(0.15, 0.225, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_c17/substation_transformer01a", skin = 0, bodygroup = {} },
	["blight_magazine"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "v_weapon.mac10_clip", rel = "", pos = Vector(0, 3, -0.625), angle = Angle(0, 90, 0), size = Vector(0.2, 0.1, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_c17/substation_transformer01a", skin = 0, bodygroup = {} }
}

wept.WElements = {
	["blight_base"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "blight_grip", pos = Vector(-5, 3, 0.6), angle = Angle(0, 90, 90), size = Vector(0.025, 0.025, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
	["blight_base_detail1"] = { type = "Model", model = "models/props_wasteland/laundry_basket001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "blight_grip", pos = Vector(-4, 3, 0.6), angle = Angle(45, -90, -90), size = Vector(0.045, 0.045, 0.045), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
	["blight_base_detail10"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "blight_grip", pos = Vector(6.5, 3, 0.6), angle = Angle(90, 0, 0), size = Vector(0.007, 0.007, 0.02), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
	["blight_base_detail11"] = { type = "Model", model = "models/props_c17/trappropeller_lever.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "blight_grip", pos = Vector(1.25, 1.5, 0.6), angle = Angle(0, 0, 0), size = Vector(0.4, 0.2, 0.4), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["blight_base_detail2"] = { type = "Model", model = "models/hunter/misc/roundthing4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "blight_grip", pos = Vector(1, 3.75, 0.6), angle = Angle(90, 90, 0), size = Vector(0.01, 0.013, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/GutterMetal01a", skin = 0, bodygroup = {} },
	["blight_base_detail3"] = { type = "Model", model = "models/hunter/misc/roundthing4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "blight_grip", pos = Vector(-5.1, 3.4, -0.25), angle = Angle(-25, 90, 90), size = Vector(0.01, 0.01, 0.003), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/GutterMetal01a", skin = 0, bodygroup = {} },
	["blight_base_detail4"] = { type = "Model", model = "models/hunter/geometric/hex1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "blight_grip", pos = Vector(-5.1, 3, 0.6), angle = Angle(90, 0, 0), size = Vector(0.005, 0.005, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/GutterMetal01a", skin = 0, bodygroup = {} },
	["blight_base_detail5"] = { type = "Model", model = "models/props_wasteland/horizontalcoolingtank04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "blight_grip", pos = Vector(-2.5, 3, 2.2), angle = Angle(0, 180, 0), size = Vector(0.01, 0.01, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["blight_base_detail6"] = { type = "Model", model = "models/props_pipes/pipecluster16d_001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "blight_grip", pos = Vector(-1.5, 2.1, 1.85), angle = Angle(0, 90, 0), size = Vector(0.02, 0.02, 0.02), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
	["blight_base_detail7"] = { type = "Model", model = "models/props_c17/consolebox03a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "blight_grip", pos = Vector(-0.9, 1.9, -0.125), angle = Angle(0, 90, 0), size = Vector(0.025, 0.1, 0.175), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_c17/substation_transformer01a", skin = 0, bodygroup = {} },
	["blight_base_detail8"] = { type = "Model", model = "models/props_wasteland/coolingtank02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "blight_grip", pos = Vector(-3.75, 1.25, 0.6), angle = Angle(0, 0, -90), size = Vector(0.01, 0.01, 0.003), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/indenttiles_1-2", skin = 0, bodygroup = {} },
	["blight_base_detail9"] = { type = "Model", model = "models/props_wasteland/laundry_washer001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "blight_grip", pos = Vector(3.6, 3.125, 0.67), angle = Angle(110, -90, -90), size = Vector(0.029, 0.029, 0.03), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
	["blight_bolt"] = { type = "Model", model = "models/props_c17/pottery04a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 1.2, -3.8), angle = Angle(0, 0, -175), size = Vector(0.05, 0.05, 0.075), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
	["blight_grip"] = { type = "Model", model = "models/hunter/blocks/cube025x05x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.2, 0.7, -0.5), angle = Angle(0, -5, 92), size = Vector(0.15, 0.225, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_c17/substation_transformer01a", skin = 0, bodygroup = {} },
	["blight_magazine"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.5, 1.3, 4), angle = Angle(92, 85, 90), size = Vector(0.2, 0.1, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_c17/substation_transformer01a", skin = 0, bodygroup = {} }
}
end
end)
branch.Colors = {Color(0, 255, 100), Color(0, 175, 100), Color(0, 100, 100)} -- placeholder colors / name, not sure what chemical weapons should have.. OPEN TO SUGGESTIONS!!!
branch.NewNames = {"Acidic", "Caustic", "Corrosive"}

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end
	local ironsights = self:GetIronsights()

	self:SetNextPrimaryFire(CurTime() + self:GetFireDelay())

	self:EmitFireSound()
	
	self:ShootBullets(self.Primary.Damage, self.Primary.NumShots, self:GetCone())
	self.IdleAnimation = CurTime() + self:SequenceDuration()
	
	self:TakeAmmo(true)
end