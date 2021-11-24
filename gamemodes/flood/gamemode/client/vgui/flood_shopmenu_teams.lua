local x = ScrW()
local y = ScrH()
local g_ToolMenu = {}

surface.CreateFont( "PlayerNameFont", {
	font = "Arial",
	size = 36,
	weight = 1500
})

surface.CreateFont( "OtherInfoFont", {
	font = "Arial",
	size = 20,
	weight = 900
})

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

	local allteamtable = team.GetAllTeams()	
	local list = vgui.Create("DPanelList", jointeampanel)
	list:SetSize((587 - 6) * screenscale, jointeampanel:GetTall() - (76 * screenscale))
	list:SetPos(6, 0)
	list:EnableVerticalScrollbar()
	list:SetSpacing(-2)
	list.Paint = function(self, w, h)
		surface.SetDrawColor(0, 0, 0, 0)
		surface.DrawRect(0, 0, w, h)
	end
	
	local e = 0
	local numPlayers = 0
	
	for k, v in pairs(allteamtable) do
		numPlayers = team.NumPlayers(k)
		
		if numPlayers > 0 then
			if team.Valid(k) and k > 2 and k < 1001 then -- simple way to filter out default teams like spectator.
				local teambuttoncolor = team.GetColor(k)
				
				local teamBox = vgui.Create("DPanel", list)
				teamBox:SetSize((574 - 6) * screenscale, (40 * screenscale) + (78 * math.min(numPlayers, 2)))
				teamBox:SetPos(0, 38 * screenscale * e)
				teamBox.Paint = function(self, w, h)
					surface.SetDrawColor(0, 0, 0, 0)
					surface.DrawRect(0, 0, w, h)
				end
				
				local teamTitle = vgui.Create("DPanel", teamBox)
				teamTitle:SetSize((574 - 6) * screenscale, 40 * screenscale)
				teamTitle:SetPos(0, 0)
				teamTitle.Paint = function(self, w, h)
					surface.SetDrawColor(team.GetColor(k))
					surface.DrawRect(0, 0, w, h)
					surface.SetDrawColor(255, 255, 255, 255)
					surface.DrawOutlinedRect(0, 0, w, h, 2)
				end
				
				
				local teamText = vgui.Create("DLabel", teamTitle)
				teamText:SetText(team.GetName(k))
				teamText:SizeToContents()
				teamText:Center()
				teamText:SetTextColor(Color(0, 0, 0, 255))
				local color = team.GetColor(k)
				if ((color.r + color.g + color.b) / 3) < 127 then
					teamText:SetTextColor(Color(255, 255, 255, 255))
				end
				
				local players = team.GetPlayers(k)
				for i = 1, math.min(numPlayers + 1, 4) do
					if i <= numPlayers then
						local playerBox = vgui.Create("DPanel", teamBox)
						playerBox:SetSize((574 - 4) * screenscale / 2, 80 * screenscale)
						playerBox:SetPos((1 - math.ceil((i / 2)-math.floor(i / 2))) * (572 - 6) * screenscale / 2, math.floor((i - 1) / 2) * 78 + 38)
						playerBox.Paint = function(self, w, h)
							surface.SetDrawColor(200, 200, 200, 255)
							surface.DrawRect(0, 0, w, h)
							surface.SetDrawColor(255, 255, 255, 255)
							surface.DrawOutlinedRect(0, 0, w, h, 2)
						end
						
						if IsValid(players[i]) then
							local avatarFrame = vgui.Create("DPanel", playerBox)
							avatarFrame:SetSize(76 * screenscale, 76 * screenscale)
							avatarFrame:SetPos(2, 2)
							avatarFrame.Paint = function(self, w, h)
								surface.SetDrawColor(0, 0, 0, 0)
								surface.DrawRect(0, 0, w, h)
							end	
							
							local infoFrame = vgui.Create("DPanel", playerBox)
							infoFrame:SetSize(((574 - 4) * screenscale / 2) - (80 * screenscale), 76 * screenscale)
							infoFrame:SetPos(78 * screenscale, 2)
							infoFrame.Paint = function(self, w, h)
								surface.SetDrawColor(0, 0, 0, 0)
								surface.DrawRect(0, 0, w, h)
							end	
							
						
							local avatar = vgui.Create("AvatarImage", avatarFrame)
							avatar:SetSize(76 * screenscale, 76 * screenscale)
							avatar:SetPos(0, 0)
							avatar:SetPlayer(players[i], 74)
							
							local name = vgui.Create("DLabel", infoFrame)
							name:SetText(players[i]:GetName())
							name:SetFont("PlayerNameFont")
							name:SizeToContents()
							name:SetTextColor(Color(0, 0, 0, 255)) --Set this to blue (0, 0, 255) if person is party leader.
							name:SetPos((infoFrame:GetWide() - name:GetWide()) / 2, 12)
							
							local level = vgui.Create("DLabel", infoFrame)
							level:SetText("Level " .. CalculateLevel(players[i]))
							level:SetFont("OtherInfoFont")
							level:SizeToContents()
							level:SetTextColor(Color(0, 0, 0, 255))
							level:SetPos((infoFrame:GetWide() - level:GetWide()) / 2, name:GetTall() + 8)
						end
					elseif team.Joinable(k) then
						local joinBox = vgui.Create("DPanel", teamBox)
						joinBox:SetSize((574 - 4) * screenscale / 2, 80 * screenscale)
						joinBox:SetPos((1 - math.ceil((i / 2)-math.floor(i / 2))) * (572 - 6) * screenscale / 2, math.floor((i - 1) / 2) * 78 + 38)
						joinBox.Paint = function(self, w, h)
							surface.SetDrawColor(200, 225, 200, 255)
							surface.DrawRect(0, 0, w, h)
							surface.SetDrawColor(255, 255, 255, 255)
							surface.DrawOutlinedRect(0, 0, w, h, 2)
						end
						
						local joinButton = vgui.Create("DButton", joinBox)
						joinButton:SetText("Join")
						joinButton:SetPos(0, 0)
						joinButton:SetSize(80, 32)
						joinButton:Center()
						joinButton.DoClick = function()
							--RunConsoleCommand
						end
					end
				end
				
				list:AddItem(teamBox)
				
				e = e + 1
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