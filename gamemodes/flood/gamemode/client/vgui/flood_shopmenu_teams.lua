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

	local pl = LocalPlayer()
	local createteambutton = vgui.Create("DButton", createteampanel)
	createteambutton:SetText("CREATE TEAM")
	createteambutton:SetSize(600 * screenscale, 25 * screenscale)
	createteambutton:CenterVertical(0.85)
	createteambutton.DoClick = function()
		PlayerCreateTeam(TeamName, TeamColor, LocalPlayer(), TeamIsJoinable)
		RunConsoleCommand("CreateTeam", TeamName, TeamColor.r, TeamColor.g, TeamColor.b, tostring(TeamIsJoinable))
		createteamdframe:Close() -- this is used to update the join team panel without calling this function repeatedly
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
		
		if numPlayers > 0 and not k == LocalPlayer():Team() then
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
				teamText:SetFont("OtherInfoFont")
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
							name2:SetTextColor(Color(0, 0, 0, 255)) --Set this to blue (0, 0, 255) if person is party leader.
							if LocalPlayer():GetNWBool("TeamLeader") then
								name2:SetTextColor(Color(0, 0, 255, 255))
							end
							name:SetPos((infoFrame:GetWide() - name:GetWide()) / 2, 12)
							
							local level = vgui.Create("DLabel", infoFrame)
							if not LocalPlayer():IsBot() then level:SetText("Level " .. CalculateLevel(players[i])) end
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
							RunConsoleCommand("JoinTeam", k)
						end
					end
				end
				
				list:AddItem(teamBox)
				
				e = e + 1
			end
		end
	end
	
	local myteam = LocalPlayer():Team()
	if team.Valid(myteam) and myteam > 2 and myteam < 1001 then
		local manageteampanel = vgui.Create("DPanel", createteamsheet)
		manageteampanel:SetSize(587 * screenscale, 300 * screenscale)
		manageteampanel.Paint = function(self, w, h) 
			draw.RoundedBox(0, 0, 1, w, h, Color(0, 0, 0, 0)) 
			draw.RoundedBox(0, 0, 0, w, h, Color(24, 24, 24, 255))
		end
		createteamsheet:AddSheet("Manage Your Team", manageteampanel, "icon16/group_edit.png")
		
		local players = team.GetPlayers(myteam)
		numPlayers = team.NumPlayers(myteam)
		
		local teamBox2 = vgui.Create("DPanel", manageteampanel)
		teamBox2:SetSize((574 - 6) * screenscale, (40 * screenscale) + (78 * math.min(numPlayers, 2)))
		teamBox2:SetPos(5, 7)
		teamBox2.Paint = function(self, w, h)
			surface.SetDrawColor(0, 0, 0, 0)
			surface.DrawRect(0, 0, w, h)
		end
					
		local teamTitle2 = vgui.Create("DPanel", teamBox2)
		teamTitle2:SetSize((574 - 6) * screenscale, 40 * screenscale)
		teamTitle2:SetPos(0, 0)
		teamTitle2.Paint = function(self, w, h)
			surface.SetDrawColor(team.GetColor(myteam))
			surface.DrawRect(0, 0, w, h)
			surface.SetDrawColor(255, 255, 255, 255)
			surface.DrawOutlinedRect(0, 0, w, h, 2)
		end
						
		local teamText2 = vgui.Create("DLabel", teamTitle2)
		teamText2:SetText(team.GetName(myteam))
		teamText2:SetFont("OtherInfoFont")
		teamText2:SizeToContents()
		teamText2:Center()
		teamText2:SetTextColor(Color(0, 0, 0, 255))
		local color = team.GetColor(myteam)
		if ((color.r + color.g + color.b) / 3) < 127 then
			teamText2:SetTextColor(Color(255, 255, 255, 255))
		end
		
		for i = 1, numPlayers do
			if i <= numPlayers then
				local playerBox2 = vgui.Create("DPanel", teamBox2)
				playerBox2:SetSize((574 - 4) * screenscale / 2, 80 * screenscale)
				playerBox2:SetPos((1 - math.ceil((i / 2)-math.floor(i / 2))) * (572 - 6) * screenscale / 2, math.floor((i - 1) / 2) * 78 + 38)
				playerBox2.Paint = function(self, w, h)
					surface.SetDrawColor(200, 200, 200, 255)
					surface.DrawRect(0, 0, w, h)
					surface.SetDrawColor(255, 255, 255, 255)
					surface.DrawOutlinedRect(0, 0, w, h, 2)
				end
							
				if IsValid(players[i]) then
					local avatarFrame2 = vgui.Create("DPanel", playerBox2)
					avatarFrame2:SetSize(76 * screenscale, 76 * screenscale)
					avatarFrame2:SetPos(2, 2)
					avatarFrame2.Paint = function(self, w, h)
						surface.SetDrawColor(0, 0, 0, 0)
						surface.DrawRect(0, 0, w, h)
					end	
								
					local infoFrame2 = vgui.Create("DPanel", playerBox2)
					infoFrame2:SetSize(((574 - 4) * screenscale / 2) - (80 * screenscale), 76 * screenscale)
					infoFrame2:SetPos(78 * screenscale, 2)
					infoFrame2.Paint = function(self, w, h)
						surface.SetDrawColor(0, 0, 0, 0)
						surface.DrawRect(0, 0, w, h)
					end	
								
					local avatar2 = vgui.Create("avatarImage", avatarFrame2)
					avatar2:SetSize(76 * screenscale, 76 * screenscale)
					avatar2:SetPos(0, 0)
					avatar2:SetPlayer(players[i], 74)
								
					local name2 = vgui.Create("DLabel", infoFrame2)
					name2:SetText(players[i]:GetName())
					name2:SetFont("PlayerNameFont")
					name2:SizeToContents()
					name2:SetTextColor(Color(0, 0, 0, 255)) --Set this to blue (0, 0, 255) if person is party leader.
					if LocalPlayer():GetNWBool("TeamLeader") then
						name2:SetTextColor(Color(0, 0, 255, 255))
					end
					name2:SetPos((infoFrame2:GetWide() - name2:GetWide()) / 2, 12)
							
					local level2 = vgui.Create("DLabel", infoFrame2)
					if not LocalPlayer():IsBot() then level2:SetText("Level " .. CalculateLevel(players[i])) end
					level2:SetFont("OtherInfoFont")
					level2:SizeToContents()
					level2:SetTextColor(Color(0, 0, 0, 255))
					level2:SetPos((infoFrame2:GetWide() - level2:GetWide()) / 2, name2:GetTall() + 8)
					
					if players[i] == LocalPlayer() then
						local leaveButton = vgui.Create("DImageButton", infoFrame2)
						leaveButton:SetTooltip("Leave the current team.")
						leaveButton:SetImage("icon16/delete.png")
						leaveButton:SetSize(16, 16)
						leaveButton:SetPos(infoFrame2:GetWide() - (leaveButton:GetWide() + 4), 4)  
						-- leaveButton.DoClick = function()
						-- RunConsoleCommand("JoinTeam", myteam)
					elseif players[i]:GetNWBool("TeamLeader") then
						local promoteButton = vgui.Create("DImageButton", infoFrame2)
						promoteButton:SetTooltip("Promote to team leader.")
						promoteButton:SetImage("icon16/shield_add.png")
						promoteButton:SetSize(16, 16)
						promoteButton:SetPos(infoFrame2:GetWide() - (promoteButton:GetWide() + 4), 4)  
						-- promoteutton.DoClick = function()
						-- RunConsoleCommand("JoinTeam", myteam)
						
						local kickButton = vgui.Create("DImageButton", infoFrame2)
						kickButton:SetTooltip("Kick player from team.")
						kickButton:SetImage("icon16/cross.png")
						kickButton:SetSize(16, 16)
						kickButton:SetPos(infoFrame2:GetWide() - (kickButton:GetWide() + 4), 8 + promoteButton:GetTall())  
						-- promoteutton.DoClick = function()
						-- RunConsoleCommand("JoinTeam", myteam)
					end
				end
			end
		end
	end
end