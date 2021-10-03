INC_CLIENT()

if CLIENT then

	SWEP.VElements = {
		["pulse_grenade"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.4, 2.75, -2), angle = Angle(0, 45, 0), size = Vector(0.035, 0.035, 0.08), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
		["pulse_grenade_bottom"] = { type = "Model", model = "models/mechanics/wheels/wheel_speed_72.mdl", bone = "ValveBiped.Grenade_body", rel = "pulse_grenade", pos = Vector(0, 0, 3.6), angle = Angle(180, 0, 0), size = Vector(0.05, 0.05, 0.05), color = Color(100, 100, 100, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["pulse_grenade_bottom_detail"] = { type = "Model", model = "models/mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pulse_grenade", pos = Vector(0, 0, 4.3), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 0.05), color = Color(100, 100, 100, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["pulse_grenade_top"] = { type = "Model", model = "models/mechanics/wheels/wheel_speed_72.mdl", bone = "ValveBiped.Grenade_body", rel = "pulse_grenade", pos = Vector(0, 0, -0.25), angle = Angle(180, 0, 0), size = Vector(0.05, 0.05, 0.05), color = Color(100, 100, 100, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["pulse_grenade_top_detail"] = { type = "Model", model = "models/mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Grenade_body", rel = "pulse_grenade", pos = Vector(0, 0, -1), angle = Angle(180, 0, 0), size = Vector(0.06, 0.06, 0.06), color = Color(100, 100, 100, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["pulse_grenade"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.4, 2, -2), angle = Angle(0, 45, 0), size = Vector(0.035, 0.035, 0.08), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/grey_steel", skin = 0, bodygroup = {} },
		["pulse_grenade_bottom"] = { type = "Model", model = "models/mechanics/wheels/wheel_speed_72.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pulse_grenade", pos = Vector(0, 0, 3.6), angle = Angle(180, 0, 0), size = Vector(0.05, 0.05, 0.05), color = Color(100, 100, 100, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["pulse_grenade_bottom_detail"] = { type = "Model", model = "models/mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pulse_grenade", pos = Vector(0, 0, 4.3), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 0.05), color = Color(100, 100, 100, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["pulse_grenade_top"] = { type = "Model", model = "models/mechanics/wheels/wheel_speed_72.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pulse_grenade", pos = Vector(0, 0, -0.25), angle = Angle(180, 0, 0), size = Vector(0.05, 0.05, 0.05), color = Color(100, 100, 100, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["pulse_grenade_top_detail"] = { type = "Model", model = "models/mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pulse_grenade", pos = Vector(0, 0, -1), angle = Angle(180, 0, 0), size = Vector(0.06, 0.06, 0.06), color = Color(100, 100, 100, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
end
