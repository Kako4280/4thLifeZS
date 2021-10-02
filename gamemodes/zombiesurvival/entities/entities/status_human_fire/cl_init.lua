INC_CLIENT()

ENT.NextEmit = 0

function ENT:Initialize()
	self:GetOwner().HFire = self
end

local function GetRandomBonePos(pl)
	if pl ~= MySelf or pl:ShouldDrawLocalPlayer() then
		local bone = pl:GetBoneMatrix(math.random(0,25))
		if bone then
			return bone:GetTranslation()
		end
	end

	return pl:GetShootPos()
end

function ENT:Draw()
	local owner = self:GetOwner()
	if not owner:IsValid() or owner == MySelf and not owner:ShouldDrawLocalPlayer() then return end
	if owner:GetZombieClassTable().IgnoreTargetAssist then return end

	if owner.SpawnProtection then return end
	
	local pos
	if owner == MySelf and not owner:ShouldDrawLocalPlayer() then
		local aa, bb = owner:WorldSpaceAABB()
		pos = Vector(math.Rand(aa.x, bb.x), math.Rand(aa.y, bb.y), math.Rand(aa.z, bb.z))
	else
		pos = GetRandomBonePos(owner)
	end

	local emitter = ParticleEmitter(self:GetPos())
	emitter:SetNearClip(16, 24)
	
	for i = 1, 2 do
		local particle = emitter:Add("sprites/flamelet"..math.random(4), pos + VectorRand():GetNormalized() * 2)
		particle:SetDieTime(math.Rand(0.2, 0.5))
		particle:SetStartSize(4)
		particle:SetEndSize(6)
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(0)
		particle:SetVelocity(owner:GetVelocity())
		particle:SetAirResistance(32)
		particle:SetRoll(math.Rand(0, 360))
		particle:SetRollDelta(math.Rand(-1.5, 1.5))
	end
	
	emitter:Finish() emitter = nil collectgarbage("step", 64)
end