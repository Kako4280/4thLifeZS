AddCSLuaFile()
DEFINE_BASECLASS("weapon_zs_base")

SWEP.PrintName = "'Quicksilver' Semi-Auto Rifle"
SWEP.Description = "A semi automatic sniper rifle. Has good fire rate, large clip size and a decent damage per shot."

SWEP.Slot = 3
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false

	SWEP.HUD3DBone = "v_weapon.g3sg1_Parent"
	SWEP.HUD3DPos = Vector(-1.2, -5.75, -1)
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DScale = 0.015
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "ar2"

SWEP.ViewModel = "models/weapons/cstrike/c_snip_g3sg1.mdl"
SWEP.WorldModel = "models/weapons/w_snip_g3sg1.mdl"
SWEP.UseHands = true

SWEP.Primary.Sound = Sound("Weapon_G3SG1.Single")
SWEP.Primary.Damage = 85
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.4

SWEP.Primary.ClipSize = 10
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "357"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.Primary.Gesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW
SWEP.ReloadGesture = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN

SWEP.ConeMax = 6.5
SWEP.ConeMin = 0

SWEP.IronSightsPos = Vector(11, -9, -2.2)
SWEP.IronSightsAng = Vector(0, 0, 0)

SWEP.WalkSpeed = SPEED_SLOW

SWEP.Tier = 4
--SWEP.MaxStock = 3

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.05, 1)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, "'Mercurial' Birdshot Rifle", "Fires a spread of less accurate shots that deal more total damage", function(wept)
	wept.Primary.Damage = wept.Primary.Damage / 5
	wept.Primary.NumShots = 6
	wept.ConeMin = 3
end)

local branch = GAMEMODE:AddNewRemantleBranch(SWEP, 2, "'Pufferfish' Chemical Rifle", "Changes the ammo type to chemical, bullets remove damage resistance, inflicting damage over time.", function(wept)
wept.Primary.Ammo = "chemical"

wept.Primary.ClipSize = 25
wept.Primary.DefaultClip = 30
wept.RequiredClip = 5
wept.Primary.Delay = 0.67

	if CLIENT then
		wept.ViewModelFlip = false
		wept.ViewModelFOV = 65
	
		wept.ViewModelBoneMods = {}

		wept.HUD3DBone = "v_weapon.sg550_Parent"
		wept.HUD3DPos = Vector(-1.25, -3.5, -16)
		wept.HUD3DAng = Angle(0, 0, 0)
		wept.HUD3DScale = 0.02
	
		wept.VElements = {
			["pufferfish_barrel"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360x2.mdl", bone = "v_weapon.sg550_Parent", rel = "pufferfish_grip", pos = Vector(0, 27, -8.75), angle = Angle(0, 0, -75), size = Vector(0.01, 0.01, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
			["pufferfish_barrel_detail1"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "v_weapon.sg550_Parent", rel = "pufferfish_grip", pos = Vector(0, 20, -6.875), angle = Angle(0, 0, -75), size = Vector(0.011, 0.011, 0.2), color = Color(160, 160, 160, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
			["pufferfish_base"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360.mdl", bone = "v_weapon.sg550_Parent", rel = "pufferfish_grip", pos = Vector(0, 8.75, -3.5), angle = Angle(0, 0, -75), size = Vector(0.03, 0.03, 0.125), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
			["pufferfish_base_detail1"] = { type = "Model", model = "models/props_wasteland/laundry_basket001.mdl", bone = "v_weapon.sg550_Parent", rel = "pufferfish_grip", pos = Vector(0, 4.2, -2.3), angle = Angle(0, 0, 105), size = Vector(0.054, 0.054, 0.054), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
			["pufferfish_base_detail2"] = { type = "Model", model = "models/props_wasteland/laundry_washer001a.mdl", bone = "v_weapon.sg550_Parent", rel = "pufferfish_grip", pos = Vector(-0.1, 7.8, -3.4), angle = Angle(165, 5, 75), size = Vector(0.034, 0.034, 0.034), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
			["pufferfish_base_detail3"] = { type = "Model", model = "models/props_combine/combine_train02a.mdl", bone = "v_weapon.sg550_Parent", rel = "pufferfish_grip", pos = Vector(0, 9.5, -3), angle = Angle(0, 180, -15), size = Vector(0.01, 0.01, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
			["pufferfish_base_detail4"] = { type = "Model", model = "models/props_c17/consolebox03a.mdl", bone = "v_weapon.sg550_Parent", rel = "pufferfish_grip", pos = Vector(0.625, 5, -1.25), angle = Angle(95, 90, -90), size = Vector(0.1, 0.125, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_c17/substation_transformer01a", skin = 0, bodygroup = {} },
			["pufferfish_base_detail5"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "v_weapon.sg550_Parent", rel = "pufferfish_grip", pos = Vector(0, 0.5, -0.45), angle = Angle(0, 0, 105), size = Vector(0.25, 0.25, 0.03), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
			["pufferfish_base_detail6"] = { type = "Model", model = "models/gibs/metal_gib5.mdl", bone = "v_weapon.sg550_Parent", rel = "pufferfish_grip", pos = Vector(0, 0.75, 0), angle = Angle(0, -90, 90), size = Vector(0.5, 0.1, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
			["pufferfish_base_detail7"] = { type = "Model", model = "models/gibs/metal_gib5.mdl", bone = "v_weapon.sg550_Parent", rel = "pufferfish_grip", pos = Vector(0, 1.75, 0.75), angle = Angle(-5, -90, -90), size = Vector(0.3, 0.2, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
			["pufferfish_bolt"] = { type = "Model", model = "models/gibs/metal_gib5.mdl", bone = "v_weapon.sg550_Chamber", rel = "", pos = Vector(-1.5, 1, -1), angle = Angle(0, -40, 90), size = Vector(0.2, 0.3, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
			["pufferfish_grip"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "v_weapon.sg550_Parent", rel = "", pos = Vector(0, -3, 0), angle = Angle(0, 0, 75), size = Vector(0.5, 0.5, 0.065), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
			["pufferfish_magazine"] = { type = "Model", model = "models/hunter/blocks/cube025x05x025.mdl", bone = "v_weapon.sg550_Clip", rel = "", pos = Vector(0.45, 1, -0.55), angle = Angle(0, 0, 80), size = Vector(0.075, 0.1, 0.25), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_c17/substation_transformer01a", skin = 0, bodygroup = {} },
			["pufferfish_scope1"] = { type = "Model", model = "models/xqm/deg90.mdl", bone = "v_weapon.sg550_Parent", rel = "pufferfish_grip", pos = Vector(0.575, 5, -3.875), angle = Angle(15, 90, -135), size = Vector(0.025, 0.05, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
			["pufferfish_scope2"] = { type = "Model", model = "models/hunter/plates/plate1x3x1trap.mdl", bone = "v_weapon.sg550_Parent", rel = "pufferfish_grip", pos = Vector(0.08, 4.75, -4.5), angle = Angle(-75, 90, -90), size = Vector(0.003, 0.01, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
			["pufferfish_scope3"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360.mdl", bone = "v_weapon.sg550_Parent", rel = "pufferfish_grip", pos = Vector(0, 5.25, -5.15), angle = Angle(0, 0, -75), size = Vector(0.011, 0.011, 0.04), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
			["pufferfish_scope4"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360.mdl", bone = "v_weapon.sg550_Parent", rel = "pufferfish_grip", pos = Vector(0, 4.92, -5.07), angle = Angle(0, 0, -75), size = Vector(0.012, 0.012, 0.012), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
			["pufferfish_scope5"] = { type = "Model", model = "models/props_junk/wood_crate001a_chunk05.mdl", bone = "v_weapon.sg550_Parent", rel = "pufferfish_grip", pos = Vector(0, 4.4, -4.625), angle = Angle(-75, 90, 0), size = Vector(0.015, 0.015, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
			["pufferfish_stock1"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "v_weapon.sg550_Parent", rel = "pufferfish_grip", pos = Vector(0, 3.1, -2), angle = Angle(0, 0, -75), size = Vector(0.35, 0.35, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
			["pufferfish_stock2"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "v_weapon.sg550_Parent", rel = "pufferfish_grip", pos = Vector(0, 3.1, -2), angle = Angle(0, 0, -75), size = Vector(0.25, 0.25, 0.125), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
			["pufferfish_stock3"] = { type = "Model", model = "models/combine_helicopter/bomb_debris_2.mdl", bone = "v_weapon.sg550_Parent", rel = "pufferfish_grip", pos = Vector(0, -10.45, 1.65), angle = Angle(-75, 90, 0), size = Vector(0.15, 0.15, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
			["pufferfish_stock4"] = { type = "Model", model = "models/combine_helicopter/bomb_debris_2.mdl", bone = "v_weapon.sg550_Parent", rel = "pufferfish_grip", pos = Vector(0, -10.45, 1.65), angle = Angle(-75, 90, 0), size = Vector(0.15, 0.15, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} }
		}
		
		wept.WElements = {
			["pufferfish_barrel"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pufferfish_grip", pos = Vector(0, 27, -8.75), angle = Angle(0, 0, -75), size = Vector(0.01, 0.01, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
			["pufferfish_barrel_detail1"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pufferfish_grip", pos = Vector(0, 20, -6.875), angle = Angle(0, 0, -75), size = Vector(0.011, 0.011, 0.2), color = Color(160, 160, 160, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
			["pufferfish_base"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pufferfish_grip", pos = Vector(0, 8.75, -3.5), angle = Angle(0, 0, -75), size = Vector(0.03, 0.03, 0.125), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
			["pufferfish_base_detail1"] = { type = "Model", model = "models/props_wasteland/laundry_basket001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pufferfish_grip", pos = Vector(0, 4.2, -2.3), angle = Angle(0, 0, 105), size = Vector(0.054, 0.054, 0.054), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
			["pufferfish_base_detail2"] = { type = "Model", model = "models/props_wasteland/laundry_washer001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pufferfish_grip", pos = Vector(-0.1, 7.8, -3.4), angle = Angle(165, 5, 75), size = Vector(0.034, 0.034, 0.034), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
			["pufferfish_base_detail3"] = { type = "Model", model = "models/props_combine/combine_train02a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pufferfish_grip", pos = Vector(0, 9.5, -3), angle = Angle(0, 180, -15), size = Vector(0.01, 0.01, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
			["pufferfish_base_detail4"] = { type = "Model", model = "models/props_c17/consolebox03a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pufferfish_grip", pos = Vector(0.625, 5, -1.25), angle = Angle(95, 90, -90), size = Vector(0.1, 0.125, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_c17/substation_transformer01a", skin = 0, bodygroup = {} },
			["pufferfish_base_detail5"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pufferfish_grip", pos = Vector(0, 0.5, -0.45), angle = Angle(0, 0, 105), size = Vector(0.25, 0.25, 0.03), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
			["pufferfish_base_detail6"] = { type = "Model", model = "models/gibs/metal_gib5.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pufferfish_grip", pos = Vector(0, 0.75, 0), angle = Angle(0, -90, 90), size = Vector(0.5, 0.1, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
			["pufferfish_base_detail7"] = { type = "Model", model = "models/gibs/metal_gib5.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pufferfish_grip", pos = Vector(0, 1.75, 0.75), angle = Angle(-5, -90, -90), size = Vector(0.3, 0.2, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
			["pufferfish_bolt"] = { type = "Model", model = "models/gibs/metal_gib5.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.25, 2.5, -5), angle = Angle(30, 90, 10), size = Vector(0.2, 0.3, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
			["pufferfish_grip"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 1, -2.5), angle = Angle(0, 90, -4), size = Vector(0.5, 0.5, 0.065), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
			["pufferfish_magazine"] = { type = "Model", model = "models/hunter/blocks/cube025x05x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(8.1, 0.55, -3.5), angle = Angle(0, 90, 0), size = Vector(0.075, 0.1, 0.25), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_c17/substation_transformer01a", skin = 0, bodygroup = {} },
			["pufferfish_scope1"] = { type = "Model", model = "models/xqm/deg90.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pufferfish_grip", pos = Vector(0.575, 5, -3.875), angle = Angle(15, 90, -135), size = Vector(0.025, 0.05, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
			["pufferfish_scope2"] = { type = "Model", model = "models/hunter/plates/plate1x3x1trap.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pufferfish_grip", pos = Vector(0.08, 4.75, -4.5), angle = Angle(-75, 90, -90), size = Vector(0.003, 0.01, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
			["pufferfish_scope3"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pufferfish_grip", pos = Vector(0, 5.25, -5.15), angle = Angle(0, 0, -75), size = Vector(0.011, 0.011, 0.04), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
			["pufferfish_scope4"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pufferfish_grip", pos = Vector(0, 4.92, -5.07), angle = Angle(0, 0, -75), size = Vector(0.012, 0.012, 0.012), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
			["pufferfish_scope5"] = { type = "Model", model = "models/props_junk/wood_crate001a_chunk05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pufferfish_grip", pos = Vector(0, 4.4, -4.625), angle = Angle(-75, 90, 0), size = Vector(0.015, 0.015, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
			["pufferfish_stock1"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pufferfish_grip", pos = Vector(0, 3.1, -2), angle = Angle(0, 0, -75), size = Vector(0.35, 0.35, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
			["pufferfish_stock2"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pufferfish_grip", pos = Vector(0, 3.1, -2), angle = Angle(0, 0, -75), size = Vector(0.25, 0.25, 0.125), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
			["pufferfish_stock3"] = { type = "Model", model = "models/combine_helicopter/bomb_debris_2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pufferfish_grip", pos = Vector(0, -10.45, 1.65), angle = Angle(-75, 90, 0), size = Vector(0.15, 0.15, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
			["pufferfish_stock4"] = { type = "Model", model = "models/combine_helicopter/bomb_debris_2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pufferfish_grip", pos = Vector(0, -10.45, 1.65), angle = Angle(-75, 90, 0), size = Vector(0.15, 0.15, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} }
		}
	end
	wept.WorldModel = "models/weapons/w_snip_awp.mdl"
	wept.ViewModel = "models/weapons/cstrike/c_snip_sg550.mdl"
	wept.ShowViewModel = false
    wept.ShowWorldModel = false

    wept.Acid = true
    wept.AcidDamage = 9
	wept.AcidChance = 100
	
    wept.Corrosion = true 
    wept.CorrosionDuration = 4
    wept.CorrosionChance = 100

    wept.IronSightsPos = Vector(0, 0, 0)
    wept.IronSightsAng = Vector(0, -1, 0)
end)
branch.Colors = {Color(0, 255, 100), Color(0, 175, 100), Color(0, 100, 100)} -- placeholder colors / name, not sure what chemical weapons should have.. OPEN TO SUGGESTIONS!!!
branch.NewNames = {"Acidic", "Caustic", "Corrosive"}



function SWEP:IsScoped()
	return self:GetIronsights() and self.fIronTime and self.fIronTime + 0.25 <= CurTime()
end

if CLIENT then
	SWEP.IronsightsMultiplier = 0.25

	function SWEP:GetViewModelPosition(pos, ang)
		if GAMEMODE.DisableScopes then return end

		if self:IsScoped() then
			return pos + ang:Up() * 256, ang
		end

		return BaseClass.GetViewModelPosition(self, pos, ang)
	end

	function SWEP:DrawHUDBackground()
		if GAMEMODE.DisableScopes then return end

		if self:IsScoped() then
			self:DrawRegularScope()
		end
	end
end
