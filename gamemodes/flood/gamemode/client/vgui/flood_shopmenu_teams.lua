local x = ScrW()
local y = ScrH()
local g_ToolMenu = {}

local PANEL = {}
function MakepTeamMenu()
	local screenscale = BetterScreenScale()

	local TeamName = "Default"
	local TeamColor = Color(255, 0, 0, 255)
	local TeamIsJoinable = true

	local createteamdframe = vgui.Create("DFrame", self)
	createteamdframe:SetSize(625 * screenscale, 300 * screenscale)
	createteamdframe:Center()
	createteamdframe:SetTitle("")
	createteamdframe:SetDraggable(false)
	createteamdframe.Paint = function(self, w, h) 
		draw.RoundedBox(0, 0, 1, w, h, Color(0, 0, 0, 0)) 
		draw.RoundedBox(0, 0, 0, w, h, Color(24, 24, 24, 255))
	end
	if createteamdframe.btnMinim and createteamdframe.btnMinim:IsValid() then createteamdframe.btnMinim:SetVisible(false) end
	if createteamdframe.btnMaxim and createteamdframe.btnMaxim:IsValid() then createteamdframe.btnMaxim:SetVisible(false) end
	createteamdframe:MakePopup()

	local createteamsheet = vgui.Create("DPropertySheet", createteamdframe)
	createteamsheet:SetSize(587 * screenscale, 300 * screenscale)
	createteamsheet:SetPadding(1)
	createteamsheet.Paint = function(self, w, h) 
		draw.RoundedBox(0, 0, 1, w, h, Color(0, 0, 0, 0)) 
		draw.RoundedBox(0, 0, 0, w, h, Color(24, 24, 24, 255))
	end

	local createteampanel = vgui.Create("DPanel", createteamsheet)
	createteampanel:SetSize(587 * screenscale, 300 * screenscale)
	createteampanel.Paint = function(self, w, h) 
		draw.RoundedBox(0, 0, 1, w, h, Color(0, 0, 0, 0)) 
		draw.RoundedBox(0, 0, 0, w, h, Color(24, 24, 24, 255))
	end
	createteamsheet:AddSheet("Create Team", createteampanel, "icon16/group_add.png")

	local colpicker = vgui.Create("DColorMixer", createteampanel)
	colpicker:SetAlphaBar(false)
	colpicker:SetPalette(false)
	colpicker:SetSize(400 * screenscale, 190 * screenscale)
	colpicker:CenterHorizontal(0.62)
	colpicker:CenterVertical(0.4)
	colpicker.UpdateConVars = function(me, color)
		TeamColor = Color(color.r, color.g, color.b)
	end

	local lab = EasyLabel(createteampanel, "Pick Your Team Color", "DermaDefault")
	lab:CenterHorizontal(0.55)
	lab:CenterVertical(0.04)

	local teamnametextentry = vgui.Create("DTextEntry", createteampanel)
	teamnametextentry:SetSize(150 * screenscale, 40 * screenscale)
	teamnametextentry:CenterHorizontal(0.14)
	teamnametextentry:CenterVertical(0.15)
	teamnametextentry:SetPlaceholderText("Enter Team Name Here")
	teamnametextentry:SetEditable(true)
	teamnametextentry:GetUpdateOnType(true)
	teamnametextentry.OnChange = function(self)
		TeamName = self:GetValue()
		if #TeamName > 30 then -- limit the team name length to 30 characters
			TeamName = string.sub(TeamName, 1, 28)..".."
		end
	end

	local teaminviteonly = vgui.Create("DCheckBoxLabel", createteampanel)
	teaminviteonly:CenterHorizontal(0.12)
	teaminviteonly:CenterVertical(0.3)
	teaminviteonly:SetText("Invite Only")
	teaminviteonly:SetValue(false)
	function teaminviteonly:OnChange(val)
		if val then
			TeamIsJoinable = false
		else
			TeamIsJoinable = true
		end
	end
	teaminviteonly:SizeToContents()

	local createteambutton = vgui.Create("DButton", createteampanel)
	createteambutton:SetText("CREATE TEAM")
	createteambutton:SetSize(600 * screenscale, 25 * screenscale)
	createteambutton:CenterVertical(0.85)
	createteambutton.DoClick = function()
		PlayerCreateTeam(TeamName, TeamColor, LocalPlayer(), TeamIsJoinable)
		net.Start("flood_customteamcreation")
		net.WriteString(TeamName)
		net.WriteColor(TeamColor)
		net.WriteEntity(LocalPlayer())
		net.WriteBool(TeamIsJoinable)
		net.SendToServer()

		createteamdframe:Close() -- this is used to update the join team panel without calling this function repeatedly
		MakepTeamMenu()
	end

	local jointeampanel = vgui.Create("DScrollPanel", createteamsheet)
	jointeampanel:SetSize(587 * screenscale, 300 * screenscale)
	jointeampanel.Paint = function(self, w, h) 
		draw.RoundedBox(0, 0, 1, w, h, Color(0, 0, 0, 0)) 
		draw.RoundedBox(0, 0, 0, w, h, Color(24, 24, 24, 255))
	end
	jointeampanel:Dock(FILL)
	createteamsheet:AddSheet("Join A Team", jointeampanel, "icon16/group_go.png")

	local count = 2
	local test = 0
	local allteamtable = team.GetAllTeams()
	PrintTable(allteamtable)
	for k, v in pairs(allteamtable) do
		count = count + 1

		if team.Valid(count) then -- simple way to filter out default teams like spectator.
			local teambuttoncolor = team.GetColor(count)
			local isjoinabletest

			if team.Joinable(count) then
				isjoinabletest = "Joinable"
			else
				isjoinabletest = "Invite Only"
			end

			jointeamcollapsible = vgui.Create("DCollapsibleCategory", jointeampanel)
			jointeamcollapsible:SetSize(400 * screenscale, 40 * screenscale)
			jointeamcollapsible:Dock(TOP)
			jointeamcollapsible:DockMargin(4,0,0,0)
			jointeamcollapsible:SetLabel(team.GetName(count) .. "  Player Count:  " .. team.NumPlayers(count) .. " /  4" .. "  " .. isjoinabletest)
			jointeamcollapsible:Toggle()
			jointeamcollapsible.Paint = function(self, w, h)
				draw.RoundedBox(0, 0, 0, w, h, Color(teambuttoncolor.r, teambuttoncolor.g, teambuttoncolor.b, 170))
			end

			collapsibleparentpanel = vgui.Create("DPanelList", jointeampanel)
			collapsibleparentpanel:SetSpacing(5)
			collapsibleparentpanel:EnableHorizontal(false)
			collapsibleparentpanel:EnableVerticalScrollbar(true)
			collapsibleparentpanel.Paint = function(self, w, h)
				draw.RoundedBox(0, 0, 0, w, h, Color(24, 24, 24, 255))
			end
			jointeamcollapsible:SetContents(collapsibleparentpanel)

			if team.Joinable(count) == true then
				collapsiblebutton = vgui.Create("DButton", jointeampanel)
				collapsiblebutton:SetSize(400 * screenscale, 20 * screenscale)
				collapsiblebutton:SetText("JOIN TEAM")
				collapsiblebutton.Paint = function(self, w, h) 
					draw.RoundedBox(0, 0, 1, w, h, Color(0, 0, 0, 0)) 
					draw.RoundedBox(0, 0, 0, w, h, Color(64, 64, 64, 255))
				end
				collapsibleparentpanel:AddItem(collapsiblebutton)
		    end
		end
	end




	local manageteampanel = vgui.Create("DPanel", createteamsheet)
	manageteampanel:SetSize(587 * screenscale, 300 * screenscale)
	manageteampanel.Paint = function(self, w, h) 
		draw.RoundedBox(0, 0, 1, w, h, Color(0, 0, 0, 0)) 
		draw.RoundedBox(0, 0, 0, w, h, Color(24, 24, 24, 255))
	end
	createteamsheet:AddSheet("Manage Your Team", manageteampanel, "icon16/group_edit.png")
end