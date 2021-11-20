local x = ScrW()
local y = ScrH()
local g_ToolMenu = {}

local PANEL = {}
function MakepTeamMenu()
	local screenscale = BetterScreenScale()
	local createteampanel = vgui.Create("DFrame", self)

    local TeamName = "Default"
	local TeamColor = Color(255, 0, 0, 255)

	createteampanel:SetSize(600 * screenscale, 250 * screenscale)
	createteampanel:Center()
	createteampanel:SetTitle("")
	createteampanel.Paint = function(self, w, h) 
		draw.RoundedBox(0, 0, 1, w, h, Color(0, 0, 0, 0)) 
		draw.RoundedBox(0, 0, 0, w, h, Color(24, 24, 24, 255))
	end
	if createteampanel.btnMinim and createteampanel.btnMinim:IsValid() then createteampanel.btnMinim:SetVisible(false) end
	if createteampanel.btnMaxim and createteampanel.btnMaxim:IsValid() then createteampanel.btnMaxim:SetVisible(false) end
	createteampanel:MakePopup()

	local colpicker = vgui.Create("DColorMixer", createteampanel)
	colpicker:SetAlphaBar(false)
	colpicker:SetPalette(false)
	colpicker:SetSize(400 * screenscale, 190 * screenscale)
	colpicker:CenterHorizontal(0.6)
	colpicker:CenterVertical(0.47)
	colpicker.UpdateConVars = function(me, color)
		TeamColor = Color(color.r, color.g, color.b)
	end

	local lab = EasyLabel(createteampanel, "Pick Your Team Color", "DermaDefault")
	lab:CenterHorizontal(0.55)
	lab:CenterVertical(0.04)

	local teamnametextentry = vgui.Create("DTextEntry", createteampanel)
	teamnametextentry:SetSize(150 * screenscale, 40 * screenscale)
	teamnametextentry:CenterHorizontal(0.14)
	teamnametextentry:CenterVertical(0.17)
	teamnametextentry:SetPlaceholderText("Enter Team Name Here")
	teamnametextentry:SetEditable(true)
	teamnametextentry.OnEnter = function(self)
		TeamName = self:GetValue()
	end

	local createteambutton = vgui.Create("DButton", createteampanel)
	createteambutton:SetText("CREATE TEAM")
	createteambutton:SetSize(600 * screenscale, 25 * screenscale)
	createteambutton:CenterVertical(0.935)
	createteambutton.DoClick = function()
		net.Start("flood_customteamcreation")
		net.WriteString(TeamName)
		net.WriteColor(TeamColor)
		net.WriteEntity(LocalPlayer())
		net.SendToServer()
	end
end