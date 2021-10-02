INC_CLIENT()


	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 60

	SWEP.ViewModelBoneMods = {
		["ValveBiped.Grenade_body"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
	}

	SWEP.VElements = {
		["delta2"] = { type = "Model", model = "models/props_pipes/pipecluster08d_extender64.mdl", bone = "ValveBiped.Grenade_body", rel = "", pos = Vector(0, 0, -1.201), angle = Angle(0, 0, 0), size = Vector(0.085, 0.085, 0.085), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["delta1"] = { type = "Model", model = "models/props_wasteland/laundry_basket002.mdl", bone = "ValveBiped.Grenade_body", rel = "", pos = Vector(0, 0, -0.5), angle = Angle(0, 0, 0), size = Vector(0.079, 0.079, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}

	SWEP.WElements = {
		["delta3"] = { type = "Model", model = "models/props_c17/furnituretable001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.799, 2.2, 2), angle = Angle(10, 0, 0), size = Vector(0.07, 0.07, 0.07), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["delta1"] = { type = "Model", model = "models/props_wasteland/laundry_basket002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.2, 2.2, 0), angle = Angle(10, 0, 0), size = Vector(0.07, 0.07, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["delta2"] = { type = "Model", model = "models/props_pipes/pipecluster08d_extender64.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.369, 2.2, -0.9), angle = Angle(10, 0, 0), size = Vector(0.079, 0.079, 0.079), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} }
	}