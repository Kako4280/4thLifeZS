AddCSLuaFile()
DEFINE_BASECLASS("weapon_zs_base")

SWEP.PrintName = "'Terminus' SCAR-L"
SWEP.Description = "A powerful assault rifle that gains damage as bullets in the clip decreases."

SWEP.Slot = 2
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 60

	SWEP.ViewModelFlip = false
	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

	SWEP.HUD3DBone = "v_weapon.sg550_Parent"
	SWEP.HUD3DPos = Vector(-1.3, -5.56, -2)
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DScale = 0.02

	SWEP.VElements = {
		["base+++++"] = { type = "Model", model = "models/props_trainstation/trainstation_column001.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(-0.399, -10.077, 0.458), angle = Angle(0, 0, -90), size = Vector(0.09, 0.09, 0.041), color = Color(200, 200, 200, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["base++++++++++++"] = { type = "Model", model = "models/props_phx/trains/tracks/track_2x.mdl", bone = "v_weapon.sg550_Parent", rel = "base", pos = Vector(-1.147, -5.325, 0.579), angle = Angle(0, 90, 90), size = Vector(0.019, 0.008, 0.029), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
		["base++++++++++++++"] = { type = "Model", model = "models/hunter/blocks/cube025x2x025.mdl", bone = "v_weapon.sg550_Parent", rel = "base", pos = Vector(0.133, -6.993, -0.058), angle = Angle(0, 0, 0), size = Vector(0.093, 0.067, 0.109), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
		["base++++"] = { type = "Model", model = "models/props_phx/trains/tracks/track_2x.mdl", bone = "v_weapon.sg550_Parent", rel = "base", pos = Vector(-0.431, -3.07, -1.063), angle = Angle(0, 90, 0), size = Vector(0.029, 0.004, 0.029), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
		["mag"] = { type = "Model", model = "models/hunter/blocks/cube1x1x1.mdl", bone = "v_weapon.sg550_Clip", rel = "", pos = Vector(-0.03, 2.838, -0.187), angle = Angle(0, 0, 11.232), size = Vector(0.017, 0.14, 0.068), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
		["base+++++++++++"] = { type = "Model", model = "models/hunter/blocks/cube1x1x025.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(-0.401, 18.51, -1.601), angle = Angle(92.424, -90, 0), size = Vector(0.129, 0.028, 0.054), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete1", skin = 0, bodygroup = {} },
		["base+++"] = { type = "Model", model = "models/hunter/blocks/cube025x2x025.mdl", bone = "v_weapon.sg550_Parent", rel = "base", pos = Vector(0, -5.474, -0.886), angle = Angle(0, 0, 0), size = Vector(0.074, 0.097, 0.078), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
		["base++++++++++++++++"] = { type = "Model", model = "models/props_pipes/concrete_pipe001a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(-0.429, -10.79, 3.95), angle = Angle(-180, 90, 0), size = Vector(0.004, 0.009, 0.009), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
		["base++"] = { type = "Model", model = "models/props_phx/trains/tracks/track_8x.mdl", bone = "v_weapon.sg550_Parent", rel = "base", pos = Vector(-0.431, -3.901, 2.5), angle = Angle(180, 90, 0), size = Vector(0.017, 0.004, 0.029), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete1", skin = 0, bodygroup = {} },
		["base+++++++"] = { type = "Model", model = "models/weapons/w_pist_glock18.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(-0.452, 7.76, -6.605), angle = Angle(0.172, 90, 0), size = Vector(1.18, 0.879, 1.059), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["base+"] = { type = "Model", model = "models/hunter/blocks/cube025x2x025.mdl", bone = "v_weapon.sg550_Parent", rel = "base", pos = Vector(-0.11, 0, 1.697), angle = Angle(0, 0, 0), size = Vector(0.054, 0.214, 0.056), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
		["base+++++++++++++++"] = { type = "Model", model = "models/props_combine/combinethumper002.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(-0.581, 9.357, 2.319), angle = Angle(0, 0, 0), size = Vector(0.014, 0.012, 0.006), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++"] = { type = "Model", model = "models/props_pipes/concrete_pipe001a.mdl", bone = "v_weapon.sg550_Chamber", rel = "", pos = Vector(-0.633, -0.877, -4.751), angle = Angle(-180, 0, 0), size = Vector(0.008, 0.004, 0.004), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
		["base++++++"] = { type = "Model", model = "models/props_combine/combine_binocular01.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(-0.429, -10.709, 2.403), angle = Angle(-180, 90, 0), size = Vector(0.104, 0.076, 0.054), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
		["base"] = { type = "Model", model = "models/hunter/blocks/cube025x2x025.mdl", bone = "v_weapon.sg550_Parent", rel = "", pos = Vector(0.398, -4.837, -6.283), angle = Angle(0, 0, -90), size = Vector(0.074, 0.214, 0.142), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete1", skin = 0, bodygroup = {} },
		["base+++++++++"] = { type = "Model", model = "models/Gibs/helicopter_brokenpiece_03.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(-0.464, 12.635, -0.173), angle = Angle(13.321, 85.75, -18.448), size = Vector(0.123, 0.065, 0.14), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
		["base++++++++"] = { type = "Model", model = "models/hunter/blocks/cube025x1x025.mdl", bone = "v_weapon.sg550_Parent", rel = "base", pos = Vector(0.05, 1.534, -2.869), angle = Angle(0, 0, 9.149), size = Vector(0.079, 0.082, 0.207), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["base++++++++++"] = { type = "Model", model = "models/hunter/triangles/trapezium3x3x1c.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(-0.401, 16.805, -1.68), angle = Angle(92.424, -90, 0), size = Vector(0.063, 0.027, 0.059), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete1", skin = 0, bodygroup = {} },
		["base++++++++++++++++++"] = { type = "Model", model = "models/hunter/blocks/cube025x2x025.mdl", bone = "v_weapon.sg550_Parent", rel = "base", pos = Vector(-0.565, 1.32, 1.84), angle = Angle(0, 0, 0), size = Vector(0.02, 0.052, 0.029), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} }
	}

	SWEP.WElements = {
		["base+++++"] = { type = "Model", model = "models/props_trainstation/trainstation_column001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.399, -10.077, 0.458), angle = Angle(0, 0, -90), size = Vector(0.09, 0.09, 0.041), color = Color(200, 200, 200, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["base+++++++++++++"] = { type = "Model", model = "models/props_phx/trains/tracks/track_2x.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.282, -5.325, 0.579), angle = Angle(0, 90, -90), size = Vector(0.019, 0.008, 0.029), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
		["base++++++++++++"] = { type = "Model", model = "models/props_phx/trains/tracks/track_2x.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-1.147, -5.325, 0.579), angle = Angle(0, 90, 90), size = Vector(0.019, 0.008, 0.029), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
		["base++++++++++++++"] = { type = "Model", model = "models/hunter/blocks/cube025x2x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.133, -6.993, -0.058), angle = Angle(0, 0, 0), size = Vector(0.093, 0.067, 0.109), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
		["base++++"] = { type = "Model", model = "models/props_phx/trains/tracks/track_2x.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.431, -3.07, -1.063), angle = Angle(0, 90, 0), size = Vector(0.029, 0.004, 0.029), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
		["base+++++++++++"] = { type = "Model", model = "models/hunter/blocks/cube1x1x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.401, 18.51, -1.601), angle = Angle(92.424, -90, 0), size = Vector(0.129, 0.028, 0.054), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete1", skin = 0, bodygroup = {} },
		["base+++"] = { type = "Model", model = "models/hunter/blocks/cube025x2x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, -5.474, -0.886), angle = Angle(0, 0, 0), size = Vector(0.074, 0.097, 0.078), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
		["base++++++++++++++++"] = { type = "Model", model = "models/props_pipes/concrete_pipe001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.429, -10.79, 3.95), angle = Angle(-180, 90, 0), size = Vector(0.004, 0.009, 0.009), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
		["base++"] = { type = "Model", model = "models/props_phx/trains/tracks/track_8x.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.431, -3.901, 2.5), angle = Angle(180, 90, 0), size = Vector(0.017, 0.004, 0.029), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete1", skin = 0, bodygroup = {} },
		["base+++++++"] = { type = "Model", model = "models/weapons/w_pist_glock18.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.452, 7.76, -6.605), angle = Angle(0.172, 90, 0), size = Vector(1.18, 0.879, 1.059), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["base+"] = { type = "Model", model = "models/hunter/blocks/cube025x2x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.11, 0, 1.697), angle = Angle(0, 0, 0), size = Vector(0.054, 0.214, 0.056), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
		["base+++++++++++++++"] = { type = "Model", model = "models/props_combine/combinethumper002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.581, 9.357, 2.319), angle = Angle(0, 0, 0), size = Vector(0.014, 0.012, 0.006), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
		["base"] = { type = "Model", model = "models/hunter/blocks/cube025x2x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(11.472, 0.644, -4.957), angle = Angle(-180, -84.611, 9.975), size = Vector(0.074, 0.214, 0.142), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete1", skin = 0, bodygroup = {} },
		["base++++++"] = { type = "Model", model = "models/props_combine/combine_binocular01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.429, -10.709, 2.403), angle = Angle(-180, 90, 0), size = Vector(0.104, 0.076, 0.054), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
		["mag"] = { type = "Model", model = "models/hunter/blocks/cube1x1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.408, 1.106, -5.235), angle = Angle(0, 0, 102.095), size = Vector(0.017, 0.14, 0.068), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
		["base+++++++++"] = { type = "Model", model = "models/Gibs/helicopter_brokenpiece_03.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.464, 12.635, -0.173), angle = Angle(13.321, 85.75, -18.448), size = Vector(0.123, 0.065, 0.14), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
		["base++++++++"] = { type = "Model", model = "models/hunter/blocks/cube025x1x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.05, 1.534, -2.869), angle = Angle(0, 0, 9.149), size = Vector(0.079, 0.082, 0.207), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["base++++++++++"] = { type = "Model", model = "models/hunter/triangles/trapezium3x3x1c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.401, 16.805, -1.68), angle = Angle(92.424, -90, 0), size = Vector(0.063, 0.027, 0.059), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete1", skin = 0, bodygroup = {} },
		["base++++++++++++++++++"] = { type = "Model", model = "models/hunter/blocks/cube025x2x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.565, 1.32, 1.84), angle = Angle(0, 0, 0), size = Vector(0.02, 0.052, 0.029), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} }
	}
end

sound.Add(
{
	name = "Weapon_Scar.Single",
	channel = CHAN_WEAPON,
	volume = 1,
	level = 85,
	pitch = {85,90},
	sound = {"weapons/zs_scar/scar_fire1.ogg"}
})

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "ar2"

SWEP.ViewModel = "models/weapons/cstrike/c_snip_sg550.mdl"
SWEP.WorldModel = "models/weapons/w_snip_sg550.mdl"
SWEP.UseHands = true

SWEP.Primary.Sound = Sound("Weapon_Scar.Single")
SWEP.Primary.Damage = 29
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.095

SWEP.Primary.ClipSize = 32
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "ar2"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.Primary.Gesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.ReloadGesture = ACT_HL2MP_GESTURE_RELOAD_AR2

SWEP.ConeMax = 2.7
SWEP.ConeMin = 1.25

SWEP.WalkSpeed = SPEED_SLOW

SWEP.Tier = 5

SWEP.HeadshotMulti = 2

SWEP.FireAnimSpeed = 0.65

SWEP.IronSightsPos = Vector(-7.361, 0, 0.62)

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_CLIP_SIZE, 3)


function SWEP:ShootBullets(dmg, numbul, cone)
	dmg = math.floor(dmg * (1 + ((self.Primary.ClipSize - self:Clip1()) / self.Primary.ClipSize * 0.90)))

	BaseClass.ShootBullets(self, dmg, numbul, cone)
end


GAMEMODE:SetPrimaryWeaponModifier(SWEP, WEAPON_MODIFIER_RELOAD_SPEED, 0.07)
local branch = GAMEMODE:AddNewRemantleBranch(SWEP, 1, "'FN' FAL", "increased damage, gains accuracy as bullets in the clip decreases, at the cost of clipsize.", function(wept)

    wept.Primary.Delay = wept.Primary.Delay * 1.2
	wept.Primary.Damage = wept.Primary.Damage * 1.3
	wept.Primary.ClipSize = math.floor(wept.Primary.ClipSize * 0.75)
	wept.Primary.Automatic = false

	wept.IronSightsPos = Vector(-6.5, 23, 3.6)

wept.ViewModel = "models/weapons/cstrike/c_rif_ak47.mdl"
wept.WorldModel = "models/weapons/w_rif_ak47.mdl"
wept.UseHands = true

		wept.ViewModelFlip = false
		wept.ViewModelFOV = 60
	
		wept.ViewModelFlip = false
		wept.ShowViewModel = false
		wept.ShowWorldModel = false
	
		wept.HUD3DBone = "v_weapon.AK47_Parent"
		wept.HUD3DPos = Vector(-1.3, -5.56, -2)
		wept.HUD3DAng = Angle(0, 0, 0)
		wept.HUD3DScale = 0.02
	
		wept.VElements = {
			["FN8++++"] = { type = "Model", model = "models/hunter/tubes/tube1x1x5.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(-0.051, -4.75, -31), angle = Angle(0, -90, 0), size = Vector(0.009, 0.009, 0.039), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN12"] = { type = "Model", model = "models/hunter/tubes/circle2x2c.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(-0.06, -4.1, -15.101), angle = Angle(0, -90, 0), size = Vector(0.05, 0.014, 3.5), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN9"] = { type = "Model", model = "models/hunter/tubes/circle2x2c.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(-0.071, -5.2, -8.801), angle = Angle(0, -90, 0), size = Vector(0.025, 0.014, 0.4), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN1"] = { type = "Model", model = "models/weapons/w_pist_glock18.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(-0.026, 1.6, 0), angle = Angle(-90, 90, 0), size = Vector(1.1, 1.1, 1.1), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN12++"] = { type = "Model", model = "models/hunter/tubes/circle2x2c.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(-0.06, -4.25, -21), angle = Angle(0, -90, 0), size = Vector(0.037, 0.009, 0.8), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN11"] = { type = "Model", model = "models/hunter/geometric/hex1x1.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(-0.065, -5.801, -9.87), angle = Angle(0, 0, 0), size = Vector(0.009, 0.009, 0.2), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN18+++++++"] = { type = "Model", model = "models/hunter/triangles/1x05x05.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(-0.093, -3.3, 8.949), angle = Angle(-180, -180, 0), size = Vector(0.045, 0.054, 0.28), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
			["FN11+"] = { type = "Model", model = "models/hunter/tubes/tube1x1x1.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(-0.026, -4.551, -9.87), angle = Angle(0, 0, 0), size = Vector(0.028, 0.028, 0.028), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN18+"] = { type = "Model", model = "models/hunter/tubes/tube2x2x025d.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(-0.101, -6.72, 13.3), angle = Angle(-5, 90, 90), size = Vector(0.025, 0.224, 0.09), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
			["FN20"] = { type = "Model", model = "models/props_wasteland/prison_padlock001a.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(-0.026, -6.45, 2.5), angle = Angle(90, 0, -90), size = Vector(0.1, 0.1, 0.1), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN2"] = { type = "Model", model = "models/hunter/geometric/hex05x1.mdl", bone = "v_weapon.AK47_Clip", rel = "", pos = Vector(0.43, 1.6, 0.72), angle = Angle(90, 0, 0), size = Vector(0.082, 0.082, 0.319), color = Color(90, 90, 90, 255), surpresslightning = false, material = "phoenix_storms/dome", skin = 0, bodygroup = {} },
			["FN21+"] = { type = "Model", model = "models/hunter/misc/roundthing2.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(-0.625, -5.7, -15.5), angle = Angle(0, 75, 90), size = Vector(0.009, 0.009, 0.009), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN18+++"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(-0.095, -5.2, 4), angle = Angle(0, 0, 15), size = Vector(0.09, 0.05, 0.119), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
			["FN18++++"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(-0.095, -4.7, 8.25), angle = Angle(0, 0, -90), size = Vector(0.09, 0.86, 0.1), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
			["FN3++"] = { type = "Model", model = "models/hunter/blocks/cube025x2x025.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(0.6, -5.2, -6.3), angle = Angle(0, 0, 90), size = Vector(0.127, 0.059, 0.039), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN3"] = { type = "Model", model = "models/hunter/blocks/cube025x2x025.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(0.675, -5.401, -3.75), angle = Angle(0, 0, 90), size = Vector(0.119, 0.119, 0.1), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN19"] = { type = "Model", model = "models/props_wasteland/prison_padlock001a.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(-0.101, -5.901, -19.5), angle = Angle(0, 15, -90), size = Vector(0.15, 0.15, 0.2), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN3+"] = { type = "Model", model = "models/hunter/blocks/cube025x2x025.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(0.72, -5.401, -3.701), angle = Angle(0, 0, 90), size = Vector(0.127, 0.119, 0.039), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN18"] = { type = "Model", model = "models/hunter/tubes/tube2x2x025d.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(-0.02, 0.75, 0), angle = Angle(6, -90, -90), size = Vector(0.104, 0.275, 0.104), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
			["FN15"] = { type = "Model", model = "models/props_combine/combine_barricade_bracket01b.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(0, -3.5, -5.2), angle = Angle(-90, 90, -90), size = Vector(0.05, 0.05, 0.05), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN18++++++"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(-0.098, -5.2, 11.6), angle = Angle(0, 0, -4), size = Vector(0.09, 0.039, 0.3), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
			["FN8+"] = { type = "Model", model = "models/hunter/tubes/tube1x1x5.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(0.25, -5.6, -8.2), angle = Angle(0, -90, 0), size = Vector(0.016, 0.014, 0.043), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN19+"] = { type = "Model", model = "models/props_wasteland/prison_padlock001a.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(0, -5.901, -19.5), angle = Angle(0, -15, -90), size = Vector(0.15, 0.15, 0.2), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN8++"] = { type = "Model", model = "models/hunter/tubes/tube1x1x5.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(-0.051, -5.95, -8.2), angle = Angle(0, -90, 0), size = Vector(0.016, 0.014, 0.043), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
			["FN14"] = { type = "Model", model = "models/hunter/tubes/tube1x1x1.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(-0.051, -4.75, -31), angle = Angle(0, 0, 0), size = Vector(0.01, 0.01, 0.019), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN16"] = { type = "Model", model = "models/props_pipes/pipe01_connector01.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(-0.65, -3.8, -4.25), angle = Angle(0, 0, 0), size = Vector(0.1, 0.1, 0.1), color = Color(100, 100, 100, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN18++"] = { type = "Model", model = "models/hunter/blocks/cube025x2x025.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(0.439, -3, 12.199), angle = Angle(0, 0, 0), size = Vector(0.09, 0.052, 0.1), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
			["FN12+"] = { type = "Model", model = "models/hunter/misc/roundthing2.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(-0.06, -4.1, -20.351), angle = Angle(0, -90, 0), size = Vector(0.009, 0.009, 0.221), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN21"] = { type = "Model", model = "models/hunter/misc/roundthing2.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(-0.625, -5.7, -17.5), angle = Angle(0, 75, 90), size = Vector(0.009, 0.009, 0.009), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN5"] = { type = "Model", model = "models/hunter/blocks/cube025x05x025.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(0.615, -4.901, 2), angle = Angle(0, 0, 0), size = Vector(0.112, 0.079, 0.112), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN6"] = { type = "Model", model = "models/hunter/geometric/hex05x1.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(-0.625, -5.91, 2), angle = Angle(-90, 0, 0), size = Vector(0.025, 0.009, 0.4), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN7"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(-0.02, -5.861, 2.47), angle = Angle(0, 0, 0), size = Vector(0.09, 0.09, 0.079), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN10"] = { type = "Model", model = "models/hunter/tubes/tube1x1x1.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(0, -4.45, -9.75), angle = Angle(0, 0, 15), size = Vector(0.024, 0.024, 0.035), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN4"] = { type = "Model", model = "models/hunter/blocks/cube025x05x025.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(0.6, -4.6, -8.271), angle = Angle(0, 0, 0), size = Vector(0.104, 0.081, 0.2), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN8"] = { type = "Model", model = "models/hunter/tubes/tube1x1x5.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(-0.375, -5.6, -8.2), angle = Angle(0, -90, 0), size = Vector(0.016, 0.014, 0.043), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} }
		}
	
		wept.WElements = {
			["FN8++++"] = { type = "Model", model = "models/hunter/tubes/tube1x1x5.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(27.5, 0.699, -4.5), angle = Angle(87, 0, 0), size = Vector(0.009, 0.009, 0.025), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
			["FN12"] = { type = "Model", model = "models/hunter/tubes/circle2x2c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(16.899, 0.699, -3.576), angle = Angle(87, 0, 0), size = Vector(0.052, 0.014, 2.75), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN9"] = { type = "Model", model = "models/hunter/tubes/circle2x2c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(11.779, 0.709, -4.35), angle = Angle(87, 0, 0), size = Vector(0.025, 0.014, 0.354), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN5"] = { type = "Model", model = "models/hunter/blocks/cube025x05x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.2, 0.725, -4.5), angle = Angle(-3, 0, 0), size = Vector(0.112, 0.063, 0.174), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN12++"] = { type = "Model", model = "models/hunter/tubes/circle2x2c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(21.75, 0.699, -3.8), angle = Angle(87, 0, 0), size = Vector(0.037, 0.009, 0.55), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN11"] = { type = "Model", model = "models/hunter/geometric/hex1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(12.8, 0.699, -4.95), angle = Angle(87, 0, 0), size = Vector(0.009, 0.009, 0.2), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN18+++++++"] = { type = "Model", model = "models/hunter/triangles/1x05x05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-6.2, 0.689, -1.201), angle = Angle(0, 90, 90), size = Vector(0.043, 0.064, 0.15), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
			["FN11+"] = { type = "Model", model = "models/hunter/tubes/tube1x1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(12.8, 0.70, -3.8), angle = Angle(87, 0, 0), size = Vector(0.026, 0.026, 0.026), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
			["FN20"] = { type = "Model", model = "models/props_wasteland/prison_padlock001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.725, 0.725, -4.901), angle = Angle(0, 0, 180), size = Vector(0.1, 0.1, 0.1), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN6"] = { type = "Model", model = "models/hunter/geometric/hex05x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.2, 0.05, -4.546), angle = Angle(-3, 0, 90), size = Vector(0.025, 0.009, 0.449), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN18+++"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.5, 0.699, -3.75), angle = Angle(0, -90, 83), size = Vector(0.09, 0.05, 0.3), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
			["FN18++++"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-7.2, 0.685, -3.201), angle = Angle(0, 90, -10), size = Vector(0.086, 0.174, 0.1), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
			["FN3++"] = { type = "Model", model = "models/hunter/blocks/cube025x2x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(9.6, 0.05, -4), angle = Angle(0, 90, 3), size = Vector(0.128, 0.05, 0.039), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN7"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.72, 0.725, -4.7), angle = Angle(-3, 0, 0), size = Vector(0.079, 0.1, 0.05), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN19"] = { type = "Model", model = "models/props_wasteland/prison_padlock001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(20.25, 0.675, -4.75), angle = Angle(20, 90, 180), size = Vector(0.125, 0.125, 0.125), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN3"] = { type = "Model", model = "models/hunter/blocks/cube025x2x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.099, 0, -4.125), angle = Angle(0, 90, 3), size = Vector(0.119, 0.109, 0.1), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN18"] = { type = "Model", model = "models/hunter/tubes/tube2x2x025d.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.5, 0.699, 0.8), angle = Angle(90, 0, -90), size = Vector(0.079, 0.2, 0.09), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
			["FN15"] = { type = "Model", model = "models/props_combine/combine_barricade_bracket01b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(8.859, 0.699, -2), angle = Angle(0, 0, 90), size = Vector(0.05, 0.05, 0.05), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN18++++++"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-8.4, 0.699, -1.65), angle = Angle(0, 90, 3), size = Vector(0.09, 0.125, 0.419), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
			["FN18++++++++"] = { type = "Model", model = "models/hunter/triangles/1x05x05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-3.401, 0.704, -2.175), angle = Angle(0, 90, 85), size = Vector(0.045, 0.039, 0.224), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
			["FN19+"] = { type = "Model", model = "models/props_wasteland/prison_padlock001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(20.25, 0.75, -4.75), angle = Angle(-20, 90, 180), size = Vector(0.125, 0.125, 0.125), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN8++"] = { type = "Model", model = "models/hunter/tubes/tube1x1x5.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(11.25, 0.699, -5.1), angle = Angle(87, 0, 0), size = Vector(0.014, 0.013, 0.039), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
			["FN14"] = { type = "Model", model = "models/hunter/tubes/tube1x1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(27.5, 0.699, -4.5), angle = Angle(87, 0, 0), size = Vector(0.01, 0.01, 0.019), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN16"] = { type = "Model", model = "models/props_pipes/pipe01_connector01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.8, 1.325, -2.165), angle = Angle(0, 90, 0), size = Vector(0.1, 0.1, 0.1), color = Color(100, 100, 100, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN18++"] = { type = "Model", model = "models/hunter/blocks/cube025x2x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-3.6, 0.17, -3.75), angle = Angle(0, 90, 3), size = Vector(0.09, 0.094, 0.09), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
			["FN4"] = { type = "Model", model = "models/hunter/blocks/cube025x05x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(11.25, 0.73, -3.25), angle = Angle(-3, 0, 0), size = Vector(0.104, 0.05, 0.1), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN10"] = { type = "Model", model = "models/hunter/tubes/tube1x1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(11, 0.725, -2.9), angle = Angle(-115.5, 0, 0), size = Vector(0.024, 0.024, 0.05), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
			["FN1"] = { type = "Model", model = "models/weapons/w_pist_glock18.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 0.75, 3.099), angle = Angle(-3, 0, 180), size = Vector(1, 1, 1), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN8+"] = { type = "Model", model = "models/hunter/tubes/tube1x1x5.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(11.25, 0.349, -4.6), angle = Angle(87, 0, 0), size = Vector(0.014, 0.013, 0.039), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
			["FN2"] = { type = "Model", model = "models/hunter/geometric/hex05x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(8.55, 1.2, -0.5), angle = Angle(180, 0, -90), size = Vector(0.064, 0.07, 0.319), color = Color(90, 90, 90, 255), surpresslightning = false, material = "phoenix_storms/dome", skin = 0, bodygroup = {} },
			["FN18+"] = { type = "Model", model = "models/hunter/tubes/tube2x2x025d.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1, 0.699, -5.401), angle = Angle(-98, 0, 90), size = Vector(0.025, 0.2, 0.09), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
			["FN12+"] = { type = "Model", model = "models/hunter/misc/roundthing2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(21.024, 0.699, -3.75), angle = Angle(87, 0, 0), size = Vector(0.009, 0.009, 0.173), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
			["FN8"] = { type = "Model", model = "models/hunter/tubes/tube1x1x5.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(11.25, 1, -4.6), angle = Angle(87, 0, 0), size = Vector(0.014, 0.013, 0.039), color = Color(120, 120, 120, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} }
		}
		function wept:ShootBullets(dmg, numbul, cone)
			cone = math.floor(cone - (0.10 + ((self.Primary.ClipSize - self:Clip1()) / self.Primary.ClipSize * 0.95)))
		
			BaseClass.ShootBullets(self, dmg, numbul, cone)
	end
end)

branch.Killicon = "weapon_zs_fal2"