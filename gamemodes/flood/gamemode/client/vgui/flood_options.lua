function MakepOptions()
	LocalPlayer():EmitSound("buttons/lightswitch2.wav", 100, 30)

	if pOptions then
		pOptions:SetAlpha(0)
		pOptions:AlphaTo(255, 0.15, 0)
		pOptions:SetVisible(true)
		pOptions:MakePopup()
		return
	end


    local screenscale = BetterScreenScale()
	local frame = vgui.Create("DFrame")
	local wide, tall = math.min(ScrW(), 500) * screenscale, math.min(ScrH(), 500) * screenscale
	--local tall = math.min(ScrH(), 800)
	frame:SetSize(wide, tall)
	frame:Center()
	frame:SetTitle(" ")
	frame:SetDeleteOnClose(false)
	pOptions = frame

	local y = 8
	local tabhei = 24 * screenscale

	local label = EasyLabel(frame, "Options", "DermaDefault", COLOR_WHITE)
	label:SetPos(wide * 0.5 - label:GetWide() * 0.5, y)
	y = y + label:GetTall() + 8

	local propertysheet = vgui.Create("DPropertySheet", frame)

	propertysheet:SetSize(wide - 8, tall - label:GetTall() - 32 * screenscale)
	propertysheet:MoveBelow(label, 4 * screenscale)
	propertysheet:SetPadding(1)

	local list = vgui.Create("DPanelList", propertysheet)
	local sheet = propertysheet:AddSheet("Performance", list, "icon16/star.png", false, false)
	sheet.Panel:SetPos(0, tabhei + 2)
	list:EnableVerticalScrollbar(true)
	list:SetWide(propertysheet:GetWide() - 16)
	list:SetSpacing(2)
	list:SetPadding(2)

	local list2 = vgui.Create("DPanelList", propertysheet)
	local sheet = propertysheet:AddSheet("Gameplay", list2, "icon16/star.png", false, false)
	sheet.Panel:SetPos(0, tabhei + 2)
	list2:EnableVerticalScrollbar(true)
	list2:SetWide(propertysheet:GetWide() - 16)
	list2:SetSpacing(2)
	list2:SetPadding(2)

	local list3 = vgui.Create("DPanelList", propertysheet)
	local sheet = propertysheet:AddSheet("Customization", list3, "icon16/star.png", false, false)
	sheet.Panel:SetPos(0, tabhei + 2)
	list3:EnableVerticalScrollbar(true)
	list3:SetWide(propertysheet:GetWide() - 16)
	list3:SetSpacing(2)
	list3:SetPadding(2)

	gamemode.Call("AddExtraOptions", list, frame)

	------------------------------------------------------------------------------
    ----                             PERFORMANCE                              ----
	------------------------------------------------------------------------------

	------------------------------------------------------------------------------
    ----                             GAMEPLAY                                 ----
	------------------------------------------------------------------------------

	------------------------------------------------------------------------------
    ----                             CUSTOMIZATION                            ----
	------------------------------------------------------------------------------

	frame:SetAlpha(0)
	frame:AlphaTo(255, 0.15, 0)
	frame:MakePopup()
end
