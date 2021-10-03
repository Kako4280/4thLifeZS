INC_CLIENT()

SWEP.Slot = 3
SWEP.SlotPos = 0

SWEP.ViewModelFOV = 55
SWEP.ViewModelFlip = false
SWEP.ViewModelBoneMods = {
	["ValveBiped.base"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}

SWEP.VElements = {
	["calico_magazine"] = { type = "Model", model = "models/props_phx/oildrum001.mdl", bone = "ValveBiped.base", rel = "", pos = Vector(-0.051, -1.8, -5.651), angle = Angle(0, 0, 0), size = Vector(0.075, 0.075, 0.202), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	["calico_handguard_detail"] = { type = "Model", model = "models/props_phx/gears/rack18.mdl", bone = "ValveBiped.base", rel = "", pos = Vector(0.349, 0.1, 8), angle = Angle(0, 90, 90), size = Vector(0.125, 0.054, 0.05), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["calico_barrel_detail"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.base", rel = "", pos = Vector(0, 0, 12.5), angle = Angle(0, 0, 0), size = Vector(0.3, 0.3, 0.014), color = Color(40, 40, 45, 255), surpresslightning = false, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["calico_handguard"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "ValveBiped.base", rel = "", pos = Vector(0.6, 0.1, 8.125), angle = Angle(90, 0, 0), size = Vector(0.15, 0.174, 0.125), color = Color(40, 40, 45, 255), surpresslightning = false, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["calico_retractor_stock"] = { type = "Model", model = "models/props_wasteland/panel_leverHandle001a.mdl", bone = "ValveBiped.base", rel = "", pos = Vector(-0.051, -0.301, -3.5), angle = Angle(0, -90, 180), size = Vector(0.25, 0.174, 0.75), color = Color(40, 40, 45, 255), surpresslightning = false, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["calico_barrel"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.base", rel = "", pos = Vector(0, 0, 11.5), angle = Angle(0, 0, 0), size = Vector(0.2, 0.2, 0.009), color = Color(40, 40, 45, 255), surpresslightning = false, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["calico_grip"] = { type = "Model", model = "models/Gibs/helicopter_brokenpiece_03.mdl", bone = "ValveBiped.base", rel = "", pos = Vector(-0.026, 2.5, 7), angle = Angle(-5, -92, -50), size = Vector(0.075, 0.075, 0.075), color = Color(40, 40, 45, 255), surpresslightning = false, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["calico_magazine_frame"] = { type = "Model", model = "models/props_trainstation/mount_connection001a.mdl", bone = "ValveBiped.base", rel = "", pos = Vector(0, -1.75, 4.9), angle = Angle(90, 90, 0), size = Vector(0.05, 0.025, 0.054), color = Color(40, 40, 45, 255), surpresslightning = false, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["calico_magazine_detail"] = { type = "Model", model = "models/props_wasteland/laundry_basket001.mdl", bone = "ValveBiped.base", rel = "", pos = Vector(-0.03, -1.8, -5), angle = Angle(0, 0, 0), size = Vector(0.035, 0.035, 0.035), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	["calico_base"] = { type = "Model", model = "models/weapons/w_pist_glock18.mdl", bone = "ValveBiped.base", rel = "", pos = Vector(0, 5.75, -2), angle = Angle(90, -90, 0), size = Vector(1, 1, 1), color = Color(40, 40, 45, 255), surpresslightning = false, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["calico_ironsight"] = { type = "Model", model = "models/mechanics/articulating/arm_base_b.mdl", bone = "ValveBiped.base", rel = "", pos = Vector(0.3, -2.8, 3.68), angle = Angle(0, 0, -90), size = Vector(0.017, 0.017, 0.009), color = Color(40, 40, 45, 255), surpresslightning = false, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["calico_stock"] = { type = "Model", model = "models/Gibs/helicopter_brokenpiece_03.mdl", bone = "ValveBiped.base", rel = "", pos = Vector(-0.25, 1, -10.5), angle = Angle(5, 80, 25), size = Vector(0.075, 0.075, 0.05), color = Color(40, 40, 45, 255), surpresslightning = false, material = "phoenix_storms/white", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["calico_handguard_detail+"] = { type = "Model", model = "models/props_phx/gears/rack18.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(13, 0.75, -5.45), angle = Angle(102.5, -166, 75), size = Vector(0.125, 0.054, 0.05), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["calico_magazine"] = { type = "Model", model = "models/props_phx/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(8.024, 1.024, -6.25), angle = Angle(78, -1, 0), size = Vector(0.07, 0.07, 0.224), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	["calico_base"] = { type = "Model", model = "models/weapons/w_pist_glock18.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.5, 1, 3.5), angle = Angle(-12, -1, 180), size = Vector(1, 1, 1.2), color = Color(40, 40, 45, 255), surpresslightning = false, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["calico_magazine_frame"] = { type = "Model", model = "models/props_trainstation/mount_connection001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(9.449, 1.049, -6.5), angle = Angle(-12, -1, 0), size = Vector(0.05, 0.025, 0.05), color = Color(40, 40, 45, 255), surpresslightning = false, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["calico_handguard"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(12.949, 0.5, -5.45), angle = Angle(-12, -1, 90), size = Vector(0.15, 0.174, 0.125), color = Color(40, 40, 45, 255), surpresslightning = false, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["calico_retractor_stock"] = { type = "Model", model = "models/props_wasteland/panel_leverHandle001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.5, 0.949, -3.3), angle = Angle(78, -1, 0), size = Vector(0.25, 0.174, 0.75), color = Color(40, 40, 45, 255), surpresslightning = false, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["calico_barrel"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(17.25, 1.22, -6.5), angle = Angle(78, -1, 0), size = Vector(0.2, 0.2, 0.009), color = Color(40, 40, 45, 255), surpresslightning = false, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["calico_grip"] = { type = "Model", model = "models/Gibs/helicopter_brokenpiece_03.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(14, 1.149, -3.5), angle = Angle(85, 45, 85), size = Vector(0.1, 0.075, 0.075), color = Color(40, 40, 45, 255), surpresslightning = false, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["calico_handguard_detail"] = { type = "Model", model = "models/props_phx/gears/rack18.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(13, 1.5, -5.5), angle = Angle(77, 14, 75), size = Vector(0.125, 0.054, 0.05), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["calico_magazine_detail"] = { type = "Model", model = "models/props_wasteland/laundry_basket001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.201, 0.875, -4.5), angle = Angle(102, 179, 0), size = Vector(0.035, 0.035, 0.035), color = Color(80, 80, 80, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	["calico_barrel_detail"] = { type = "Model", model = "models/props_c17/signpole001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(18.75, 1.25, -6.825), angle = Angle(78, -1, 0), size = Vector(0.3, 0.3, 0.014), color = Color(40, 40, 45, 255), surpresslightning = false, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["calico_ironsight"] = { type = "Model", model = "models/mechanics/articulating/arm_base_b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(8.05, 0.74, -7.2), angle = Angle(0, 90, -168), size = Vector(0.017, 0.017, 0.009), color = Color(40, 40, 45, 255), surpresslightning = false, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["calico_stock"] = { type = "Model", model = "models/Gibs/helicopter_brokenpiece_03.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-5.1, 0.8, -0.601), angle = Angle(-100, 25, 50), size = Vector(0.075, 0.075, 0.05), color = Color(40, 40, 45, 255), surpresslightning = false, material = "phoenix_storms/white", skin = 0, bodygroup = {} }
}

local texGradDown = surface.GetTextureID("VGUI/gradient_down")
function SWEP:DrawHUD()
	self.BaseClass.DrawHUD(self)

	local wid, hei = 384, 16
	local x, y = ScrW() - wid - 32, ScrH() - hei - 72
	local texty = y - 4 - draw.GetFontHeight("ZSHUDFontSmall")

	local timeleft = self.Special - CurTime()

	if timeleft > 0 then

	surface.SetDrawColor(5, 5, 5, 180)
	surface.DrawRect(x, y, wid, hei)

	surface.SetDrawColor(255, 30, 10, 220)
	surface.SetTexture(texGradDown)
	surface.DrawTexturedRect(x, y, timeleft * wid / 30, hei)

	surface.SetDrawColor(255, 30, 10, 220)
	surface.DrawOutlinedRect(x, y, wid, hei)

	draw.SimpleText("Weapon special time left: "..math.floor(timeleft), "ZSHUDFontSmall", x, texty, COLOR_WHITE, TEXT_ALIGN_LEFT)

	elseif timeleft <= 0 then
	    draw.SimpleText("Weapon special is ready", "ZSHUDFontSmall", x, texty, COLOR_WHITE, TEXT_ALIGN_LEFT)
	end
end