local function WeaponButtonDoClick(self)
	local swep = self.SWEP
	if swep then
		pWeapons:SetWeaponViewerSWEP(self.SWEP, self.Category, self.Comps)
	end
end

local function SetWeaponViewerSWEP(self, swep, category, comps)
	if self.Viewer then
		if self.Viewer:IsValid() then
			self.Viewer:Remove()
		end
		self.Viewer = nil
	end

	local wid, hei = self:GetWide() * 0.6 - 16, self:GetTall() - self.ViewerY - 8
	local screenscale = BetterScreenScale()

	local viewer = vgui.Create("DPanel", self)
	viewer:SetPaintBackground(false)
	viewer:SetSize(wid, hei)
	viewer:SetPos(self:GetWide() - viewer:GetWide() - 8, self.ViewerY)
	self.Viewer = viewer

	if not swep then return end
	local sweptable = weapons.Get(swep)
	if not sweptable then return end

	GAMEMODE:CreateItemViewerGenericElems(viewer)

	viewer.m_Title:SetText(sweptable.PrintName)
	viewer.m_Title:PerformLayout()

	local desctext = sweptable.Description or ""

	viewer.ModelPanel:SetModel(sweptable.WorldModel)
	local mins, maxs = viewer.ModelPanel.Entity:GetRenderBounds()
	viewer.ModelPanel:SetCamPos(mins:Distance(maxs) * Vector(1.15, 0.75, 0.5))
	viewer.ModelPanel:SetLookAt((mins + maxs) / 2)
	viewer.m_VBG:SetVisible(true)

	if sweptable.NoDismantle then
		desctext = desctext .. "\nCannot be dismantled for scrap."
	end

	viewer.m_Desc:MoveBelow(viewer.m_VBG, 8)
	viewer.m_Desc:SetFont("ZSBodyTextFont")
	viewer.m_Desc:SetText(desctext)

	GAMEMODE:ViewerStatBarUpdate(viewer, category ~= ITEMCAT_GUNS and category ~= ITEMCAT_MELEE, sweptable)
	if GAMEMODE:HasPurchaseableAmmo(sweptable) and GAMEMODE.AmmoNames[string.lower(sweptable.Primary.Ammo)] then
		local lower = string.lower(sweptable.Primary.Ammo)

		viewer.m_AmmoType:SetText(GAMEMODE.AmmoNames[lower])
		viewer.m_AmmoType:PerformLayout()

		local ki = killicon.Get(GAMEMODE.AmmoIcons[lower])

		viewer.m_AmmoIcon:SetImage(ki[1])
		if ki[2] then viewer.m_AmmoIcon:SetImageColor(ki[2]) end

		viewer.m_AmmoIcon:SetVisible(true)
	else
		viewer.m_AmmoType:SetText("")
		viewer.m_AmmoIcon:SetVisible(false)
	end

	if not viewer.m_Recipe1 then
		local recipe = EasyLabel(viewer, "", "ZSBodyTextFont", COLOR_TAN)
		recipe:SetContentAlignment(8)
		recipe:SetSize(viewer:GetWide(), 16 * screenscale)
		recipe:MoveBelow(viewer.ItemStatBars[6], 20)
		viewer.m_Recipe1 = recipe
	end

	if not viewer.m_Recipe2 then
		local recipe = EasyLabel(viewer, "", "ZSBodyTextFont", COLOR_TAN)
		recipe:SetContentAlignment(8)
		recipe:SetSize(viewer:GetWide(), 16 * screenscale)
		recipe:MoveBelow(viewer.m_Recipe1, 20)
		viewer.m_Recipe2 = recipe
	end

	viewer.m_Recipe1:SetText(comps and (
		GAMEMODE.ZSInventoryItemData[comps[1]].PrintName
	) or "")

	viewer.m_Recipe2:SetText(comps and (
		weapons.Get(comps[2]).PrintName
	) or "")
end

function MakepWeapons(silent)
	if not silent then
		PlayMenuOpenSound()
	end

	if pWeapons then
		pWeapons:SetAlpha(0)
		pWeapons:AlphaTo(255, 0.15, 0)
		pWeapons:SetVisible(true)
		pWeapons:MakePopup()
		return
	end

	local added = {}
	local addedcat = {}

	local weps = {}
	local crafts = {}

	for _, tab in ipairs(GAMEMODE.Items) do
		if tab.SWEP and not added[tab.SWEP] then
			if weapons.Get(tab.SWEP) then
				weps[#weps + 1] = tab.SWEP
				added[tab.SWEP] = true
				addedcat[tab.SWEP] = tab.Category
			end
		end
	end

	for wep, comps in pairs(GAMEMODE.Assemblies) do
		if not added[wep] then
			if weapons.Get(wep) then
				crafts[#crafts + 1] = wep
				added[wep] = true
			end
		end
	end

	local screenscale = BetterScreenScale()
	local wid, hei = math.min(ScrW(), 700) * screenscale, math.min(ScrH(), 700) * screenscale
	local tabhei = 24 * screenscale

	local frame = vgui.Create("DFrame")
	frame:SetDeleteOnClose(false)
	frame:SetSize(wid, hei)
	frame:SetTitle(" ")
	frame:Center()
	frame.SetWeaponViewerSWEP = SetWeaponViewerSWEP
	pWeapons = frame

	local y = 8

	local title = EasyLabel(frame, "Weapon Database", "ZSHUDFont", color_white)
	title:SetPos(wid * 0.5 - title:GetWide() * 0.5, y)
	y = y + title:GetTall() + 8

	local propertysheet = vgui.Create("DPropertySheet", frame)

	propertysheet:SetSize(wid * 0.4 - 8, hei - title:GetTall() - 32 * screenscale)
	propertysheet:MoveBelow(title, 16 * screenscale)
	propertysheet:SetPadding(1)

	local tree = vgui.Create("DTree", propertysheet)
	tree:SetWide(propertysheet:GetWide() - 16)
	tree:SetBackgroundColor(COLOR_DARK)
	local sheet = propertysheet:AddSheet("Guns", tree, nil, false, false)
	sheet.Panel:SetPos(0, tabhei + 2)
	tree:SetIndentSize(4)
	frame.TierTree = tree

	local tree = vgui.Create("DTree", propertysheet)
	tree:SetWide(propertysheet:GetWide() - 16)
	tree:SetBackgroundColor(COLOR_DARK)
	local sheet = propertysheet:AddSheet("Melee", tree, nil, false, false)
	sheet.Panel:SetPos(0, tabhei + 2)
	tree:SetIndentSize(4)
	frame.MeleeTierTree = tree

	local tree = vgui.Create("DTree", propertysheet)
	tree:SetWide(propertysheet:GetWide() - 16)
	tree:SetBackgroundColor(COLOR_DARK)
	local sheet = propertysheet:AddSheet("Tools/Other", tree, nil, false, false)
	sheet.Panel:SetPos(0, tabhei + 2)
	tree:SetIndentSize(4)
	frame.ToolTierTree = tree

	tree = vgui.Create("DTree", propertysheet)
	tree:SetWide(propertysheet:GetWide() - 16)
	tree:SetBackgroundColor(COLOR_DARK)
	sheet = propertysheet:AddSheet("Crafts", tree, nil, false, false)
	sheet.Panel:SetPos(0, tabhei + 2)
	tree:SetIndentSize(4)
	frame.CraftsTierTree = tree

	local scroller = propertysheet:GetChildren()[1]
	local dragbase = scroller:GetChildren()[1]
	local tabs = dragbase:GetChildren()

	GAMEMODE:ConfigureMenuTabs(tabs, tabhei)

	frame.ViewerY = y

	tiersorting  = frame.TierTree:AddNode("Tier 1")
	tiersorting2 = frame.TierTree:AddNode("Tier 2")
	tiersorting3 = frame.TierTree:AddNode("Tier 3")
	tiersorting4 = frame.TierTree:AddNode("Tier 4")
	tiersorting5 = frame.TierTree:AddNode("Tier 5")
	Meleetiersorting  = frame.MeleeTierTree:AddNode("Tier 1")
	Meleetiersorting2 = frame.MeleeTierTree:AddNode("Tier 2")
	Meleetiersorting3 = frame.MeleeTierTree:AddNode("Tier 3")
	Meleetiersorting4 = frame.MeleeTierTree:AddNode("Tier 4")
	Meleetiersorting5 = frame.MeleeTierTree:AddNode("Tier 5")
	Tooltiersorting   = frame.ToolTierTree:AddNode("Tools")
	deployablesorting = frame.ToolTierTree:AddNode("Deployables")
	throwablesorting = frame.ToolTierTree:AddNode("Throwables")

	craftstiersorting  = frame.CraftsTierTree:AddNode("Tier 1")
	craftstiersorting2 = frame.CraftsTierTree:AddNode("Tier 2")
	craftstiersorting3 = frame.CraftsTierTree:AddNode("Tier 3")
	craftstiersorting4 = frame.CraftsTierTree:AddNode("Tier 4")
	craftstiersorting5 = frame.CraftsTierTree:AddNode("Tier 5")
	craftstiersorting6 = frame.CraftsTierTree:AddNode("Tier 6")

	for _, wep in pairs(weps) do
		local enttab = weapons.Get(wep)
		local wepnode

		if enttab then
			if enttab.Tier == 1 and enttab.ConeMax then
			wepnode = tiersorting:AddNode(enttab.PrintName or wep)
			elseif enttab.Tier == 2 and enttab.ConeMax then
			wepnode = tiersorting2:AddNode(enttab.PrintName or wep)
		elseif enttab.Tier == 3 and enttab.ConeMax then
			wepnode = tiersorting3:AddNode(enttab.PrintName or wep)
		elseif enttab.Tier == 4 and enttab.ConeMax then
			wepnode = tiersorting4:AddNode(enttab.PrintName or wep)
		elseif enttab.Tier == 5 and enttab.ConeMax then
			wepnode = tiersorting5:AddNode(enttab.PrintName or wep)
		elseif enttab.Tier == 1 and enttab.IsMelee then
			wepnode = Meleetiersorting:AddNode(enttab.PrintName or wep)
		elseif enttab.Tier == 2 and enttab.IsMelee then
			wepnode = Meleetiersorting2:AddNode(enttab.PrintName or wep)
		elseif enttab.Tier == 3 and enttab.IsMelee then
			wepnode = Meleetiersorting3:AddNode(enttab.PrintName or wep)
		elseif enttab.Tier == 4  and enttab.IsMelee then
			wepnode = Meleetiersorting4:AddNode(enttab.PrintName or wep)
		elseif enttab.Tier == 5 and enttab.IsMelee then
			wepnode = Meleetiersorting5:AddNode(enttab.PrintName or wep)
		elseif enttab.GhostStatus or enttab.DeployClass or enttab.NoDeploySpeedChange or enttab.Primary.Ammo == "remantler" then
			wepnode = deployablesorting:AddNode(enttab.PrintName or wep)
		elseif enttab.AmmoIfHas and enttab.Base == "weapon_zs_basethrown" then
			wepnode = throwablesorting:AddNode(enttab.PrintName or wep)
		elseif enttab.Heal or enttab.HealRange or enttab.Primary.Ammo == "Battery" or enttab.HealStrength or enttab.TeleportStatus or enttab.Primary.Ammo == "SniperRound" then
			wepnode = Tooltiersorting:AddNode(enttab.PrintName or wep)
		else
			wepnode = tiersorting:AddNode(enttab.PrintName or wep)
		end
	end
		wepnode.SWEP = wep
		wepnode.DoClick = WeaponButtonDoClick
		wepnode.Category = addedcat[wep] or ITEMCAT_GUNS
	end


	for _, wep in pairs(crafts) do
		local enttab = weapons.Get(wep)
		local wepnode
		if enttab then
			if enttab.Tier == 1 then
				wepnode = craftstiersorting:AddNode(enttab.PrintName or wep)
				elseif enttab.Tier == 2 then
				wepnode = craftstiersorting2:AddNode(enttab.PrintName or wep)
			elseif enttab.Tier == 3 then
				wepnode = craftstiersorting3:AddNode(enttab.PrintName or wep)
			elseif enttab.Tier == 4 then
				wepnode = craftstiersorting4:AddNode(enttab.PrintName or wep)
			elseif enttab.Tier == 5 then
				wepnode = craftstiersorting5:AddNode(enttab.PrintName or wep)
			elseif enttab.Tier == 6 then
				wepnode = craftstiersorting6:AddNode(enttab.PrintName or wep)
			else
				wepnode = craftstiersorting:AddNode(enttab.PrintName or wep)
			end
		end

		wepnode.SWEP = wep
		wepnode.DoClick = WeaponButtonDoClick
		wepnode.Category = enttab.RequiredClip and ITEMCAT_GUNS or (enttab.Primary.Ammo == "none" and enttab.MeleeRange) and ITEMCAT_MELEE or ITEMCAT_TOOLS
		wepnode.Comps = GAMEMODE.Assemblies[wep]
	end

	frame:SetWeaponViewerSWEP()

	MakepWeapons(true)
end
