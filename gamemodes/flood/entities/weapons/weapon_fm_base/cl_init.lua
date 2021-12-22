INC_CLIENT()

include("animations.lua")

function SWEP:PreDrawViewModel(vm)
	if self.ShowViewModel == false then
		render.SetBlend(0)
	end
end

function SWEP:PostDrawViewModel(vm)
	if self.ShowViewModel == false then
		render.SetBlend(1)
	end
end

function SWEP:OnRemove()
	self:Anim_OnRemove()
end

function SWEP:ViewModelDrawn()
	self:Anim_ViewModelDrawn()
end

function SWEP:DrawWorldModel()
	self:Anim_DrawWorldModel()
end