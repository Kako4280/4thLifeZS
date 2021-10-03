AddCSLuaFile()

SWEP.PrintName = "Honey Dipper"
SWEP.Description = "An effective and fast swinging melee weapon, the crowbar also has the ability to instantly kill headcrabs."

if CLIENT then
	SWEP.ViewModelFOV = 65
	SWEP.ViewModelBoneMods = {}

	SWEP.VElements = {
		["honey_base1"] = { type = "Model", model = "models/props_vehicles/tire001c_car.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.8, 1.5, -14.5), angle = Angle(96, 0, 0), size = Vector(0.1, 0.08, 0.08), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/white_brushes", skin = 0, bodygroup = {} },
		["honey_base2"] = { type = "Model", model = "models/props_vehicles/tire001c_car.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "honey_base1", pos = Vector(-0.8, 0, 0), angle = Angle(0, 0, 90), size = Vector(0.1, 0.1, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/white_brushes", skin = 0, bodygroup = {} },
		["honey_base3"] = { type = "Model", model = "models/props_vehicles/tire001c_car.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "honey_base1", pos = Vector(-1.6, 0, 0), angle = Angle(0, 0, 45), size = Vector(0.1, 0.12, 0.12), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/white_brushes", skin = 0, bodygroup = {} },
		["honey_base4"] = { type = "Model", model = "models/props_vehicles/tire001c_car.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "honey_base1", pos = Vector(-2.4, 0, 0), angle = Angle(0, 0, 135), size = Vector(0.1, 0.12, 0.12), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/white_brushes", skin = 0, bodygroup = {} },
		["honey_base5"] = { type = "Model", model = "models/props_vehicles/tire001c_car.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "honey_base1", pos = Vector(-3.2, 0, 0), angle = Angle(0, 0, 180), size = Vector(0.1, 0.11, 0.11), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/white_brushes", skin = 0, bodygroup = {} },
		["honey_base6"] = { type = "Model", model = "models/props_vehicles/tire001c_car.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "honey_base1", pos = Vector(-4, 0, 0), angle = Angle(0, 0, 180), size = Vector(0.1, 0.08, 0.08), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/white_brushes", skin = 0, bodygroup = {} },
		["honey_grip"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.25, 1.5, -19), angle = Angle(6, 0, 0), size = Vector(0.5, 0.5, 0.21), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/white_brushes", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["honey_base1"] = { type = "Model", model = "models/props_vehicles/tire001c_car.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.5, 1.5, -14.5), angle = Angle(96, 0, 0), size = Vector(0.1, 0.08, 0.08), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/white_brushes", skin = 0, bodygroup = {} },
		["honey_base2"] = { type = "Model", model = "models/props_vehicles/tire001c_car.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "honey_base1", pos = Vector(-0.8, 0, 0), angle = Angle(0, 0, 90), size = Vector(0.1, 0.1, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/white_brushes", skin = 0, bodygroup = {} },
		["honey_base3"] = { type = "Model", model = "models/props_vehicles/tire001c_car.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "honey_base1", pos = Vector(-1.6, 0, 0), angle = Angle(0, 0, 45), size = Vector(0.1, 0.12, 0.12), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/white_brushes", skin = 0, bodygroup = {} },
		["honey_base4"] = { type = "Model", model = "models/props_vehicles/tire001c_car.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "honey_base1", pos = Vector(-2.4, 0, 0), angle = Angle(0, 0, 135), size = Vector(0.1, 0.12, 0.12), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/white_brushes", skin = 0, bodygroup = {} },
		["honey_base5"] = { type = "Model", model = "models/props_vehicles/tire001c_car.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "honey_base1", pos = Vector(-3.2, 0, 0), angle = Angle(0, 0, 180), size = Vector(0.1, 0.11, 0.11), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/white_brushes", skin = 0, bodygroup = {} },
		["honey_base6"] = { type = "Model", model = "models/props_vehicles/tire001c_car.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "honey_base1", pos = Vector(-4, 0, 0), angle = Angle(0, 0, 180), size = Vector(0.1, 0.08, 0.08), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/white_brushes", skin = 0, bodygroup = {} },
		["honey_grip"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5, 1.5, -19), angle = Angle(6, 0, 0), size = Vector(0.5, 0.5, 0.21), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/white_brushes", skin = 0, bodygroup = {} }
	}
end

SWEP.Base = "weapon_zs_basemelee"

SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"

SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false

SWEP.UseHands = true

SWEP.HoldType = "melee"

SWEP.DamageType = DMG_CLUB

SWEP.MeleeDamage = 35
SWEP.OriginalMeleeDamage = SWEP.MeleeDamage
SWEP.MeleeRange = 55
SWEP.MeleeSize = 1.5
SWEP.MeleeKnockBack = 110

SWEP.Primary.Delay = 0.7

SWEP.Tier = 1

SWEP.SwingTime = 0.4
SWEP.SwingRotation = Angle(30, -30, -30)
SWEP.SwingHoldType = "grenade"

SWEP.AllowQualityWeapons = true

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MELEE_RANGE, 3)

function SWEP:PlaySwingSound()
	self:EmitSound("Weapon_Crowbar.Single")
end

function SWEP:PlayHitSound()
	self:EmitSound("Weapon_Crowbar.Melee_HitWorld")
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("Weapon_Crowbar.Melee_Hit")
end

function SWEP:PostOnMeleeHit(hitent, hitflesh, tr)
	if hitent:IsValid() and hitent:IsPlayer() and hitent:Team() == TEAM_UNDEAD and hitent:IsHeadcrab() and gamemode.Call("PlayerShouldTakeDamage", hitent, self:GetOwner()) then
		hitent:TakeSpecialDamage(hitent:Health(), DMG_DIRECT, self:GetOwner(), self, tr.HitPos)
	end
end

--[[function SWEP:OnMeleeHit(hitent, hitflesh, tr)
	if hitent:IsValid() and hitent:IsPlayer() and hitent:Team() == TEAM_UNDEAD and hitent:IsHeadcrab() and gamemode.Call("PlayerShouldTakeDamage", hitent, self:GetOwner()) then
		self.MeleeDamage = hitent:GetMaxHealth() * 10
	end
end

function SWEP:PostOnMeleeHit(hitent, hitflesh, tr)
	self.MeleeDamage = self.OriginalMeleeDamage
end]]
