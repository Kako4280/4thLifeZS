AddCSLuaFile()
DEFINE_BASECLASS("weapon_zs_base")

SWEP.PrintName = "'Renegade' Rifle"
SWEP.Description = "A rifle with high headshot damage and a decent clip size. Receives a resistance penetration buff if you score enough headshot kills with it."

SWEP.Slot = 3
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 63.70351758794

	SWEP.HUD3DBone = "v_weapon.sg550_Parent"
	SWEP.HUD3DPos = Vector(-2.1, -5.2, -2) -- Vector(-2, -5.2, -2)
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DScale = 0.02

	SWEP.VElements = {
		["kickstand_hold"] = { type = "Model", model = "models/Mechanics/robotics/a1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "canister_front", pos = Vector(-0.242, 0, 4.394), angle = Angle(0, 90, 90), size = Vector(0.254, 0.144, 0.144), color = Color(75, 75, 75, 255), surpresslightning = false, material = "models/props_c17/metalladder001", skin = 0, bodygroup = {} },
		["scopebase"] = { type = "Model", model = "models/Mechanics/roboticslarge/g1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "scope", pos = Vector(-2.064, 0, -0.262), angle = Angle(0, 0, 90), size = Vector(0.061, 0.037, 0.129), color = Color(115, 115, 115, 255), surpresslightning = false, material = "models/weapons/v_stunbaton/w_shaft01a", skin = 0, bodygroup = {} },
		["kickstand"] = { type = "Model", model = "models/props_c17/metalladder002b.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "barrel", pos = Vector(-6.031, 0, 25.576), angle = Angle(135, 0, 180), size = Vector(0.164, 0.245, 0.368), color = Color(75, 75, 75, 255), surpresslightning = false, material = "models/props_c17/metalladder001", skin = 0, bodygroup = {} },
		["clip"] = { type = "Model", model = "models/props_c17/consolebox01a.mdl", bone = "v_weapon.sg550_Clip", rel = "", pos = Vector(0.902, 3.177, 0.266), angle = Angle(0, 90, -90), size = Vector(0.104, 0.134, 0.15), color = Color(115, 115, 115, 255), surpresslightning = false, material = "models/weapons/v_stunbaton/w_shaft01a", skin = 0, bodygroup = {} },
		["canister_front"] = { type = "Model", model = "models/props_c17/canister_propane01a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "scope", pos = Vector(0.779, 0, -1.066), angle = Angle(-90, 0, 0), size = Vector(0.1, 0.1, 0.15), color = Color(115, 115, 115, 255), surpresslightning = false, material = "models/weapons/v_stunbaton/w_shaft01a", skin = 0, bodygroup = {} },
		["scope"] = { type = "Model", model = "models/props_lab/citizenradio.mdl", bone = "v_weapon.sg550_Parent", rel = "", pos = Vector(0, -6.222, -4.554), angle = Angle(-90, 90, 0), size = Vector(0.731, 0.127, 0.182), color = Color(75, 65, 55, 255), surpresslightning = false, material = "models/props_combine/metal_combinebridge001", skin = 0, bodygroup = {} },
		["bottom_grip"] = { type = "Model", model = "models/weapons/w_pist_elite_single.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "bottom", pos = Vector(0, -2.5, -6.072), angle = Angle(0, -90, 0), size = Vector(0.882, 0.865, 0.992), color = Color(115, 115, 115, 255), surpresslightning = false, material = "models/weapons/v_stunbaton/w_shaft01a", skin = 0, bodygroup = {} },
		["barrel"] = { type = "Model", model = "models/props_rooftop/roof_vent001.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "canister_front", pos = Vector(0, 0, 36.013), angle = Angle(180, 0, 0), size = Vector(0.173, 0.36, 0.727), color = Color(115, 115, 115, 255), surpresslightning = false, material = "models/weapons/v_stunbaton/w_shaft01a", skin = 0, bodygroup = {} },
		["thing_that_moves_back_when_you_shoot"] = { type = "Model", model = "models/props_rooftop/roof_vent001.mdl", bone = "v_weapon.sg550_Chamber", rel = "", pos = Vector(-0.077, 1.86, -2.192), angle = Angle(90, 0, 0), size = Vector(0.18, 0.18, 0.063), color = Color(75, 75, 75, 255), surpresslightning = false, material = "models/props_c17/metalladder001", skin = 0, bodygroup = {} },
		["blackbars"] = { type = "Model", model = "models/props_c17/playground_teetertoter_stan.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "canister_front", pos = Vector(0, 0, 4.34), angle = Angle(0, -90, 90), size = Vector(0.179, 0.5, 0.25), color = Color(115, 115, 115, 255), surpresslightning = false, material = "models/weapons/v_stunbaton/w_shaft01a", skin = 0, bodygroup = {} },
		["scope_screen"] = { type = "Model", model = "models/props_junk/cardboard_box001a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "scope", pos = Vector(-3.105, 0, 1.746), angle = Angle(0, -90, 0), size = Vector(0.078, 0.116, 0.064), color = Color(115, 115, 115, 255), surpresslightning = false, material = "models/props_combine/masterinterface_alert", skin = 0, bodygroup = {} },
		["bottom_back"] = { type = "Model", model = "models/props_c17/furniturefridge001a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "bottom", pos = Vector(0, -12.132, 0.768), angle = Angle(0, -90, 0), size = Vector(0.057, 0.133, 0.052), color = Color(65, 65, 65, 255), surpresslightning = false, material = "models/weapons/v_stunbaton/w_shaft01a", skin = 0, bodygroup = {} },
		["bottom"] = { type = "Model", model = "models/props_trainstation/train003.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "barrel", pos = Vector(-1.348, 0, 39.881), angle = Angle(0, 90, 90), size = Vector(0.027, 0.048, 0.019), color = Color(75, 85, 95, 255), surpresslightning = false, material = "models/props_pipes/valve001_skin2", skin = 0, bodygroup = {} }
	}

	SWEP.WElements = {
		["kickstand_hold"] = { type = "Model", model = "models/Mechanics/robotics/a1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "canister_front", pos = Vector(-0.242, 0, 4.394), angle = Angle(0, 90, 90), size = Vector(0.254, 0.144, 0.144), color = Color(75, 75, 75, 255), surpresslightning = false, material = "models/props_c17/metalladder001", skin = 0, bodygroup = {} },
		["scopebase"] = { type = "Model", model = "models/Mechanics/roboticslarge/g1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "scope", pos = Vector(-2.064, 0, -0.262), angle = Angle(0, 0, 90), size = Vector(0.061, 0.037, 0.129), color = Color(115, 115, 115, 255), surpresslightning = false, material = "models/weapons/v_stunbaton/w_shaft01a", skin = 0, bodygroup = {} },
		["kickstand"] = { type = "Model", model = "models/props_c17/metalladder002b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "barrel", pos = Vector(-6.031, 0, 19.576), angle = Angle(135, 0, 180), size = Vector(0.164, 0.245, 0.368), color = Color(75, 75, 75, 255), surpresslightning = false, material = "models/props_c17/metalladder001", skin = 0, bodygroup = {} },
		["clip"] = { type = "Model", model = "models/props_c17/consolebox01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "bottom", pos = Vector(0.758, 4.119, -3.109), angle = Angle(90, 0, 0), size = Vector(0.104, 0.134, 0.15), color = Color(115, 115, 115, 255), surpresslightning = false, material = "models/weapons/v_stunbaton/w_shaft01a", skin = 0, bodygroup = {} },
		["canister_front"] = { type = "Model", model = "models/props_c17/canister_propane01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "scope", pos = Vector(0.779, 0, -1.066), angle = Angle(-90, 0, 0), size = Vector(0.1, 0.1, 0.15), color = Color(115, 115, 115, 255), surpresslightning = false, material = "models/weapons/v_stunbaton/w_shaft01a", skin = 0, bodygroup = {} },
		["scope"] = { type = "Model", model = "models/props_lab/citizenradio.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(8.354, 1.194, -6.069), angle = Angle(-171.883, 180, 0), size = Vector(0.731, 0.127, 0.182), color = Color(75, 65, 55, 255), surpresslightning = false, material = "models/props_combine/metal_combinebridge001", skin = 0, bodygroup = {} },
		["bottom_grip"] = { type = "Model", model = "models/weapons/w_pist_elite_single.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "bottom", pos = Vector(0, -2.5, -6.072), angle = Angle(0, -90, 0), size = Vector(0.882, 0.865, 0.992), color = Color(115, 115, 115, 255), surpresslightning = false, material = "models/weapons/v_stunbaton/w_shaft01a", skin = 0, bodygroup = {} },
		["barrel"] = { type = "Model", model = "models/props_rooftop/roof_vent001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "canister_front", pos = Vector(0, 0, 29.892), angle = Angle(180, 0, 0), size = Vector(0.173, 0.36, 0.579), color = Color(115, 115, 115, 255), surpresslightning = false, material = "models/weapons/v_stunbaton/w_shaft01a", skin = 0, bodygroup = {} },
		["thing_that_moves_back_when_you_shoot"] = { type = "Model", model = "models/props_rooftop/roof_vent001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "bottom", pos = Vector(0.153, 5.056, 0.425), angle = Angle(-90, 0, 0), size = Vector(0.18, 0.18, 0.063), color = Color(75, 75, 75, 255), surpresslightning = false, material = "models/props_c17/metalladder001", skin = 0, bodygroup = {} },
		["bottom"] = { type = "Model", model = "models/props_trainstation/train003.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "barrel", pos = Vector(-1.348, 0, 33.347), angle = Angle(0, 90, 90), size = Vector(0.027, 0.048, 0.019), color = Color(75, 85, 95, 255), surpresslightning = false, material = "models/props_pipes/valve001_skin2", skin = 0, bodygroup = {} },
		["bottom_back"] = { type = "Model", model = "models/props_c17/furniturefridge001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "bottom", pos = Vector(0, -12.132, 0.768), angle = Angle(0, -90, 0), size = Vector(0.057, 0.133, 0.052), color = Color(65, 65, 65, 255), surpresslightning = false, material = "models/weapons/v_stunbaton/w_shaft01a", skin = 0, bodygroup = {} },
		["scope_screen"] = { type = "Model", model = "models/props_junk/cardboard_box001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "scope", pos = Vector(-3.105, 0, 1.746), angle = Angle(0, -90, 0), size = Vector(0.078, 0.116, 0.064), color = Color(115, 115, 115, 255), surpresslightning = false, material = "models/props_combine/masterinterface_alert", skin = 0, bodygroup = {} },
		["blackbars"] = { type = "Model", model = "models/props_c17/playground_teetertoter_stan.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "canister_front", pos = Vector(0, 0, 4.34), angle = Angle(0, -90, 90), size = Vector(0.179, 0.5, 0.25), color = Color(115, 115, 115, 255), surpresslightning = false, material = "models/weapons/v_stunbaton/w_shaft01a", skin = 0, bodygroup = {} }
	}

	SWEP.HarvesterCap = 0.55 -- Maximum damage multiplier

end

sound.Add(
{
	name = "Weapon_Renegade.Single",
	channel = CHAN_AUTO,
	volume = 0.7,
	soundlevel = 80,
	pitchstart = 55,
	pitchend = 60,
	sound = {"weapons/zs_scar/scar_fire1.ogg"}
})

SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "ar2"

SWEP.ViewModel = "models/weapons/cstrike/c_snip_sg550.mdl"
SWEP.WorldModel = "models/weapons/w_snip_sg550.mdl"
SWEP.UseHands = true

SWEP.Primary.Sound = Sound("Weapon_Renegade.Single")
SWEP.Primary.Damage = 120
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.84

SWEP.Primary.ClipSize = 10
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "357"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.Primary.Gesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW
SWEP.ReloadGesture = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN

SWEP.ConeMax = 6
SWEP.ConeMin = 0
SWEP.HeadshotMulti = 2.45

SWEP.IronSightsPos = Vector(11, -9, -2.2)
SWEP.IronSightsAng = Vector(0, 0, 0)

SWEP.WalkSpeed = SPEED_SLOWEST

SWEP.Tier = 5

SWEP.FireAnimSpeed = 0.5

SWEP.HarvesterCap = 0.5 -- Maximum damage multiplier

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.05, 1)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, "'Harvester' Rifle", "Gains a permenant damage bonus on a lethal headshot. No longer gains penetration buffs.", function(wept)

	wept.PrimaryAttack = function(self)
		if not self:CanPrimaryAttack() then return end
		local dmgmult = 1 + self:GetDmgBonus() -- Have a limit so the damage does not become broken
		local totdmg = self.Primary.Damage * dmgmult -- Total damage from the headshot bonuses

		self:SetNextPrimaryFire(CurTime() + self:GetFireDelay())

		self:EmitFireSound()
		self:TakeAmmo()
		self:ShootBullets(totdmg, self.Primary.NumShots, self:GetCone())
		self.IdleAnimation = CurTime() + self:SequenceDuration()
	end

	-- Remove renegade stack gains, replace with damage bonus from lethal headshots
	wept.OnZombieKilled = function(self, zombie)
		local killer = self:GetOwner()

		if killer:IsValid() and zombie:WasHitInHead() then -- hitent.Revive:IsValid() instead of zombie:WasHitInHead() to gain bonus on knockdown kill
			self:SetDmgBonus( self:GetDmgBonus() + 0.01 )
		end
	end

	if CLIENT then

		wept.SetDmgBonus = function(self, bonus)
			self:SetDTFloat(9, math.min( bonus , self.HarvesterCap ) )
		end

		wept.GetDmgBonus = function(self)
			return self:GetDTFloat(9)
		end

		local colBG = Color(16, 16, 16, 90)
		local colRed = Color(220, 0, 0, 230)
		local colYellow = Color(220, 220, 0, 230)
		local colWhite = Color(220, 220, 220, 230)
		local colAmmo = Color(255, 255, 255, 230)
		

		wept.Draw3DHUD = function(self, vm, pos, ang)
			local wid, hei = 180, 200
			local x, y = wid * -0.6, hei * -0.5
			local clip = self:Clip1()
			local spare = self:GetOwner():GetAmmoCount(self:GetPrimaryAmmoType())
			local maxclip = self.Primary.ClipSize

			local dclip, dspare, dmaxclip = self:GetDisplayAmmo(clip, spare, maxclip)

			cam.Start3D2D(pos, ang, self.HUD3DScale / 2)
				draw.RoundedBoxEx(32, x, y, wid, hei, colBG, true, false, true, false)

				-- Draw bonus counter
				local dmgmult = 1 + math.Round( self:GetDmgBonus(), 2 )

				local texty = y - 4 - draw.GetFontHeight("ZS3D2DFontSmall")

				draw.SimpleText( ( "Multiplier: " .. dmgmult ) , "ZS3D2DFontSmall", (x + (wid / 2) + 10), ( texty - 320 ), Color( 255, 40, 40, 255 ), TEXT_ALIGN_CENTRE)

				-- Rest of the HUD
				local displayspare = dmaxclip > 0 and self.Primary.DefaultClip ~= 99999
				if displayspare then
					draw.SimpleTextBlurry(dspare, dspare >= 1000 and "ZS3D2DFontSmall" or "ZS3D2DFont", x + wid * 0.5, y + hei * 0.75, dspare == 0 and colRed or dspare <= dmaxclip and colYellow or colWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				end

				local sat = clip / maxclip
				local AmmoColor = Color(255,255,255,230)
				AmmoColor.r = 255
				AmmoColor.g = sat ^ 0.3 * 255
				AmmoColor.b = sat * 255

				draw.SimpleTextBlurry(dclip, dclip >= 100 and "ZS3D2DFont" or "ZS3D2DFontBig", x + wid * 0.5, y + hei * (displayspare and 0.3 or 0.5), AmmoColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

			cam.End3D2D()
		end

		wept.Draw2DHUD = function(self)
			local screenscale = BetterScreenScale()

			local wid, hei = 180 * screenscale, 64 * screenscale
			local x, y = ScrW() - wid - screenscale * 128, ScrH() - hei - screenscale * 72
			local clip = self:Clip1()
			local spare = self:GetOwner():GetAmmoCount(self:GetPrimaryAmmoType())
			local maxclip = self.Primary.ClipSize

			local dclip, dspare, dmaxclip = self:GetDisplayAmmo(clip, spare, maxclip)

			draw.RoundedBox(16, x, y, wid, hei, colBG)

			-- Draw bonus counter
			local dmgmult = 1 + math.Round( self:GetDmgBonus(), 2 )

			local texty = y - 2 - draw.GetFontHeight("ZSHUDFont")

			draw.SimpleText( ( "Multiplier: " .. dmgmult ) , "ZSHUDFont", (x + (wid / 2) - 83), texty, Color( 255, 40, 40, 255 ), TEXT_ALIGN_CENTRE)

			-- Rest of the HUD
			local displayspare = dmaxclip > 0 and self.Primary.DefaultClip ~= 99999
			if displayspare then
				draw.SimpleTextBlurry(dspare, dspare >= 1000 and "ZSHUDFontSmall" or "ZSHUDFont", x + wid * 0.75, y + hei * 0.5, dspare == 0 and colRed or dspare <= dmaxclip and colYellow or colWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end

			local sat = clip / maxclip
			local AmmoColor = Color(255,255,255,230)
			AmmoColor.r = 255
			AmmoColor.g = sat ^ 0.3 * 255
			AmmoColor.b = sat * 255

			draw.SimpleTextBlurry(dclip, dclip >= 100 and "ZSHUDFont" or "ZSHUDFontBig", x + wid * (displayspare and 0.25 or 0.5), y + hei * 0.5, AmmoColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	end
end)

function SWEP:Deploy()
	local owner = self:GetOwner()
	if not self.PostOwner then
		self.PostOwner = owner
	end
	self:SetDmgBonus( owner.HarvesterStacks or 0 )
	return self.BaseClass.Deploy(self)
end

function SWEP:Holster()
	local owner = self:GetOwner()
	owner.HarvesterStacks = self:GetDmgBonus() or 0
	return self.BaseClass.Holster(self)
end

function SWEP:SetDmgBonus(bonus)
	self:SetDTFloat(9, math.min( bonus , self.HarvesterCap ) )
end

function SWEP:GetDmgBonus()
	return self:GetDTFloat(9)
end

function SWEP:EmitFireSound()
	self:EmitSound(self.Primary.Sound)
	self:EmitSound("npc/sniper/sniper1.wav", 80, 125, 0.85, CHAN_AUTO)
	self:EmitSound("weapons/sg552/sg552-1.wav", 80, 145, 0.75, CHAN_WEAPON + 20)
end

function SWEP:IsScoped()
	return self:GetIronsights() and self.fIronTime and self.fIronTime + 0.25 <= CurTime()
end

function SWEP:OnZombieKilled(zombie)
	local killer = self:GetOwner()

	if killer:IsValid() and zombie:WasHitInHead() then
		killer.RenegadeHeadshots = (killer.RenegadeHeadshots or 0) + 1

		if killer.RenegadeHeadshots >= 3 then
			killer:GiveStatus("renegade", 17)
			killer.RenegadeHeadshots = 0
		end
	end
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
			self:DrawFuturisticScope()
		end
	end
end
