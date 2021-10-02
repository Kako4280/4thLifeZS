function MakepOptions()
	PlayMenuOpenSound()

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

	local label = EasyLabel(frame, "Options", "ZSScoreBoardTitle", color_white)
	label:SetPos(wide * 0.5 - label:GetWide() * 0.5, y)
	y = y + label:GetTall() + 8

	local propertysheet = vgui.Create("DPropertySheet", frame)

	propertysheet:SetSize(wide - 8, tall - label:GetTall() - 32 * screenscale)
	propertysheet:MoveBelow(label, 4 * screenscale)
	propertysheet:SetPadding(1)

	local list = vgui.Create("DPanelList", propertysheet)
	local sheet = propertysheet:AddSheet("Performance", list, "icon16/computer.png", false, false)
	sheet.Panel:SetPos(0, tabhei + 2)
	list:EnableVerticalScrollbar(true)
	list:SetWide(propertysheet:GetWide() - 16)
	list:SetSpacing(2)
	list:SetPadding(2)

	local list2 = vgui.Create("DPanelList", propertysheet)
	local sheet = propertysheet:AddSheet("Gameplay", list2, "icon16/controller.png", false, false)
	sheet.Panel:SetPos(0, tabhei + 2)
	list2:EnableVerticalScrollbar(true)
	list2:SetWide(propertysheet:GetWide() - 16)
	list2:SetSpacing(2)
	list2:SetPadding(2)

	local list3 = vgui.Create("DPanelList", propertysheet)
	local sheet = propertysheet:AddSheet("Customization", list3, "icon16/palette.png", false, false)
	sheet.Panel:SetPos(0, tabhei + 2)
	list3:EnableVerticalScrollbar(true)
	list3:SetWide(propertysheet:GetWide() - 16)
	list3:SetSpacing(2)
	list3:SetPadding(2)

	local list4 = vgui.Create("DPanelList", propertysheet)
	local sheet = propertysheet:AddSheet("Sounds", list4, "icon16/sound.png", false, false)
	sheet.Panel:SetPos(0, tabhei + 2)
	list4:EnableVerticalScrollbar(true)
	list4:SetWide(propertysheet:GetWide() - 16)
	list4:SetSpacing(2)
	list4:SetPadding(2)

	local list5 = vgui.Create("DPanelList", propertysheet)
	local sheet = propertysheet:AddSheet("Crosshair", list5, "icon16/cross.png", false, false)
	sheet.Panel:SetPos(0, tabhei + 2)
	list5:EnableVerticalScrollbar(true)
	list5:SetWide(propertysheet:GetWide() - 16)
	list5:SetSpacing(2)
	list5:SetPadding(2)

	gamemode.Call("AddExtraOptions", list, frame)

	------------------------------------------------------------------------------
    ----                             PERFORMANCE                              ----
	------------------------------------------------------------------------------

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Disable SCK World Models")
	check:SetConVar("zs_disableSCKworldmodels")
	check:SetTooltip("Disables custom weapon models from rendering to increase FPS")
	check:SizeToContents()
	list:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Don't hide friends via transparency")
	check:SetConVar("zs_showfriends")
	check:SetTooltip("Your ZS Friends will render regardless of transparency")
	check:SizeToContents()
	list:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Enable post processing")
	check:SetConVar("zs_postprocessing")
	check:SizeToContents()
	list:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Enable Color Mod")
	check:SetConVar("zs_colormod")
	check:SizeToContents()
	list:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Enable font effects")
	check:SetConVar("zs_fonteffects")
	check:SizeToContents()
	list:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Enable human health auras")
	check:SetConVar("zs_auras")
	check:SizeToContents()
	list:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Film Mode (disable most of the HUD)")
	check:SetConVar("zs_filmmode")
	check:SizeToContents()
	list:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Hide view models")
	check:SetConVar("zs_hideviewmodels")
	check:SizeToContents()
	list:AddItem(check)

	slider = vgui.Create("DNumSlider", frame)
	slider:SetDecimals(0)
	slider:SetMinMax(0, GAMEMODE.TransparencyRadiusMax)
	slider:SetConVar("zs_transparencyradius")
	slider:SetText("Transparency radius")
	slider:SetTooltip("Teammates will not render within this radius, Increasing FPS")
	slider:SizeToContents()
	list:AddItem(slider)

	slider = vgui.Create("DNumSlider", frame)
	slider:SetDecimals(0)
	slider:SetMinMax(0, GAMEMODE.TransparencyRadiusMax)
	slider:SetConVar("zs_transparencyradius3p")
	slider:SetText("Transparency radius in third person")
	slider:SetTooltip("Teammates will not render within this radius, Increasing FPS")
	slider:SizeToContents()
	list:AddItem(slider)

	------------------------------------------------------------------------------
    ----                             GAMEPLAY                                 ----
	------------------------------------------------------------------------------

	local check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Always display nail health")
	check:SetConVar("zs_alwaysshownails")
	check:SizeToContents()
	list2:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Always third person knockdown camera")
	check:SetConVar("zs_thirdpersonknockdown")
	check:SizeToContents()
	list2:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Always volunteer to start as a zombie")
	check:SetConVar("zs_alwaysvolunteer")
	check:SizeToContents()
	list2:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Always quick buy from arsenal and remantler")
	check:SetConVar("zs_alwaysquickbuy")
	check:SizeToContents()
	list2:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Automatic suicide when changing classes")
	check:SetConVar("zs_suicideonchange")
	check:SizeToContents()
	list2:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Disable automatic redeeming (next round)")
	check:SetConVar("zs_noredeem")
	check:SizeToContents()
	list2:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Disable pressing use to deposit ammo in deployables")
	check:SetConVar("zs_nousetodeposit")
	check:SizeToContents()
	list2:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Disable use to prop pickup (only pickup items)")
	check:SetConVar("zs_nopickupprops")
	check:SizeToContents()
	list2:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Disable pressing shift to pick up deployables")
	check:SetConVar("zs_nodeploypacking")
	check:SetTooltip("You will not be able to pack any deployables with this option enabled.")
	check:SizeToContents()
	list2:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Don't show point floaters")
	check:SetConVar("zs_nofloatingscore")
	check:SizeToContents()
	list2:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Don't hide arsenal and resupply packs")
	check:SetConVar("zs_hidepacks")
	check:SizeToContents()
	list2:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Enable pain flashes")
	check:SetConVar("zs_drawpainflash")
	check:SizeToContents()
	list2:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Enable message beacon visibility")
	check:SetConVar("zs_messagebeaconshow")
	check:SizeToContents()
	list2:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Prevent being picked as a boss zombie")
	check:SetConVar("zs_nobosspick")
	check:SizeToContents()
	list2:AddItem(check)

	list2:AddItem(EasyLabel(frame, "Prop rotation snap angle", "DefaultFontSmall", color_white))
	dropdown = vgui.Create("DComboBox", frame)
	dropdown:SetMouseInputEnabled(true)
	dropdown:AddChoice("No snap")
	dropdown:AddChoice("15 degrees")
	dropdown:AddChoice("30 degrees")
	dropdown:AddChoice("45 degrees")
	dropdown.OnSelect = function(me, index, value, data)
		RunConsoleCommand("zs_proprotationsnap", value == "15 degrees" and 15 or value == "30 degrees" and 30 or value == "45 degrees" and 45 or 0)
	end
	dropdown:SetText(GAMEMODE.PropRotationSnap == 15 and "15 degrees"
		or GAMEMODE.PropRotationSnap == 30 and "30 degrees"
		or GAMEMODE.PropRotationSnap == 45 and "45 degrees"
		or "No snap")
	dropdown:SetTextColor(color_black)
	list2:AddItem(dropdown)

	slider = vgui.Create("DNumSlider", frame)
	slider:SetDecimals(1)
	slider:SetMinMax(0.1, 4)
	slider:SetConVar("zs_proprotationsens")
	slider:SetText("Prop rotation sensitivity")
	slider:SizeToContents()
	list2:AddItem(slider)

	------------------------------------------------------------------------------
    ----                             CUSTOMIZATION                            ----
	------------------------------------------------------------------------------

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Display the names of dropped weapons")
	check:SetConVar("zs_droppeditemnames")
	check:SizeToContents()
	list3:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Enable damage indicators")
	check:SetConVar("zs_damagefloaters")
	check:SizeToContents()
	list3:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Enable custom viewmodel positions")
	check:SetConVar("zs_enableviewmodelpos")
	check:SizeToContents()
	list3:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Show damage indicators through walls")
	check:SetConVar("zs_damagefloaterswalls")
	check:SizeToContents()
	list3:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Disable iron sights view model translation")
	check:SetConVar("zs_noironsights")
	check:SizeToContents()
	list3:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Disable ironsight scopes")
	check:SetConVar("zs_disablescopes")
	check:SizeToContents()
	list3:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Display experience")
	check:SetConVar("zs_drawxp")
	check:SizeToContents()
	list3:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Enable film grain")
	check:SetConVar("zs_filmgrain")
	check:SizeToContents()
	list3:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Enable movement view roll")
	check:SetConVar("zs_movementviewroll")
	check:SizeToContents()
	list3:AddItem(check)

	list3:AddItem(EasyLabel(frame, "Weapon HUD display style", "DefaultFontSmall", color_white))
	local dropdown = vgui.Create("DComboBox", frame)
	dropdown:SetMouseInputEnabled(true)
	dropdown:AddChoice("Display in 3D")
	dropdown:AddChoice("Display in 2D")
	dropdown:AddChoice("Display both")
	dropdown.OnSelect = function(me, index, value, data)
		RunConsoleCommand("zs_weaponhudmode", value == "Display both" and 2 or value == "Display in 2D" and 1 or 0)
	end
	dropdown:SetText(GAMEMODE.WeaponHUDMode == 2 and "Display both" or GAMEMODE.WeaponHUDMode == 1 and "Display in 2D" or "Display in 3D")
	dropdown:SetTextColor(color_black)
	list3:AddItem(dropdown)

	list3:AddItem(EasyLabel(frame, "Health target display style", "DefaultFontSmall", color_white))
	dropdown = vgui.Create("DComboBox", frame)
	dropdown:SetMouseInputEnabled(true)
	dropdown:AddChoice("% of health")
	dropdown:AddChoice("Health amount")
	dropdown.OnSelect = function(me, index, value, data)
		RunConsoleCommand("zs_healthtargetdisplay", value == "Health amount" and 1 or 0)
	end
	dropdown:SetText(GAMEMODE.HealthTargetDisplay == 1 and "Health amount" or "% of health")
	dropdown:SetTextColor(color_black)
	list3:AddItem(dropdown)

	slider = vgui.Create("DNumSlider", frame)
	slider:SetDecimals(1)
	slider:SetMinMax(0.5, 2)
	slider:SetConVar("zs_dmgnumberscale")
	slider:SetText("Damage number size")
	slider:SizeToContents()
	list3:AddItem(slider)

	slider = vgui.Create("DNumSlider", frame)
	slider:SetDecimals(1)
	slider:SetMinMax(0, 1)
	slider:SetConVar("zs_dmgnumberspeed")
	slider:SetText("Damage number speed")
	slider:SizeToContents()
	list3:AddItem(slider)

	slider = vgui.Create("DNumSlider", frame)
	slider:SetDecimals(1)
	slider:SetMinMax(0.2, 1.5)
	slider:SetConVar("zs_dmgnumberlife")
	slider:SetText("Damage number lifetime")
	slider:SizeToContents()
	list3:AddItem(slider)

	slider = vgui.Create("DNumSlider", frame)
	slider:SetDecimals(1)
	slider:SetMinMax(0, 255)
	slider:SetConVar("zs_filmgrainopacity")
	slider:SetText("Film grain")
	slider:SizeToContents()
	list3:AddItem(slider)

	slider = vgui.Create("DNumSlider", frame)
	slider:SetDecimals(1)
	slider:SetMinMax(0.7, 1.6)
	slider:SetConVar("zs_interfacesize")
	slider:SetText("Interface/HUD scale")
	slider:SizeToContents()
	list3:AddItem(slider)

	slider = vgui.Create("DNumSlider", frame)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("zs_ironsightzoom")
	slider:SetText("Ironsight zoom scale")
	slider:SizeToContents()
	list3:AddItem(slider)

	slider = vgui.Create("DNumSlider", frame)
	slider:SetDecimals(1)
	slider:SetMinMax(0, 20)
	slider:SetConVar("zs_viewmodelposition")
	slider:SetText("View Model Position")
	slider:SizeToContents()
	list3:AddItem(slider)

	slider = vgui.Create("DNumSlider", frame)
	slider:SetDecimals(1)
	slider:SetMinMax(0, 20)
	slider:SetConVar("zs_viewmodelposition2")
	slider:SetText("View Model Position 2")
	slider:SizeToContents()
	list3:AddItem(slider)

	slider = vgui.Create("DNumSlider", frame)
	slider:SetDecimals(1)
	slider:SetMinMax(0, 20)
	slider:SetConVar("zs_viewmodelpositionup")
	slider:SetText("View Model Position Up")
	slider:SizeToContents()
	list3:AddItem(slider)

	slider = vgui.Create("DNumSlider", frame)
	slider:SetDecimals(1)
	slider:SetMinMax(0, 20)
	slider:SetConVar("zs_viewmodelpositiondown")
	slider:SetText("View Model Position Down")
	slider:SizeToContents()
	list3:AddItem(slider)

	list3:AddItem(EasyLabel(frame, "Damage number color"))
	local colpicker = vgui.Create("DColorMixer", frame)
	colpicker:SetAlphaBar(true)
	colpicker:SetPalette(false)
	colpicker:SetConVarR("zs_damagenumber_colr")
	colpicker:SetConVarG("zs_damagenumber_colg")
	colpicker:SetConVarB("zs_damagenumber_colb")
	colpicker:SetConVarA("zs_damagenumber_cola")
	colpicker:SetTall(72)
	list3:AddItem(colpicker)

	list3:AddItem(EasyLabel(frame, "Prop damage number color"))
	local colpicker = vgui.Create("DColorMixer", frame)
	colpicker:SetAlphaBar(true)
	colpicker:SetPalette(false)
	colpicker:SetConVarR("zs_propdamagenumber_colr")
	colpicker:SetConVarG("zs_propdamagenumber_colg")
	colpicker:SetConVarB("zs_propdamagenumber_colb")
	colpicker:SetConVarA("zs_propdamagenumber_cola")
	colpicker:SetTall(72)
	list3:AddItem(colpicker)

	list3:AddItem(EasyLabel(frame, "Health aura color - Full health"))
	colpicker = vgui.Create("DColorMixer", frame)
	colpicker:SetAlphaBar(false)
	colpicker:SetPalette(false)
	colpicker:SetConVarR("zs_auracolor_full_r")
	colpicker:SetConVarG("zs_auracolor_full_g")
	colpicker:SetConVarB("zs_auracolor_full_b")
	colpicker:SetTall(72)
	list3:AddItem(colpicker)

	list3:AddItem(EasyLabel(frame, "Health aura color - No health"))
	colpicker = vgui.Create("DColorMixer", frame)
	colpicker:SetAlphaBar(false)
	colpicker:SetPalette(false)
	colpicker:SetConVarR("zs_auracolor_empty_r")
	colpicker:SetConVarG("zs_auracolor_empty_g")
	colpicker:SetConVarB("zs_auracolor_empty_b")
	colpicker:SetTall(72)
	list3:AddItem(colpicker)

	frame:SetAlpha(0)
	frame:AlphaTo(255, 0.15, 0)
	frame:MakePopup()

	------------------------------------------------------------------------------
    ----                             SOUNDS                                   ----
	------------------------------------------------------------------------------

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Enable ambient music")
	check:SetConVar("zs_beats")
	check:SizeToContents()
	list4:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Enable last human music")
	check:SetConVar("zs_playmusic")
	check:SizeToContents()
	list4:AddItem(check)

	list4:AddItem(EasyLabel(frame, "Human ambient beat set", "DefaultFontSmall", color_white))
	dropdown = vgui.Create("DComboBox", frame)
	dropdown:SetMouseInputEnabled(true)
	for setname in pairs(GAMEMODE.Beats) do
		if setname ~= GAMEMODE.BeatSetHumanDefualt then
			dropdown:AddChoice(setname)
		end
	end
	dropdown:AddChoice("none")
	dropdown:AddChoice("default")
	dropdown.OnSelect = function(me, index, value, data)
		RunConsoleCommand("zs_beatset_human", value)
	end
	dropdown:SetText(GAMEMODE.BeatSetHuman == GAMEMODE.BeatSetHumanDefault and "default" or GAMEMODE.BeatSetHuman)
	dropdown:SetTextColor(color_black)
	list4:AddItem(dropdown)

	list4:AddItem(EasyLabel(frame, "Zombie ambient beat set", "DefaultFontSmall", color_white))
	dropdown = vgui.Create("DComboBox", frame)
	dropdown:SetMouseInputEnabled(true)
	for setname in pairs(GAMEMODE.Beats) do
		if setname ~= GAMEMODE.BeatSetZombieDefualt then
			dropdown:AddChoice(setname)
		end
	end
	dropdown:AddChoice("none")
	dropdown:AddChoice("default")
	dropdown.OnSelect = function(me, index, value, data)
		RunConsoleCommand("zs_beatset_zombie", value)
	end
	dropdown:SetText(GAMEMODE.BeatSetZombie == GAMEMODE.BeatSetZombieDefault and "default" or GAMEMODE.BeatSetZombie)
	dropdown:SetTextColor(color_black)
	list4:AddItem(dropdown)

	slider = vgui.Create("DNumSlider", frame)
	slider:SetDecimals(0)
	slider:SetMinMax(0, 100)
	slider:SetConVar("zs_beatsvolume")
	slider:SetText("Music volume")
	slider:SetTooltip("Changes the volume for Zombie Survivals music.")
	slider:SizeToContents()
	list4:AddItem(slider)

	------------------------------------------------------------------------------
    ----                             CROSSHAIR                                ----
	------------------------------------------------------------------------------

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Disable crosshair rotate")
	check:SetTooltip("Your crosshair will no longer rotate while moving sideways.")
	check:SetConVar("zs_nocrosshairrotate")
	check:SizeToContents()
	list5:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", frame)
	check:SetText("Draw crosshair in ironsights.")
	check:SetTooltip("Your crosshair will display while using ironsights.")
	check:SetConVar("zs_ironsightscrosshair")
	check:SizeToContents()
	list5:AddItem(check)

	local slider = vgui.Create("DNumSlider", frame)
	slider:SetDecimals(0)
	slider:SetMinMax(2, 8)
	slider:SetConVar("zs_crosshairlines")
	slider:SetText("Crosshair lines")
	slider:SetTooltip("Changes the number of lines your crosshair has.")
	slider:SizeToContents()
	list5:AddItem(slider)

	slider = vgui.Create("DNumSlider", frame)
	slider:SetDecimals(0)
	slider:SetMinMax(0, 90)
	slider:SetConVar("zs_crosshairoffset")
	slider:SetText("Crosshair offset")
	slider:SetTooltip("This option will rotate your crosshair.")
	slider:SizeToContents()
	list5:AddItem(slider)

	slider = vgui.Create("DNumSlider", frame)
	slider:SetDecimals(1)
	slider:SetMinMax(0.5, 2)
	slider:SetConVar("zs_crosshairthickness")
	slider:SetText("Crosshair thickness")
	slider:SetTooltip("Changes the thickness of your crosshair.")
	slider:SizeToContents()
	list5:AddItem(slider)

	list5:AddItem(EasyLabel(frame, "Crosshair primary color"))
	local colpicker = vgui.Create("DColorMixer", frame)
	colpicker:SetAlphaBar(true)
	colpicker:SetPalette(false)
	colpicker:SetConVarR("zs_crosshair_colr")
	colpicker:SetConVarG("zs_crosshair_colg")
	colpicker:SetConVarB("zs_crosshair_colb")
	colpicker:SetConVarA("zs_crosshair_cola")
	colpicker:SetTooltip("Changes the primary color of your crosshair.")
	colpicker:SetTall(72)
	list5:AddItem(colpicker)

	list5:AddItem(EasyLabel(frame, "Crosshair secondary color"))
	colpicker = vgui.Create("DColorMixer", frame)
	colpicker:SetAlphaBar(true)
	colpicker:SetPalette(false)
	colpicker:SetConVarR("zs_crosshair_colr2")
	colpicker:SetConVarG("zs_crosshair_colg2")
	colpicker:SetConVarB("zs_crosshair_colb2")
	colpicker:SetConVarA("zs_crosshair_cola2")
	colpicker:SetTooltip("Changes the secondary color of your crosshair.")
	colpicker:SetTall(72)
	list5:AddItem(colpicker)
end
