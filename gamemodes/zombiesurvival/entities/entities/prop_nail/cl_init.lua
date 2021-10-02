INC_CLIENT()

ENT.RenderGroup = RENDERGROUP_OPAQUE
ENT.NextEmit = 0

function ENT:SetAttachEntity(ent, physbone1, physbone2)
	self.m_AttachEntity = ent
end

function ENT:OnRemove()
	local normal = self:GetForward() * -1
	local pos = self:GetPos() + normal

	sound.Play("physics/metal/metal_box_impact_bullet"..math.random(1, 3)..".wav", pos, 75, math.random(90, 110))

	local grav = Vector(0, 0, -300)

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(22, 32)
	for i=1, math.random(32, 48) do
		local vNormal = (VectorRand() * 0.6 + normal):GetNormalized()
		local particle = emitter:Add("effects/spark", pos + vNormal)
		particle:SetVelocity(vNormal * math.Rand(16, 100))
		particle:SetDieTime(math.Rand(0.5, 1))
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(255)
		particle:SetStartSize(math.Rand(0.4, 1.5))
		particle:SetEndSize(0)
		particle:SetRoll(math.Rand(0, 360))
		particle:SetRollDelta(math.Rand(-8, 8))
		particle:SetCollide(true)
		particle:SetBounce(0.8)
		particle:SetGravity(grav)
	end
	emitter:Finish() emitter = nil collectgarbage("step", 64)
end

local matExpert = Material("zombiesurvival/padlock.png")
local matHeart = Material("icon16/heart.png")
local colNail = Color(0, 0, 5, 220)
local colText = Color(240, 240, 240, 105)
local colDead = Color(230, 80, 80, 95)
function ENT:Draw()
	local parent = self:GetParent()
	if not parent:IsValid() or RealTime() == parent.LastNailInfoDraw then
		self:DrawModel()
		return
	end

	local drawinfo
	local myteam
	local pos
	local eyepos
	if MySelf:IsValid() then
		myteam = MySelf:Team()
		pos = self:GetPos()
		eyepos = EyePos()
		if myteam == TEAM_HUMAN or myteam == TEAM_SPECTATOR then
			drawinfo = (GAMEMODE.AlwaysShowNails or MySelf:KeyDown(IN_SPEED) or GAMEMODE.TraceTargetNoPlayers == self:GetParent()) and eyepos:DistToSqr(pos) <= 262144 and WorldVisible(eyepos, pos)
		elseif myteam == TEAM_UNDEAD then
			drawinfo = GAMEMODE.TraceTargetNoPlayers == self:GetParent()
		end
	end

	self:DrawModel()

	local nhp = self:GetNailHealth()
	local mnhp = self:GetMaxNailHealth()

	if nhp/mnhp < 0.35 and CurTime() > self.NextEmit then
		local normal = self:GetForward() * -1
		local epos = self:GetPos() + normal

		sound.Play("physics/metal/metal_box_impact_bullet"..math.random(1, 3)..".wav", pos, 58, math.random(210, 240))

		local emitter = ParticleEmitter(epos)
		emitter:SetNearClip(22, 32)
		for i=1, math.random(6, 12) do
			local vNormal = (VectorRand() * 0.6 + normal):GetNormalized()
			local particle = emitter:Add("effects/spark", epos + vNormal)
			particle:SetDieTime(math.Rand(0.1, 0.2))
			particle:SetGravity(Vector(math.random(-5, 5), math.random(-5, 5), math.random(1, 3)):GetNormal() * 50)
			particle:SetStartAlpha(100)
			particle:SetEndAlpha(0)
			particle:SetStartSize(4)
			particle:SetEndSize(1)
			particle:SetStartLength(10)
			particle:SetEndLength(0)
			particle:SetColor(165, 188, 0)
			particle:SetRoll(math.Rand(0, 360))
			particle:SetRollDelta(math.Rand(-20, 20))
		end
		emitter:Finish() emitter = nil collectgarbage("step", 64)

		self.NextEmit = CurTime() + math.Rand(4.2, 5.8)
	end
end
