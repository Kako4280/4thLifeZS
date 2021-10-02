INC_SERVER()

function ENT:Initialize()
	self:SetModel("models/Items/CrossbowRounds.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetupGenericProjectile(false)
	self.LastPhysicsUpdate = UnPredictedCurTime()

	self.NextShoot = CurTime() + 0.05
end

local vecDown = Vector()
function ENT:PhysicsUpdate(phys)
	local dt = UnPredictedCurTime() - self.LastPhysicsUpdate
	self.LastPhysicsUpdate = UnPredictedCurTime()

	vecDown.z = dt * -400
	phys:AddVelocity(vecDown)
end

function ENT:PhysicsCollide(data, phys)
	if self.HitData then return end
	self.HitData = data

	self:NextThink(CurTime())
end

function ENT:Think()


		local owner = self:GetOwner()
		if not owner:IsValidLivingHuman() then owner = self end

		local phys = self:GetPhysicsObject()



	if self.HitData then
		self:Explode(self.HitData.HitPos, self.HitData.HitNormal)
		self:EmitSound("weapons/physcannon/superphys_small_zap1.wav", 85, 90, 1, CHAN_AUTO)
		self:Remove()
	end

	self:NextThink(CurTime())
end

function ENT:Explode(hitpos, hitnormal)
    if self.Exploded then return end
    self.Exploded = true
 
    hitpos = hitpos or self:GetPos()
    hitnormal = hitnormal or self:GetForward()
 
    local owner = self:GetOwner()
    if owner:IsValidHuman() then
	local source = self:ProjectileDamageSource()

		local base = self.ProjDamage or 50
        local ent = self.HitData.HitEntity
        if ent:IsValidLivingZombie() and not ent:GetZombieClassTable().NeverAlive or ent.ZombieConstruction then
		ent:TakeSpecialDamage((ent:GetStatus("shockdebuff") and 1.25 or 1) * (base or 50) * (math.random(800,1200)/1000), DMG_SHOCK, owner, source, hitpos)
            ent:EmitSound("ambient/energy/zap1.wav", 70, 240, 0.7, CHAN_AUTO)
        end
		
       
        local shocked = {}
        local tpos, target
        shocked[1] = ent
        shocked[ent] = true
            for i = 1, 5 do
                if not target and i == 1 then
                    tpos = not ent:IsWorld() and ent:WorldSpaceCenter() or hitpos
                elseif not target then
                    break
                end
 
                for k, ent in pairs(ents.FindInSphere(tpos, i == 1 and 100 or 50)) do
                    if not shocked[ent] and ent:IsValidLivingZombie() and not ent:GetZombieClassTable().NeverAlive then
                        if WorldVisible(tpos, ent:NearestPoint(tpos)) then
                            shocked[ent] = true
                            shocked[i + 1] = ent
                            target = ent
 
                            timer.Simple(i * 0.2, function()
                                if not ent:IsValid() or not ent:IsValidLivingZombie() or not WorldVisible(tpos, ent:NearestPoint(tpos)) then return end

                                local damage = (math.random(base * 0.8,base * 1.2)-(math.random((base/2)*0.7,(base/2)*1.3)*(i/5))) * 0.70
                            
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
     
        --[[
        if math.random(3) == 1 then
            for _, pl in pairs(util.BlastAlloc(source, owner, hitpos, 1)) do
                if pl:IsValidLivingPlayer() and gamemode.Call("PlayerShouldTakeDamage", pl, owner) then
                    local status = pl:GiveStatus("shockdebuff")
                    status.DieTime = CurTime() + 7
                end
            end
        end
        ]]
    end
 
    local effectdata = EffectData()
        effectdata:SetOrigin(hitpos)
        effectdata:SetNormal(hitnormal)
    util.Effect("hit_zeus", effectdata)
end
