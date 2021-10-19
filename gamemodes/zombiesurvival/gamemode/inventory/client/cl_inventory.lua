GM.ZSInventory = {}

INVCAT_TRINKETS = 1
INVCAT_COMPONENTS = 2
INVCAT_CONSUMABLES = 3

local meta = FindMetaTable("Player")
function meta:GetInventoryItems()
	return GAMEMODE.ZSInventory
end

function meta:HasInventoryItem(item)
	return GAMEMODE.ZSInventory[item] and GAMEMODE.ZSInventory[item] > 0
end

net.Receive("zs_inventoryitem", function()
	local item = net.ReadString()
	local count = net.ReadInt(5)
	local prevcount = GAMEMODE.ZSInventory[item] or 0

	GAMEMODE.ZSInventory[item] = count

	if GAMEMODE.InventoryMenu and GAMEMODE.InventoryMenu:IsValid() then
		if count > prevcount then
			GAMEMODE:InventoryAddGridItem(item, GAMEMODE:GetInventoryItemType(item))
		else
			GAMEMODE:InventoryRemoveGridItem(item)
		end
	end

	if MySelf and MySelf:IsValid() then
		MySelf:ApplyTrinkets()
	end
end)

net.Receive("zs_wipeinventory", function()
	GAMEMODE.ZSInventory = {}

	if GAMEMODE.InventoryMenu and GAMEMODE.InventoryMenu:IsValid() then
		GAMEMODE:InventoryWipeGrid()
	end

	MySelf:ApplyTrinkets()
end)

local function TryCraftWithComponent(me)
	net.Start("zs_trycraft")
		net.WriteString(me.Item)
		net.WriteString(me.WeaponCraft)
	net.SendToServer()
end

local function ItemPanelDoClick(self)
	local item = self.Item
	if not item then return end

	local category, sweptable = self.Category
	if category == INVCAT_WEAPONS then
		sweptable = weapons.Get(item)
	else
		sweptable = GAMEMODE.ZSInventoryItemData[item]
	end

	local viewer = GAMEMODE.m_InvViewer
	local screenscale = BetterScreenScale()

	if self.On then
		if viewer and viewer:IsValid() then
			viewer:SetVisible(false)
		end

		self.On = false

		GAMEMODE.InventoryMenu.SelInv = false
		GAMEMODE:DoAltSelectedItemUpdate()
		return
	else
		for _, v in pairs(self:GetParent():GetChildren()) do
			v.On = false
		end
		self.On = true

		GAMEMODE.InventoryMenu.SelInv = item
		GAMEMODE:DoAltSelectedItemUpdate()
	end

	GAMEMODE:CreateInventoryInfoViewer()

	viewer = GAMEMODE.m_InvViewer
	viewer.m_Title:SetText(sweptable.PrintName)
	viewer.m_Title:PerformLayout()

	local desctext = sweptable.Description or ""
	if category == INVCAT_WEAPONS then
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

		local canammo = false
		if sweptable.Primary then
			local ammotype = sweptable.Primary.Ammo
			if GAMEMODE.AmmoToPurchaseNames[ammotype] then
				canammo = true
			end
		end

		if canammo and GAMEMODE.AmmoNames[string.lower(sweptable.Primary.Ammo)] then
			viewer.m_AmmoType:SetText(GAMEMODE.AmmoNames[string.lower(sweptable.Primary.Ammo)])
			viewer.m_AmmoType:PerformLayout()
		else
			viewer.m_AmmoType:SetText("")
		end
	else
		viewer.ModelPanel:SetModel("")
		viewer.m_VBG:SetVisible(false)

		viewer.m_Desc:MoveBelow(viewer.m_Title, 20)
		viewer.m_Desc:SetFont("ZSBodyTextFontBig")

		viewer.m_AmmoType:SetText("")
	end
	viewer.m_Desc:SetText(desctext)

	GAMEMODE:ViewerStatBarUpdate(viewer, category ~= INVCAT_WEAPONS, sweptable)

	for i = 1, 4 do
		local crab, cral = viewer.m_CraftBtns[i][1], viewer.m_CraftBtns[i][2]

		crab:SetVisible(false)
		cral:SetVisible(false)
	end

	local assembles = {}

	for k,v in pairs(GAMEMODE.Assemblies) do
		if v[1] == item then
			assembles[v[2]] = k
		end
		if v[1] == item and v[3] then
			assembles[v[3]] = k
		end
		if v[1] == item and v[4] then
			assembles[v[4]] = k
		end
		if v[1] == item and v[5] then
			assembles[v[5]] = k
		end
	end

	local count = 0
	for k,v in pairs(assembles) do
		count = count + 1

		local crab, cral = viewer.m_CraftBtns[count][1], viewer.m_CraftBtns[count][2]
		local iitype = GAMEMODE:GetInventoryItemType(k) ~= -1

		crab.Item = item
		crab.WeaponCraft = k
		crab.DoClick = TryCraftWithComponent
		crab:SetPos(viewer:GetWide() / 1.5 - crab:GetWide() / 1.5, (viewer:GetTall() - 20 * screenscale) - (count - 1) * 20 * screenscale)
		crab:SetVisible(true)

		cral:SetText((iitype and GAMEMODE.ZSInventoryItemData[k] or weapons.Get(k)).PrintName)
		cral:SetPos(crab:GetWide() / 1.5 - cral:GetWide() / 1.5, (crab:GetTall() * 0.3 - cral:GetTall() * 0.3))
		cral:SetContentAlignment(5)
		cral:SetVisible(true)
	end

	if count > 0 then
		viewer.m_CraftWith:SetPos(viewer:GetWide() / 1.5 - viewer.m_CraftWith:GetWide() / 1.5, (viewer:GetTall() - 20 * screenscale) - 20 * count * screenscale)
		viewer.m_CraftWith:SetContentAlignment(5)
		viewer.m_CraftWith:SetVisible(true)
	else
		viewer.m_CraftWith:SetVisible(false)
	end
end

local categorycolors = {
	[INVCAT_TRINKETS] = {COLOR_RED, COLOR_DARKRED},
	[INVCAT_COMPONENTS] = {COLOR_BLUE, COLOR_DARKBLUE},
	[INVCAT_CONSUMABLES] = {COLOR_YELLOW, COLOR_DARKYELLOW}
}
local colBG = Color(10, 10, 10, 252)
local colBGH = Color(200, 200, 200, 5)
local function ItemPanelPaint(self, w, h)
	draw.RoundedBox(2, 0, 0, w, h, (self.Depressed or self.On) and categorycolors[self.Category][1] or categorycolors[self.Category][2])
	draw.RoundedBox(2, 2, 2, w - 4, h - 4, colBG)
	if self.On or self.Hovered then
		draw.RoundedBox(2, 2, 2, w - 4, h - 4, colBGH)
	end

	return true
end

function GM:CreateInventoryInfoViewer()
	if self.m_InvViewer and self.m_InvViewer:IsValid() then
		self.m_InvViewer:SetVisible(true)
		return
	end

	local leftframe = self.InventoryMenu
	local viewer = vgui.Create("DFrame")

	local screenscale = BetterScreenScale()

	viewer:SetDeleteOnClose(false)
	viewer:SetTitle(" ")
	viewer:SetDraggable(false)
	if viewer.btnClose and viewer.btnClose:IsValid() then viewer.btnClose:SetVisible(false) end
	if viewer.btnMinim and viewer.btnMinim:IsValid() then viewer.btnMinim:SetVisible(false) end
	if viewer.btnMaxim and viewer.btnMaxim:IsValid() then viewer.btnMaxim:SetVisible(false) end

	viewer:SetSize(leftframe:GetWide() / 1.15, leftframe:GetTall())
	viewer:MoveRightOf(leftframe, 32)
	viewer:MoveAbove(leftframe, -leftframe:GetTall())
	self.m_InvViewer = viewer

	self:CreateItemViewerGenericElems(viewer)

	local craftbtns = {}
	for i = 1, 4 do
		local craftb = vgui.Create("DButton", viewer)
		craftb:SetText("")
		craftb:Dock(BOTTOM)
	    craftb:DockMargin(4, 0, 0, 0)
		craftb:SetSize(viewer:GetWide() / 1.15, 27 * screenscale)
		craftb:SetVisible(false)

		local namelab = EasyLabel(craftb, "...", "ZSBodyTextFont", COLOR_WHITE)
		namelab:SetWide(craftb:GetWide())
		namelab:SetVisible(false)

		craftbtns[i] = {craftb, namelab}
	end
	viewer.m_CraftBtns = craftbtns

	local craftwith = EasyLabel(viewer, "Craft With...", "ZSBodyTextFontBig", COLOR_WHITE)
	craftwith:SetSize(viewer:GetWide() / 1.15, 27 * screenscale)
	craftwith:Dock(BOTTOM)
	craftwith:DockMargin(4, 0, 0, 0)
	craftwith:SetVisible(false)
	viewer.m_CraftWith = craftwith
end

local NumToRomanNumeral = {
	"I", "II", "III", "IV", "V", "VI"
}

function GM:InventoryAddGridItem(item, category)
	local screenscale = BetterScreenScale()
	local grid = self.InventoryMenu.Grid

	--draw the box around the trinkets
	local itempan = vgui.Create("DButton")
	itempan:SetText("")
	itempan:SetSize(175 * screenscale, 70 * screenscale)
	itempan.Paint = ItemPanelPaint
	itempan.DoClick = ItemPanelDoClick
	itempan.Item = item
	itempan.Category = category

	grid:AddItem(itempan)
	grid:SortByMember("Category")

	--draw the trinket icon
	local mdlframe = vgui.Create("DPanel", itempan)
	mdlframe:SetSize(70 * screenscale, 35 * screenscale)
	mdlframe:Center()
	mdlframe:SetMouseInputEnabled(false)
	mdlframe.Paint = function() end

	--trinket name label on the bottom
	local trinketname = EasyLabel(itempan, "", "ZSHUDFontSmaller", COLOR_WHITE)
	trinketname:CenterHorizontal(0.8)
	trinketname:CenterVertical(0.8)

	--trinket tier label on the top
	local trinkettier = EasyLabel(itempan, "", "ZSHUDFontSmaller", COLOR_WHITE)
	trinkettier:CenterHorizontal(0.35)
	trinkettier:CenterVertical(0.25)

	--grab trinket name, position the text
	if category == INVCAT_TRINKETS or INVCAT_COMPONENTS then
		local name = GAMEMODE.ZSInventoryItemData[item].PrintName
		trinketname:SetText(name)
		trinketname:SetFont("DefaultFont")
		trinketname:SizeToContents()
		trinketname:CenterHorizontal(0.5)
		trinketname:CenterVertical(0.8)
	end
	
	--grab trinket tier, position the text
	if category == INVCAT_TRINKETS then
		local tier = GAMEMODE.ZSInventoryItemData[item].Tier or 1
		trinkettier:SetText(NumToRomanNumeral[tier])
		trinkettier:SizeToContents()
		trinkettier:CenterHorizontal(0.92)
		trinkettier:CenterVertical(0.25)
	end

	--grab killicon for trinket
	local kitbl = killicon.Get(category == INVCAT_TRINKETS and "weapon_zs_trinket" or "weapon_zs_craftables")
	if kitbl then
		self:AttachKillicon(kitbl, itempan, mdlframe)
	end
end

function GM:InventoryRemoveGridItem(item)
	local grid = self.InventoryMenu.Grid
	for k, v in pairs(grid:GetChildren()) do
		if v.Item == item then
			grid:RemoveItem(v)
			break
		end
	end
	grid:SortByMember("Category")

	if self.InventoryMenu.SelInv == item then
		if self.m_InvViewer and self.m_InvViewer:IsValid() and self.InventoryMenu.SelInv then
			self.m_InvViewer:SetVisible(false)
		end

		self.InventoryMenu.SelInv = nil
		self:DoAltSelectedItemUpdate()
	end
end

function GM:InventoryWipeGrid()
	local grid = self.InventoryMenu.Grid
	for k, v in pairs(grid:GetChildren()) do
		grid:RemoveItem(v)
	end

	if self.m_InvViewer and self.m_InvViewer:IsValid() then
		self.m_InvViewer:SetVisible(false)
	end

	self.InventoryMenu.SelInv = nil
	self:DoAltSelectedItemUpdate()
end

function GM:OpenInventory()
	if self.InventoryMenu and self.InventoryMenu:IsValid() then
		self.InventoryMenu:SetVisible(true)

		if self.m_InvViewer and self.m_InvViewer:IsValid() and self.InventoryMenu.SelInv then
			self.m_InvViewer:SetVisible(true)
		end
		return
	end

	local screenscale = BetterScreenScale()
	local offset = 64 * screenscale
	local wid, hei = math.max(400, math.min(ScrW(), 400) * screenscale), math.min(ScrH(), 400) * screenscale

	local frame = vgui.Create("DFrame")
	frame:SetSize(wid, hei)
	frame:CenterHorizontal(0.42)
	frame:CenterVertical(0.45)
	frame:SetDeleteOnClose(false)
	frame:SetTitle(" ")
	frame:SetDraggable(false)

	if frame.btnClose and frame.btnClose:IsValid() then frame.btnClose:SetVisible(false) end
	if frame.btnMinim and frame.btnMinim:IsValid() then frame.btnMinim:SetVisible(false) end
	if frame.btnMaxim and frame.btnMaxim:IsValid() then frame.btnMaxim:SetVisible(false) end

	self.InventoryMenu = frame

	local topspace = vgui.Create("DPanel", frame)
	topspace:SetWide(wid - 16)
		
	local title = EasyLabel(topspace, "Inventory", "ZSHUDFontSmall", COLOR_WHITE)
	title:CenterHorizontal()

	local _, y = title:GetPos()
	topspace:SetTall(y + title:GetTall() + 2)
	topspace:AlignTop(8)
	topspace:CenterHorizontal()

	local scroll = vgui.Create("DScrollPanel", frame)
	scroll:SetSize(frame:GetWide(), frame:GetTall() - offset - 32)
	scroll:SetPos(0, offset)
	
	--setpos might be useless for positioning, could have done it with centerhorizontal/centervertical but im lazy lol
	local invgrid = vgui.Create("DGrid", scroll)
	invgrid:SetSize(wid - 24 * screenscale, frame:GetTall() - 16 - topspace:GetTall())
	invgrid:MoveBelow(topspace, 16)
	invgrid:SetCols(2)
	invgrid:SetColWide((50 + (invgrid:GetWide() - 50*-2.75) / 4) * screenscale)
	invgrid:SetRowHeight(75 * screenscale)
	invgrid:Center()
	invgrid:SetPos(0, 0)
	frame.Grid = invgrid

	for item, count in pairs(self.ZSInventory) do
		if count > 0 then
			for i = 1, count do
				self:InventoryAddGridItem(item, self:GetInventoryItemType(item))
			end
		end
	end
	invgrid:SortByMember("Category")
	frame:MakePopup()
end
