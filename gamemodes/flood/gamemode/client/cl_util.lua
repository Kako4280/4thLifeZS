function BetterScreenScale()
	return math.max(ScrH() / 1080, 0.851)
end

-- minor optimization.
local draw_SimpleText = draw.SimpleText
local draw_DrawText = draw.DrawText

local color_blur1 = Color(60, 60, 60, 220)
local color_blur2 = Color(40, 40, 40, 140)
function draw.SimpleTextBlur(text, font, x, y, col, xalign, yalign)
	if GAMEMODE.FontEffects then
		color_blur1.a = col.a * 0.85
		color_blur2.a = col.a * 0.55
		draw_SimpleText(text, font, x + FontBlurX, y + FontBlurY, color_blur1, xalign, yalign)
		draw_SimpleText(text, font, x + FontBlurX2, y + FontBlurY2, color_blur2, xalign, yalign)
	end
	draw_SimpleText(text, font, x, y, col, xalign, yalign)
end

function EasyLabel(parent, text, font, textcolor) -- quick, easy method used to generate DLabels for all sorts of UI stuff
	local dpanel = vgui.Create("DLabel", parent)
	if font then
		dpanel:SetFont(font or "DefaultFont")
	end
	dpanel:SetText(text)
	dpanel:SizeToContents()
	if textcolor then
		dpanel:SetTextColor(textcolor)
	end
	dpanel:SetKeyboardInputEnabled(false)
	dpanel:SetMouseInputEnabled(false)

	return dpanel
end