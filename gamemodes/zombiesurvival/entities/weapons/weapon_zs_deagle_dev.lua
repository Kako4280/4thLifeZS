AddCSLuaFile()

SWEP.PrintName = "'Zombie Drill' Desert Eagle"
SWEP.Description = "This handgun uses high-powered rounds that have more knockback than others." --SWEP.Description = "This high-powered handgun has the ability to pierce through multiple zombies. The bullet's power decreases by half which each zombie it hits."
SWEP.Slot = 1
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 55

	SWEP.HUD3DBone = "v_weapon.Deagle_Slide"
	SWEP.HUD3DPos = Vector(-1, 0, 1)
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DScale = 0.015

	SWEP.IronSightsPos = Vector(-6.35, 5, 1.7)
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "revolver"

SWEP.ViewModel = "models/weapons/cstrike/c_pist_deagle.mdl"
SWEP.WorldModel = "models/weapons/w_pist_deagle.mdl"
SWEP.UseHands = true

SWEP.Primary.Sound = Sound("Weapon_Deagle.Single")
SWEP.Primary.Damage = 57
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.32
SWEP.Primary.KnockbackScale = 2

SWEP.Primary.ClipSize = 7
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pistol"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.ConeMax = 3.4
SWEP.ConeMin = 1.25

SWEP.FireAnimSpeed = 1.3

SWEP.Tier = 3

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_CLIP_SIZE, 2)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, "ASDF", "ASDF", function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 0.75
	wept.Shock = true
end)


function SWEP.BulletCallback(attacker, tr, dmginfo)
	
	if SERVER and math.random(1,4) == 4 then
	local ent = tr.Entity
    hitpos = ent:GetPos()
    hitnormal = ent:GetForward()
 
    local owner = attacker:GetOwner()
    if owner:IsValidHuman() and ent:IsValidLivingZombie() then	 
        local shocked = {}
        local tpos, target
        shocked[1] = ent
        shocked[ent] = true
            for i = 1, 5 do
                for k, ent in pairs(ents.FindInSphere(tpos, i == 1 and 100 or 50)) do
                    if not shocked[ent] and ent:IsValidLivingZombie() and not ent:GetZombieClassTable().NeverAlive then
                        if WorldVisible(tpos, ent:NearestPoint(tpos)) then
                            shocked[ent] = true
                            shocked[i + 1] = ent
                            target = ent
 
                            timer.Simple(i * 0.2, function()
                            if not ent:IsValid() or not ent:IsValidLivingZombie() or not WorldVisible(tpos, ent:NearestPoint(tpos)) then return end
 
                                
							local base = 100
                            local damage = (math.random(base * 0.8,base * 1.2)-(math.random((base/2)*0.7,(base/2)*1.3)*(i/5))) * 0.8
                            
                            ent:TakeSpecialDamage(damage, DMG_SHOCK, owner, self)

                            local startpos
                            if i == 1 then
                                startpos = tpos
                            elseif shocked[i]:IsValid() then
                                startpos = shocked[i]:GetPos() or tpos
                            else
                                startpos = tpos
                            end
                               
 
                            ent:EmitSound("ambient/office/zap1.wav", 70, 160, 0.6, CHAN_AUTO)
 
                            local worldspace = ent:WorldSpaceCenter()
                               
                            effectdata = EffectData()
                                effectdata:SetOrigin(worldspace)
                                effectdata:SetStart(startpos)
                                effectdata:SetEntity(target)
                            util.Effect("tracer_volt", effectdata)
                               
                            effectdata = EffectData()
                                effectdata:SetOrigin(worldspace)
                                effectdata:SetNormal(hitnormal)
                            util.Effect("hit_zeus", effectdata)
                        end)
                        tpos = ent:WorldSpaceCenter()
                        break
                    end
                end 
                target = nil
            end
        end
    end
	end
end
