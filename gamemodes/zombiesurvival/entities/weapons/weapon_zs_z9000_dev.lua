AddCSLuaFile()

SWEP.PrintName = "'Z9000' Pulse Pistol"
SWEP.Description = "Although the Z9000 does not deal that much damage, the pulse shots it fires will slow targets."
SWEP.Slot = 1
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 60

	SWEP.HUD3DBone = "ValveBiped.square"
	SWEP.HUD3DPos = Vector(1.1, 0.25, -2)
	SWEP.HUD3DScale = 0.015

	SWEP.ShowViewModel = false

	SWEP.VElements = {
		["base"] = { type = "Model", model = "models/weapons/w_alyx_gun.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7, 2, -4.092), angle = Angle(170, 10, 10), size = Vector(1.1, 1.1, 1.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "pistol"

SWEP.ViewModel = "models/weapons/c_pistol.mdl"
SWEP.WorldModel = "models/weapons/w_alyx_gun.mdl"
SWEP.UseHands = true

SWEP.CSMuzzleFlashes = false

SWEP.ReloadSound = Sound("weapons/alyx_gun/alyx_shotgun_cock1.wav")
SWEP.Primary.Sound = Sound("weapons/alyx_gun/alyx_gun_fire3.wav")
SWEP.Primary.Damage = 18.5
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.16

SWEP.Primary.ClipSize = 16
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pulse"
SWEP.Primary.DefaultClip = 50

SWEP.ConeMax = 2
SWEP.ConeMin = 1.5

SWEP.IronSightsPos = Vector(-5.95, 3, 2.75)
SWEP.IronSightsAng = Vector(-0.15, -1, 2)

SWEP.TracerName = "AR2Tracer"

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MAX_SPREAD, -0.25)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.0175, 1)

if SERVER then
	function SWEP.BulletCallback(attacker, tr, dmginfo)
		local ent = tr.Entity
		if ent:IsValidZombie() then
			ent:AddLegDamageExt(4.5, attacker, attacker:GetActiveWeapon(), SLOWTYPE_PULSE)
		end

		if IsFirstTimePredicted() then
			util.CreatePulseImpactEffect(tr.HitPos, tr.HitNormal)
		end
		
		if tr.Entity then	
			local target = tr.Entity
			local shocked = {}
		
			if target then
				shocked[target] = true
				for i = 1, 3 do
					local tpos = target:WorldSpaceCenter()

					for k, ent in pairs(ents.FindInSphere(tpos, 105)) do
						if not shocked[ent] and ent:IsValidLivingZombie() and not ent:GetZombieClassTable().NeverAlive then
							if WorldVisible(tpos, ent:NearestPoint(tpos)) then
								shocked[ent] = true
								target = ent

								timer.Simple(i * 0.15, function()
									if not ent:IsValid() or not ent:IsValidLivingZombie() or not WorldVisible(tpos, ent:NearestPoint(tpos)) then return end

									target:TakeDamage(dmginfo:GetDamage() / (i + 0.5), attacker, attacker:GetActiveWeapon())

									local worldspace = ent:WorldSpaceCenter()
									effectdata = EffectData()
										effectdata:SetOrigin(worldspace)
										effectdata:SetStart(tpos)
										effectdata:SetEntity(target)
									util.Effect("tracer_zapper", effectdata)
								end)

								break
							end
						end
					end
				end
			end
		end
	end
end