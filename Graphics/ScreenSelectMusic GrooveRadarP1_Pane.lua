local function radarSet(self)
	local selection = nil
	if GAMESTATE:IsCourseMode() then
		if GAMESTATE:GetCurrentCourse() then
			selection = GAMESTATE:GetCurrentTrail(PLAYER_1)
		end
	else
		if GAMESTATE:GetCurrentSong() then
			selection = GAMESTATE:GetCurrentSteps(PLAYER_1)
		end
	end
	if selection then
		self:SetFromRadarValues(PLAYER_1, selection:GetRadarValues(PLAYER_1))
	else
		self:SetEmpty(PLAYER_1)
	end
end

local t = Def.ActorFrame {
	CurrentSongChangedMessageCommand=function(self)
		local song = GAMESTATE:GetCurrentSong()
		if song then
-- 			self:setaux(0)
			self:finishtweening()
			self:playcommand("TweenOn")
		elseif not song and self:GetZoomX() == 1 then
-- 			self:setaux(1)
			self:finishtweening()
			self:playcommand("TweenOff")
		end
	end,
	Name="Radar",
	InitCommand=cmd(Center),

	Def.GrooveRadar {
		OnCommand=cmd(zoom,0;sleep,0.583;decelerate,0.150;zoom,1),
		OffCommand=cmd(sleep,0.00;decelerate,0.167;zoom,0),
		CurrentSongChangedMessageCommand=radarSet,
		CurrentStepsP1ChangedMessageCommand=radarSet,
		CurrentTrailP1ChangedMessageCommand=radarSet,
	},
}

return t