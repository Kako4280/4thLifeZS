INC_CLIENT()

SWEP.DrawAmmo = true
SWEP.DrawCrosshair = false
SWEP.ViewModelFOV = 60
SWEP.ViewModelFlip = true
SWEP.BobScale = 1
SWEP.SwayScale = 1
SWEP.Slot = 0

SWEP.IronsightsMultiplier = 0.6

SWEP.HUD3DScale = 0.01
SWEP.HUD3DBone = "base"
SWEP.HUD3DAng = Angle(180, 0, 0)
SWEP.HUD3DAltOffset = 1

--SWEP base doesnt seem to transfer local vars to what its being used by. Dont remove the local vars below or errors will spam

local colBG = Color(16, 16, 16, 90)
local colRed = Color(220, 0, 0, 230)
local colYellow = Color(220, 220, 0, 230)
local colWhite = Color(220, 220, 220, 230)
local colAmmo = Color(255, 255, 255, 230)
local screenscale = BetterScreenScale()
local function GetAmmoColor(clip, maxclip) -- Why this was a local function is beyond me but I will keep it that way just incase
	if clip == 0 then
		colAmmo.r = 255 colAmmo.g = 0 colAmmo.b = 0
	else
		local sat = clip / maxclip
		colAmmo.r = 255
		colAmmo.g = sat ^ 0.3 * 255
		colAmmo.b = sat * 255
	end
end

function SWEP:Draw3DHUD(vm, pos, ang)
	local wid, hei = 180, 200
	local x, y = wid * -0.6, hei * -0.5
	local clip = self:Clip1()
	local spare = self:GetOwner():GetAmmoCount(self:GetPrimaryAmmoType())
	local maxclip = self.Primary.ClipSize

	local dclip, dspare, dmaxclip = self:GetDisplayAmmo(clip, spare, maxclip)

	cam.Start3D2D(pos, ang, self.HUD3DScale / 2)
		draw.RoundedBoxEx(32, x, y, wid, hei, colBG, true, false, true, false)

		local displayspare = dmaxclip > 0 and self.Primary.DefaultClip ~= 99999
		if displayspare then
			draw.SimpleTextBlurry(dspare, dspare >= 1000 and "ZS3D2DFontSmall" or "ZS3D2DFont", x + wid * 0.5, y + hei * 0.75, dspare == 0 and colRed or dspare <= dmaxclip and colYellow or colWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

		GetAmmoColor(dclip, dmaxclip)
		draw.SimpleTextBlurry(dclip, dclip >= 100 and "ZS3D2DFont" or "ZS3D2DFontBig", x + wid * 0.5, y + hei * (displayspare and 0.3 or 0.5), colAmmo, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		if self.Secondary.Ammo ~= "dummy" then
			local owner = self:GetOwner()
			local clip2 = owner:GetAmmoCount("pulse")
			local maxclip2 = (self.Secondary.RequiredClip * self.Primary.ClipSize) / self.Secondary.RequiredClip
			local spare2 = math.floor(( self:GetMaxClip2() > 0 and self:Clip2() or clip2 ) / self.Secondary.RequiredClip )

			draw.SimpleTextBlurry(spare2, spare2 <= 100 and "ZS3D2DFont" or "ZS3D2DFontSmall", x + wid * 0.5, y + hei * self.HUD3DAltOffset, spare2 <= 0 and colRed or spare2 <= maxclip2 and colYellow or colWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

	cam.End3D2D()
end

function SWEP:Draw2DHUD()
	local wid, hei = 180 * screenscale, 64 * screenscale
	local x, y = ScrW() - wid - screenscale * 128, ScrH() - hei - screenscale * 72
	local clip = self:Clip1()
	local spare = self:GetOwner():GetAmmoCount(self:GetPrimaryAmmoType())
	local maxclip = self.Primary.ClipSize

	local dclip, dspare, dmaxclip = self:GetDisplayAmmo(clip, spare, maxclip)

	--draw.RoundedBox(16, x, y * 0.968, wid, hei, colBG)

	local displayspare = dmaxclip > 0 and self.Primary.DefaultClip ~= 99999
	if displayspare then
		draw.SimpleTextBlurry(dspare, dspare >= 1000 and "ZSHUDFontSmall" or "ZSHUDFont", x + wid * 0.75, y + hei * 0.05, dspare == 0 and colRed or dspare <= dmaxclip and colYellow or colWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	GetAmmoColor(dclip, dmaxclip)
	draw.SimpleTextBlurry(dclip, dclip >= 100 and "ZSHUDFont" or "ZSHUDFontBig", x + wid * (displayspare and 0.25 or 0.5), y + hei * 0.05, colAmmo, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	if self.Secondary.Ammo ~= "dummy" then
		local owner = self:GetOwner()
		local clip2 = owner:GetAmmoCount("pulse")
		local maxclip2 = self.Primary.ClipSize
		local spare2 = math.floor(( self:GetMaxClip2() > 0 and self:Clip2() or clip2 ) / self.Secondary.RequiredClip )

		draw.SimpleTextBlurry(spare2, spare2 <= 1000 and "ZSHUDFontBig" or "ZSHUDFontMedium", x + wid * 0.5, y + hei * 0.9, spare2 <= 0 and colRed or spare2 <= maxclip2 and colYellow or colWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		draw.RoundedBox(16, x * 1.029, y * 1.035, wid * 0.5, hei, colBG)
	end
end