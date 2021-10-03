AddCSLuaFile()

SWEP.PrintName = "'Plague' Chemical Shotgun"
SWEP.Description = "a"

SWEP.Slot = 3
SWEP.SlotPos = 0

if CLIENT then

    SWEP.ViewModelFOV = 65
    SWEP.ViewModelFlip = false
    SWEP.ViewModelBoneMods = {}

    SWEP.HUD3DBone = "v_weapon.M3_PARENT"
	SWEP.HUD3DPos = Vector(-2, -4, -3)
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DScale = 0.015

    SWEP.VElements = {
        ["plague_barrel1"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360x2.mdl", bone = "v_weapon.M3_PARENT", rel = "plague_base", pos = Vector(0, -0.6, -15), angle = Angle(0, 0, 0), size = Vector(0.01, 0.01, 0.158), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
        ["plague_barrel2"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360x2.mdl", bone = "v_weapon.M3_PARENT", rel = "plague_base", pos = Vector(0, 0.7, -13.8), angle = Angle(0, 35, 0), size = Vector(0.01, 0.01, 0.145), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
        ["plague_barrel_detail1"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "v_weapon.M3_PARENT", rel = "plague_base", pos = Vector(0, -0.6, -12.75), angle = Angle(0, 0, 0), size = Vector(0.011, 0.011, 0.22), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
        ["plague_barrel_detail2"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "v_weapon.M3_PARENT", rel = "plague_base", pos = Vector(0, 0.7, -12.75), angle = Angle(0, 0, 0), size = Vector(0.011, 0.011, 0.22), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
        ["plague_barrel_detail3"] = { type = "Model", model = "models/hunter/blocks/cube025x2x025.mdl", bone = "v_weapon.M3_PARENT", rel = "plague_base", pos = Vector(0.065, 0.05, -12.925), angle = Angle(0, 0, 0), size = Vector(0.01, 0.005, 0.03), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
        ["plague_base"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360.mdl", bone = "v_weapon.M3_PARENT", rel = "", pos = Vector(0, -4, -9), angle = Angle(0, 0, 0), size = Vector(0.03, 0.03, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
        ["plague_base_detail1"] = { type = "Model", model = "models/props_wasteland/laundry_basket001.mdl", bone = "v_weapon.M3_PARENT", rel = "plague_base", pos = Vector(0, 0, 6), angle = Angle(180, 45, 0), size = Vector(0.054, 0.054, 0.054), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
        ["plague_base_detail2"] = { type = "Model", model = "models/props_wasteland/laundry_washer001a.mdl", bone = "v_weapon.M3_PARENT", rel = "plague_base", pos = Vector(-0.05, -0.175, 1), angle = Angle(180, 12, 0), size = Vector(0.035, 0.035, 0.035), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
        ["plague_base_detail3"] = { type = "Model", model = "models/hunter/misc/roundthing2.mdl", bone = "v_weapon.M3_PARENT", rel = "plague_base", pos = Vector(0, 0.75, 3.5), angle = Angle(0, 0, 90), size = Vector(0.015, 0.015, 0.015), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/GutterMetal01a", skin = 0, bodygroup = {} },
        ["plague_base_detail4"] = { type = "Model", model = "models/props_wasteland/horizontalcoolingtank04.mdl", bone = "v_weapon.M3_PARENT", rel = "plague_base", pos = Vector(1.2, -1.45, 3.5), angle = Angle(90, 140, 90), size = Vector(0.01, 0.01, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
        ["plague_grip"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "v_weapon.M3_PARENT", rel = "", pos = Vector(0, -2.75, 0.4), angle = Angle(0, 0, 70), size = Vector(0.5, 0.5, 0.065), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
        ["plague_grip2"] = { type = "Model", model = "models/gibs/metal_gib5.mdl", bone = "v_weapon.M3_PARENT", rel = "plague_base", pos = Vector(0, 1.65, 8.65), angle = Angle(-68, -90, 90), size = Vector(0.5, 0.2, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
        ["plague_grip3"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "v_weapon.M3_PARENT", rel = "plague_base", pos = Vector(0, 0.7, 6.5), angle = Angle(0, 0, 0), size = Vector(0.3, 0.3, 0.02), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
        ["plague_pump"] = { type = "Model", model = "models/props_junk/metalgascan.mdl", bone = "v_weapon.M3_PUMP", rel = "", pos = Vector(0, 0.25, -5), angle = Angle(0, 0, 0), size = Vector(0.14, 0.125, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_c17/substation_transformer01a", skin = 0, bodygroup = {} },
        ["plague_shell"] = { type = "Model", model = "models/props_borealis/bluebarrel001.mdl", bone = "v_weapon.M3_SHELL", rel = "", pos = Vector(0, -0.05, -1), angle = Angle(0, 0, 0), size = Vector(0.035, 0.035, 0.045), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_c17/substation_transformer01a", skin = 0, bodygroup = {} },
        ["plague_stock1"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "v_weapon.M3_PARENT", rel = "plague_base", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.25, 0.25, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
        ["plague_stock2"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "v_weapon.M3_PARENT", rel = "plague_base", pos = Vector(0, 0.2, 17), angle = Angle(0, 0, 45), size = Vector(0.25, 0.25, 0.025), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
        ["plague_stock3"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "v_weapon.M3_PARENT", rel = "plague_base", pos = Vector(0, 0.725, 14.5), angle = Angle(0, 0, 45), size = Vector(0.25, 0.25, 0.035), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
        ["plague_stock_detail1"] = { type = "Model", model = "models/gibs/metal_gib5.mdl", bone = "v_weapon.M3_PARENT", rel = "plague_base", pos = Vector(0, 0.5, 15.75), angle = Angle(0, -90, -90), size = Vector(0.3, 0.3, 0.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
        ["plague_stock_detail2"] = { type = "Model", model = "models/gibs/metal_gib5.mdl", bone = "v_weapon.M3_PARENT", rel = "plague_base", pos = Vector(0, 2.55, 17.05), angle = Angle(45, 90, -90), size = Vector(0.3, 0.3, 0.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
        ["plague_stock_detail3"] = { type = "Model", model = "models/gibs/metal_gib5.mdl", bone = "v_weapon.M3_PARENT", rel = "plague_base", pos = Vector(0, 1.95, 18), angle = Angle(-135, 90, 90), size = Vector(0.3, 0.3, 0.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
        ["plague_stock_detail4"] = { type = "Model", model = "models/gibs/metal_gib5.mdl", bone = "v_weapon.M3_PARENT", rel = "plague_base", pos = Vector(0, 0.79, 13.04), angle = Angle(180, 90, 90), size = Vector(0.3, 0.3, 0.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
        ["plague_trigger"] = { type = "Model", model = "models/gibs/metal_gib5.mdl", bone = "v_weapon.M3_PARENT", rel = "plague_base", pos = Vector(0, 1.75, 7.65), angle = Angle(-90, 0, 0), size = Vector(0.3, 0.15, 0.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
    }
    
    SWEP.WElements = {
        ["plague_barrel1"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "plague_base", pos = Vector(0, -0.6, -15), angle = Angle(0, 0, 0), size = Vector(0.01, 0.01, 0.158), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
        ["plague_barrel2"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "plague_base", pos = Vector(0, 0.7, -13.8), angle = Angle(0, 35, 0), size = Vector(0.01, 0.01, 0.145), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
        ["plague_barrel_detail1"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "plague_base", pos = Vector(0, -0.6, -12.75), angle = Angle(0, 0, 0), size = Vector(0.011, 0.011, 0.22), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
        ["plague_barrel_detail2"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "plague_base", pos = Vector(0, 0.7, -12.75), angle = Angle(0, 0, 0), size = Vector(0.011, 0.011, 0.22), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
        ["plague_barrel_detail3"] = { type = "Model", model = "models/hunter/blocks/cube025x2x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "plague_base", pos = Vector(0.065, 0.05, -12.925), angle = Angle(0, 0, 0), size = Vector(0.01, 0.005, 0.03), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
        ["plague_base"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(13, 0.75, -4.95), angle = Angle(0, 90, -80), size = Vector(0.03, 0.03, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
        ["plague_base_detail1"] = { type = "Model", model = "models/props_wasteland/laundry_basket001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "plague_base", pos = Vector(0, 0, 6), angle = Angle(180, 45, 0), size = Vector(0.054, 0.054, 0.054), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
        ["plague_base_detail2"] = { type = "Model", model = "models/props_wasteland/laundry_washer001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "plague_base", pos = Vector(-0.05, -0.175, 1), angle = Angle(180, 12, 0), size = Vector(0.035, 0.035, 0.035), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal004a", skin = 0, bodygroup = {} },
        ["plague_base_detail3"] = { type = "Model", model = "models/hunter/misc/roundthing2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "plague_base", pos = Vector(0, 0.75, 3.5), angle = Angle(0, 0, 90), size = Vector(0.015, 0.015, 0.015), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/GutterMetal01a", skin = 0, bodygroup = {} },
        ["plague_base_detail4"] = { type = "Model", model = "models/props_wasteland/horizontalcoolingtank04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "plague_base", pos = Vector(1.2, -1.45, 3.5), angle = Angle(90, 140, 90), size = Vector(0.01, 0.01, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
        ["plague_grip"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.85, 0.75, -1.75), angle = Angle(10, 0, 0), size = Vector(0.5, 0.5, 0.065), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
        ["plague_grip2"] = { type = "Model", model = "models/gibs/metal_gib5.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "plague_base", pos = Vector(0, 1.65, 8.65), angle = Angle(-68, -90, 90), size = Vector(0.5, 0.2, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
        ["plague_grip3"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "plague_base", pos = Vector(0, 0.7, 6.5), angle = Angle(0, 0, 0), size = Vector(0.3, 0.3, 0.02), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
        ["plague_pump"] = { type = "Model", model = "models/props_junk/metalgascan.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(20, 0.75, -5.25), angle = Angle(0, 90, -80), size = Vector(0.14, 0.125, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_c17/substation_transformer01a", skin = 0, bodygroup = {} },
        ["plague_stock1"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "plague_base", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.25, 0.25, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
        ["plague_stock2"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "plague_base", pos = Vector(0, 0.2, 17), angle = Angle(0, 0, 45), size = Vector(0.25, 0.25, 0.025), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
        ["plague_stock3"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "plague_base", pos = Vector(0, 0.725, 14.5), angle = Angle(0, 0, 45), size = Vector(0.25, 0.25, 0.035), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_trainstation/trainstation_ornament001.mdl", skin = 0, bodygroup = {} },
        ["plague_stock_detail1"] = { type = "Model", model = "models/gibs/metal_gib5.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "plague_base", pos = Vector(0, 0.5, 15.75), angle = Angle(0, -90, -90), size = Vector(0.3, 0.3, 0.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
        ["plague_stock_detail2"] = { type = "Model", model = "models/gibs/metal_gib5.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "plague_base", pos = Vector(0, 2.55, 17.05), angle = Angle(45, 90, -90), size = Vector(0.3, 0.3, 0.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
        ["plague_stock_detail3"] = { type = "Model", model = "models/gibs/metal_gib5.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "plague_base", pos = Vector(0, 1.95, 18), angle = Angle(-135, 90, 90), size = Vector(0.3, 0.3, 0.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
        ["plague_stock_detail4"] = { type = "Model", model = "models/gibs/metal_gib5.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "plague_base", pos = Vector(0, 0.79, 13.04), angle = Angle(180, 90, 90), size = Vector(0.3, 0.3, 0.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
        ["plague_trigger"] = { type = "Model", model = "models/gibs/metal_gib5.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "plague_base", pos = Vector(0, 1.75, 7.65), angle = Angle(-75, -90, -90), size = Vector(0.3, 0.15, 0.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
    }
end

SWEP.Base = "weapon_zs_baseshotgun"

SWEP.HoldType = "shotgun"

SWEP.ViewModel = "models/weapons/cstrike/c_shot_m3super90.mdl"
SWEP.WorldModel = "models/weapons/w_shot_m3super90.mdl"
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false
SWEP.UseHands = true

SWEP.Primary.Damage = 9
SWEP.Primary.NumShots = 7
SWEP.Primary.Delay = 0.74

SWEP.Primary.ClipSize = 12
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "chemical"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.ReloadDelay = 0.45

SWEP.RequiredClip = 2

SWEP.ConeMax = 5
SWEP.ConeMin = 3.75

SWEP.FireAnimSpeed = 1.2
SWEP.WalkSpeed = SPEED_SLOWER

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MAX_SPREAD, -0.8125)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MIN_SPREAD, -0.625)
